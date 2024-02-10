import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import { BaseElement } from "./base.js";
import { create_menu } from "./components/create_menu.js";

export class ARElement extends BaseElement {
  static observedAttributes = ["model", "color"];

  constructor() {
    super();

    this.remove = null;

    this.selection = new THREE.Group();

    this.selected = null;

    this.create_position = null;

    this.create_menu = create_menu([
      {
        color: "yellow",
      },
      {
        color: "blue",
      },
      {
        color: "red",
      },
    ]);

    this.elements = [];
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
    const data = this.raycast(this.raycaster.controller, [
      this.cursor,
      ...this.create_menu.childrenUIs,
      ...this.elements,
    ]);

    console.log(data?.object?.isElement);

    if (data?.object?.isElement) {
      data.object.material.color = new THREE.Color("green");

      return;
    }

    if (data?.object?.isUI) {
      this.create_menu.visible = false;
      data.object.setState("selected");

      const mesh = new THREE.Mesh(
        new THREE.BoxGeometry(0.5, 0.5, 0.5),
        new THREE.MeshStandardMaterial({
          color: "red",
        })
      );

      mesh.isElement = true;

      mesh.position.copy(this.create_position);

      this.elements.push(mesh);
      this.scene.add(mesh);

      return;
    }

    if (data) {
      const position = new THREE.Vector3();
      position.setFromMatrixPosition(this.cursor.matrix);
      this.create_menu.position.copy(position);

      this.create_position = position;

      this.create_menu.visible = true;
      this.create_menu.position.y += 0.5;

      this.scene.add(this.create_menu);
    }
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
