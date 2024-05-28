import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import { remove_menu } from "components/menus";
import { appendOptions } from "components/meshes";

import { BaseElement } from "../base";
import { hide, loadOptions, handleSelect } from "utils";

export class ARElement extends BaseElement {
	constructor() {
		super();

		// Select
		this.handleSelect = handleSelect;

		// Options
		this.loadOptions = loadOptions;
		this.options = [];

		// Selection
		this.selection = new THREE.Group();
		this.selected = null;

		// Append Options
		this.appendOptions = appendOptions;
		this.appendSelected = null;

		// Menus
		this.menus = {
			remove: remove_menu,
			create: null,
			shop: null,
		};
	}

	async connectedCallback() {
		// Set up
		this.init(this.renderer, this.scene);

		// Add Selection Group to Scene
		this.scene.add(this.selection);

		// Add Append Options to Scene
		this.scene.add(this.appendOptions);

		// Add menus to scene
		this.camera.add(this.menus.remove);
		hide(this.menus.remove);

		// Load Options
		await this.loadOptions(this.querySelectorAll("ar-option"));

		// Add Event Listeners
		this.controller.addEventListener("select", () => this.handleSelect());

		// Overwrite setAnimationLoop
		this.renderer.setAnimationLoop(this.render.bind(this));
	}

	render(timestamp, frame) {
		if (frame) {
			if (this.selection.children.length === 0) {
				this.hitTest(this.renderer, frame);
			}
		}

		ThreeMeshUI.update();

		this.renderer.render(this.scene, this.camera);
	}
}

ARElement.prototype[loadOptions] = loadOptions;
ARElement.prototype[handleSelect] = handleSelect;

customElements.define("ar-element-interactive", ARElement);
