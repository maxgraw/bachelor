import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";
import { XREstimatedLight } from "three/addons/webxr/XREstimatedLight.js";

import { cursor } from "components/meshes";
import { no_cursor } from "components/menus";

import { hitTest, raycast, windowResize } from "utils";

export class BaseElement extends HTMLElement {
	constructor() {
		super();

		// Three.js Basic Setup
		this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
		this.scene = new THREE.Scene();
		this.camera = new THREE.PerspectiveCamera(
			50,
			window.innerWidth / window.innerHeight,
			0.1,
			10,
		);

		// Hit Test
		this.hitTest = hitTest;
		this.hitTestSource = null;
		this.hitTestSourceRequested = false;

		// Raycast
		this.raycast = raycast;

		// Window Resize
		this.windowResize = windowResize;

		// Cursor
		this.cursor = null;
		this.no_cursor = no_cursor;

		// Controller
		this.controller = this.renderer.xr.getController(0);

		// Raycaster
		this.raycaster = {
			controller: new THREE.Raycaster(),
		};
	}

	init(renderer, scene) {
		// Initialize Shadow DOM
		const shadow = this.attachShadow({ mode: "open" });
		shadow.appendChild(renderer.domElement);
		shadow.appendChild(
			ARButton.createButton(renderer, {
				requiredFeatures: ["hit-test"],
				optionalFeatures: ["light-estimation"],
			}),
		);

		// Renderer
		renderer.shadowMap.enabled = true;
		renderer.shadowMap.type = THREE.PCFSoftShadowMap;
		renderer.xr.enabled = true;
		renderer.setSize(window.innerWidth, window.innerHeight);
		renderer.setPixelRatio(window.devicePixelRatio);

		// Scene
		scene.add(this.camera);
		scene.add(this.controller);
		this.camera.add(this.no_cursor);

		// Light
		const defaultLight = new THREE.HemisphereLight(0xffffff, 0xbbbbff, 1);
		defaultLight.position.set(0.5, 1, 0.25);
		scene.add(defaultLight);

		const xrLight = new XREstimatedLight(renderer);

		xrLight.addEventListener("estimationstart", () => {
			scene.add(xrLight);
			scene.remove(defaultLight);
		});

		xrLight.addEventListener("estimationend", () => {
			scene.add(defaultLight);
			scene.remove(xrLight);
		});

		// Cursor
		this.cursor = cursor;
		this.cursor.matrixAutoUpdate = false;
		this.cursor.lookAt(this.camera);
		scene.add(this.cursor);

		// Raycaster
		this.raycaster.controller.layers.set(0);

		// Event Listeners
		window.addEventListener("resize", () => this.windowResize());
	}

	render(timestamp, frame) {
		this.renderer.render(this.scene, this.camera);
	}
}

BaseElement.prototype[hitTest] = hitTest;
BaseElement.prototype[raycast] = raycast;
BaseElement.prototype[windowResize] = windowResize;

customElements.define("ar-element-base", BaseElement);
