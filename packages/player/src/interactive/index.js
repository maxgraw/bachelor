import ThreeMeshUI from "three-mesh-ui";

import { BaseElement } from "../base";

import { on_select } from "./modules";

export class ARElement extends BaseElement {
  static observedAttributes = ["options"];

  constructor() {
    super();

    this.on_select = on_select.bind(this);
  }

  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.controller.addEventListener("select", this.on_select);

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(`Attribute ${name} has changed.`);
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
