import ThreeMeshUI from "three-mesh-ui";

import { BaseElement } from "./base";

export class ARElement extends BaseElement {
  constructor() {
    super();
  }

  connectedCallback() {
    this.init(this.renderer, this.scene);

    this.renderer.setAnimationLoop(this.render.bind(this));
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
