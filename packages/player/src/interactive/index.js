import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";
import { BaseElement } from "../base";
import { on_select } from "./modules";
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { create_menu } from "components";

export class ARElement extends BaseElement {
  static observedAttributes = ["options"];

  constructor() {
    super();

    this.on_select = on_select.bind(this);

    this.options = [];

    this.menu = null;
  }

  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.controller.addEventListener("select", this.on_select);

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "options") {
      const loader = new GLTFLoader();
      const values = newValue.split(",").map((option) => option.trim());

      Promise.all(values.map((option) => loader.loadAsync(option))).then(
        (gltfs) => {
          this.options = gltfs.map((gltf) => gltf.scene);

          this.menu = create_menu(this.options);
          this.menu.visible = false;
          this.scene.add(this.menu);
        }
      );
    }
  }

  render(timestamp, frame) {
    if (frame) {
      this.raycast_controller();
      this.hit_test(this.renderer, frame);
    }

    ThreeMeshUI.update();
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element-interactive", ARElement);
