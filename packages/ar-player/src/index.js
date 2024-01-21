import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

import { BaseElement } from "./base.js";

export class ARElement extends BaseElement {
  static observedAttributes = ["model"];

  constructor() {
    super();

    this.model = null;
  }

  /**
   * Runs when Element is instantiated
   * @description Handles loading and initialization of Three.js components
   */
  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.controller.addEventListener("select", this.on_select.bind(this));

    this.renderer.setAnimationLoop(this.render.bind(this));
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

  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "model") {
      const loader = new GLTFLoader();

      loader.load(newValue, (gltf) => {
        this.model = gltf.scene;
      });
    }
  }
}

customElements.define("ar-element", ARElement);
