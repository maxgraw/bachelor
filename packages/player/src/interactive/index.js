import ThreeMeshUI from "three-mesh-ui";
import { BaseElement } from "../base";
import { add } from "components";
import { on_select, load_options } from "./modules";

export class ARElement extends BaseElement {
  static observedAttributes = ["options"];

  constructor() {
    super();

    this.on_select = on_select.bind(this);
    this.load_options = load_options.bind(this);

    this.options = [];

    this.selection = [];

    this.selected = null;

    this.add = add;

    this.menu = null;
  }

  connectedCallback() {
    this.init(this.renderer, this.scene);

    window.addEventListener("resize", this.window_resize);

    this.controller.addEventListener("select", this.on_select);

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  attributeChangedCallback(name, oldValue, newValue) {
    if (name === "options") {
      this.load_options(newValue);
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
