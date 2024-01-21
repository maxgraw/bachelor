import * as THREE from "three";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

import { BaseElement } from "./base.js";
import { REMOVE } from "./constant.js";

export class ARElement extends BaseElement {
  static observedAttributes = ["model", "color"];

  constructor() {
    super();

    this.model = null;

    this.remove = null;
  }

  /**
   * Runs when Element is instantiated
   * @description Handles loading and initialization of Three.js components
   */
  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.model = new THREE.Mesh(
      new THREE.BoxGeometry(0.5, 0.5, 0.5),
      new THREE.MeshStandardMaterial()
    );

    this.model.name = "model";

    this.remove = REMOVE;

    this.remove.name = "remove";
    this.remove.visible = false;

    this.scene.add(this.remove);

    this.controller.addEventListener("select", this.on_select.bind(this));

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  on_select() {
    const data = this.raycast(this.raycaster.controller, [
      this.model,
      this.remove,
    ]);

    if (!data) {
      this.remove.visible = false;
      this.setColor(this.model, 0xffffff);
      this.add_element(this.scene, this.model);

      return;
    }

    if (data.object.name === "remove") {
      this.scene.remove(this.model);
      this.remove.visible = false;

      return;
    }

    this.setColor(this.model, 0xff0000);
    this.remove.visible = true;
    this.remove.position.copy(this.model.position);
    this.remove.position.y += this.model.scale.y / 2;
  }

  test_headset() {}

  render(timestamp, frame) {
    if (frame) {
      this.raycaster_controller_update();
      this.hit_test(this.renderer, frame);
    }
    this.renderer.render(this.scene, this.camera);
  }

  setColor(mesh, color) {
    const material = new THREE.MeshStandardMaterial({ color: color });
    this.setParameter(mesh, "material", material);
  }

  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "color") {
      this.setColor(this.model, newValue);
    }
  }
}

customElements.define("ar-element-interactive", ARElement);
