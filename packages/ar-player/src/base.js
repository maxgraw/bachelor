import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";

import { CURSOR } from "./models/cursor.js";

export class BaseElement extends HTMLElement {
  constructor() {
    super();

    // Base Three.js Components
    this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
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

    // Raycaster
    this.raycaster = {
      controller: new THREE.Raycaster(),
    };

    this.objects = [];
  }

  init(renderer, scene) {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.appendChild(renderer.domElement);
    shadow.appendChild(
      ARButton.createButton(renderer, {
        requiredFeatures: ["hit-test"],
      })
    );

    scene.add(this.camera);

    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.xr.enabled = true;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);

    // LIGHT

    const ambient_light = new THREE.AmbientLight(0xffffff, 0.9);
    scene.add(ambient_light);

    const point_light = new THREE.PointLight(0xffffff, 1, 20);
    this.camera.add(point_light);

    this.cursor = CURSOR;

    this.cursor.matrixAutoUpdate = false;
    this.cursor.visible = false;
    this.cursor.lookAt(this.camera);

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

  setParameter(mesh, parameter, value) {
    if (!mesh) return;

    mesh.traverse((child) => {
      if (child.isMesh) {
        child[parameter] = value;
      }
    });
  }

  raycaster_controller_update() {
    this.controller.updateMatrixWorld();
    const tempMatrix = new THREE.Matrix4();

    tempMatrix.identity().extractRotation(this.controller.matrixWorld);

    this.raycaster.controller.ray.origin.setFromMatrixPosition(
      this.controller.matrixWorld
    );

    this.raycaster.controller.ray.direction
      .set(0, 0, -1)
      .applyMatrix4(tempMatrix);
  }

  raycast(raycaster, element) {
    return element.reduce((closestIntersection, obj) => {
      const intersection = raycaster.intersectObject(obj, true);

      if (!intersection[0]) return closestIntersection;

      if (
        !closestIntersection ||
        intersection[0].distance < closestIntersection.distance
      ) {
        intersection[0].object = obj;

        return intersection[0];
      }

      return closestIntersection;
    }, null);
  }

  render(timestamp, frame) {
    if (frame) {
      this.raycaster_controller_update();
    }
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element-base", BaseElement);
