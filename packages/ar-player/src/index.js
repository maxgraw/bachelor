import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

export class ARElement extends HTMLElement {
  constructor() {
    super();

    // Base Three.js Components
    this.renderer = new THREE.WebGLRenderer({ alpha: true });
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(
      50,
      window.innerWidth / window.innerHeight,
      0.1,
      10
    );

    // Hit Test Helpers
    this.hitTestSource = null;
    this.hitTestSourceRequested = false;

    // Cursor
    this.cursor = null;

    // Controller
    this.controller = this.renderer.xr.getController(0);
  }

  /**
   * Runs when Element is instantiated
   * @description Handles loading and initialization of Three.js components
   */
  connectedCallback() {
    this.init_dom(this.renderer);
    this.init_renderer(this.renderer);
    this.init_scene(this.scene);
    this.init_cursor(this.scene);

    const model = this.getAttribute("model");

    const loader = new GLTFLoader();

    loader.load(model, (gltf) => {
      this.model = gltf.scene;
      
      var material = new THREE.MeshStandardMaterial({ color: 0xff0000 });
      this.model.traverse((o) => {
        if (o.isMesh) o.material = material;
      });
    });

    this.controller.addEventListener("select", this.on_select.bind(this));

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  /**
   * Initializes the DOM Elements
   * @param {THREE.WebGLRenderer} renderer
   * @description Attaches the renderer and ARButton to the Shadow DOM
   */
  init_dom(renderer) {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.appendChild(renderer.domElement);
    shadow.appendChild(
      ARButton.createButton(renderer, { requiredFeatures: ["hit-test"] })
    );
  }

  /**
   * Initializes the WebGLRenderer
   * @param {THREE.WebGLRenderer} renderer
   * @description Enables WebXR and sets the size of the renderer
   */
  init_renderer(renderer) {
    renderer.xr.enabled = true;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);
  }

  /**
   * Initializes the Three.js Scene
   * @param {THREE.Scene} scene
   * @description Adds a light to the scene
   */
  init_scene(scene) {
    const light = new THREE.DirectionalLight(0xffffff, 3);
    light.position.set(1, 1, 1).normalize();
    scene.add(light);
  }

  /**
   * Initializes the Cursor
   * @param {THREE.Scene} scene
   * @description Adds a ring geometry to the scene that will be used as the cursor
   */
  init_cursor(scene) {
    this.cursor = new THREE.Mesh(
      new THREE.RingGeometry(0.15, 0.2, 32).rotateX(-Math.PI / 2),
      new THREE.MeshBasicMaterial()
    );
    this.cursor.matrixAutoUpdate = false;
    this.cursor.visible = false;
    scene.add(this.cursor);
  }

  hit_test(renderer, frame) {
    const referenceSpace = renderer.xr.getReferenceSpace();
    const session = renderer.xr.getSession();

    if (this.hitTestSourceRequested === false) {
      session.requestReferenceSpace("viewer").then((referenceSpace) => {
        session
          .requestHitTestSource({ space: referenceSpace })
          .then((source) => {
            this.hitTestSource = source;
          });
      });

      session.addEventListener("end", () => {
        this.hitTestSourceRequested = false;
        this.hitTestSource = null;
      });

      this.hitTestSourceRequested = true;
    }

    if (this.hitTestSource) {
      const hitTestResults = frame.getHitTestResults(this.hitTestSource);

      if (hitTestResults.length) {
        const hit = hitTestResults[0];

        this.cursor.visible = true;
        this.cursor.matrix.fromArray(
          hit.getPose(referenceSpace).transform.matrix
        );
      } else {
        this.cursor.visible = false;
      }
    }
  }

  add_element(scene, mesh) {
    if (!this.cursor.visible) return;

    this.cursor.matrix.decompose(mesh.position, mesh.quaternion, mesh.scale);

    scene.add(mesh);
  }

  on_select() {
    this.add_element(this.scene, this.model);
  }

  render(timestamp, frame) {
    if (frame) {
      this.hit_test(this.renderer, frame);
    }
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element", ARElement);
