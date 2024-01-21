import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";

export class BaseElement extends HTMLElement {
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

  init(renderer, scene) {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.appendChild(renderer.domElement);
    shadow.appendChild(
      ARButton.createButton(renderer, { requiredFeatures: ["hit-test"] })
    );

    renderer.xr.enabled = true;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);

    const light = new THREE.DirectionalLight(0xffffff, 3);
    light.position.set(1, 1, 1).normalize();
    scene.add(light);

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

  render(timestamp, frame) {
    if (frame) {
    }
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("base-ar-element", BaseElement);
