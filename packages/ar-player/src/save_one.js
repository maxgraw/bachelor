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
    //const data = this.raycast(this.raycaster.controller, [this.cursor]);

    const container = new ThreeMeshUI.Block({
      height: 1,
      width: 1.2,
      contentDirection: "row",
      justifyContent: "space-around",
    });

    const option_one = new ThreeMeshUI.Block({
      height: 0.5,
      width: 0.5,
      backgroundColor: new THREE.Color("red"),
    });

    const option_two = new ThreeMeshUI.Block({
      height: 0.5,
      width: 0.5,
      backgroundColor: new THREE.Color("blue"),
    });

    container.add(option_one);
    container.add(option_two);

    const position = new THREE.Vector3();
    position.setFromMatrixPosition(this.cursor.matrix);
    container.position.copy(position);

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
