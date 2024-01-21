import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

import { BaseElement } from "./base.js";

export class ARElement extends BaseElement {
  static observedAttributes = ["model", "color"];

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

  setColor(mesh, color) {
    const material = new THREE.MeshStandardMaterial({ color: color });
    this.setParameter(mesh, "material", material);
  }

  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "model") {
      const loader = new GLTFLoader();

      loader.load(newValue, (gltf) => {
        this.model = gltf.scene;
      });
    }

    if (name === "color") {
      this.setColor(this.model, newValue);
    }
  }
}

customElements.define("ar-element-editable", ARElement);
