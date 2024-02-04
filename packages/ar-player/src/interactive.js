import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import { BaseElement } from "./base.js";

export class ARElement extends BaseElement {
  static observedAttributes = ["model", "color"];

  constructor() {
    super();

    this.remove = null;

    this.selection = new THREE.Group();
  }

  /**
   * Runs when Element is instantiated
   * @description Handles loading and initialization of Three.js components
   */
  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.scene.add(this.selection);

    this.controller.addEventListener("select", this.on_select.bind(this));

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  on_select() {
    this.scene.add(container);
  }

  render(timestamp, frame) {
    if (frame) {
      this.raycaster_controller_update();
      this.hit_test(this.renderer, frame);
    }

    ThreeMeshUI.update();
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element-interactive", ARElement);
