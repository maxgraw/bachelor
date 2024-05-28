=== BaseElement <appendix-baseElement>
```js
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
```
#pagebreak()
=== ARElement <appendix-ARElement>
```js
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
```

#pagebreak()
=== Create Menu <appendix-createMenu>
```js
import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "../assets/Geist-Medium-msdf.json";
import FontImage from "../assets/Geist-Medium.png";

export const create_menu = (options) => {
	const container = new ThreeMeshUI.Block({
		contentDirection: "column",
		justifyContent: "space-around",
		backgroundOpacity: 0.9,
		backgroundColor: new THREE.Color("hsl(0, 0%, 40%)"),
		borderRadius: 0.02,
		fontFamily: FontJSON,
		fontTexture: FontImage,
		padding: 0.05,
	});

	options.forEach((option, index) => {
		const block = new ThreeMeshUI.Block({
			height: 0.2,
			width: 0.5,
			bestFit: "auto",
			backgroundColor: new THREE.Color("hsl(180, 100%, 30%)"),
			borderRadius: 0.03,
			justifyContent: "center",
			alignItems: "center",
			margin: 0.05,
		});

		const text = new ThreeMeshUI.Text({
			content: option.userData.name,
			fontSize: 0.1,
			fontColor: new THREE.Color("hsl(0, 0%, 95%)"),
		});

		text.userData.index = index;
		text.userData.isCreate = true;

		block.add(text);

		block.userData.index = index;
		block.userData.isCreate = true;

		container.add(block);
	});

	container.position.set(0, -1, -2);

	return container;
};
```
#pagebreak()
=== Menü "Löschen" <appendix-DeleteMenu>
```js	
import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "../assets/Geist-Medium-msdf.json";
import FontImage from "../assets/Geist-Medium.png";

const container = new ThreeMeshUI.Block({
	contentDirection: "column",
	justifyContent: "space-around",
	backgroundOpacity: 0,
	fontFamily: FontJSON,
	fontTexture: FontImage,
	padding: 0.05,
});

const menu = new ThreeMeshUI.Block({
	padding: 0.02,
	width: 1,
	height: 0.2,
	bestFit: "auto",
	backgroundColor: new THREE.Color("hsl(180, 100%, 30%)"),
	borderRadius: 0.03,
});

const text = new ThreeMeshUI.Text({
	content: "Löschen",
	fontSize: 0.2,
});

text.userData.isRemove = true;

menu.add(text);
menu.userData.isRemove = true;

container.add(menu);

container.position.set(0, -1, -2);

export { container as remove_menu };
```
#pagebreak()
=== handleSelect <appendix-handleSelect>
```js	
import { getType } from "../getType";
import { handleShop } from "../handleShop";
import { handleAppend } from "../handleAppend";
import { handleDisplay } from "../handleDisplay";
import { handleSelection } from "../handleSelection";
import { handleUI } from "../handleUI";

/**
 * Handle Select Interaction
 */
export async function handleSelect() {
	this.raycaster.controller.setFromXRController(this.controller);

	let options = [];

	if (this.menus.shop) {
		options = [
			...this.menus.remove.childrenUIs,
			...this.menus.shop.childrenUIs,
			...this.selection.children,
			...this.menus.create.childrenUIs,
			...this.appendOptions.children,
		];
	} else {
		options = [
			...this.menus.remove.childrenUIs,
			...this.selection.children,
			...this.menus.create.childrenUIs,
			...this.appendOptions.children,
		];
	}

	const data = this.raycast(this.raycaster.controller, options);

	const type = getType(data);

	if (type.selectable) {
		handleSelection(this, data);
		handleDisplay(this, {
			menu: {
				create: false,
				remove: true,
				shop: false,
			},
			appendOptions: true,
		});
		return;
	}

	if (type.appendOptions) {
		handleAppend(this, data);
		handleDisplay(this, {
			menu: {
				create: true,
				remove: false,
			},
			appendOptions: false,
		});
		return;
	}

	if (type.ui) {
		if (data.object.userData.isCreate) {
			handleUI(this, data);
		}

		if (data.object.userData.isRemove) {
			this.selection.remove(this.selected);
		}

		if (data.object.userData.isShop) {
			await handleShop(this);
		}

		handleDisplay(this, {
			menu: {
				create: false,
				remove: false,
				shop: true,
			},
			selected: false,
			appendOptions: false,
		});

		return;
	}

	if (this.selection.children.length === 0 && this.cursor.visible) {
		handleDisplay(this, {
			selected: false,
			menu: {
				create: true,
				remove: false,
				shop: false,
			},
			appendOptions: false,
		});
		return;
	}

	handleDisplay(this, {
		selected: false,
		menu: {
			create: false,
			remove: false,
			shop: true,
		},
		appendOptions: false,
	});
}
```
#pagebreak()
=== handleShop <appendix-handleShop>
```js	
/**
 * Handle Shop Interaction
 * @param {import("../type").Config} config
 * @description
 * When the user clicks on the shop button, this function will be called.
 * It will end the current XR session and redirect the user to the shop page
 * with the selected items in the cart.
 */
export const handleShop = async (config) => {
	// End the current XR session
	await config.renderer.xr.getSession().end();

	// Create a new URL
	const url = new URL("", "https://woocommerce.maxpaszke.de");
	url.searchParams.set("add-to-cart", "232");

	// Add the selected items to the cart
	for (const item of config.options) {
		const quantity = config.selection.children.filter(
			(child) => child.userData.id === item.userData.id,
		).length;

		if (quantity === 0) continue;

		url.searchParams.set(`quantity[${item.userData.id}]`, quantity);
	}

	// Redirect the user to the shop page
	window.location.href = url.href;
};
```
#pagebreak()
=== hitTest <appendix-hitTest>
```js	
import { hide } from "../hide";
import { show } from "../show";

function switchDisplay(display, config) {
	if (display) {
		show(config.cursor);
		hide(config.no_cursor);
		return;
	}

	show(config.no_cursor);
	hide(config.cursor);
}

export function hitTest(renderer, frame) {
	const referenceSpace = renderer.xr.getReferenceSpace();
	const session = renderer.xr.getSession();

	if (this.hitTestSourceRequested === false) {
		session.requestReferenceSpace("viewer").then((referenceSpace) => {
			session.requestHitTestSource({ space: referenceSpace }).then((source) => {
				this.hitTestSource = source;
			});
		});

		session.addEventListener("end", () => {
			this.hitTestSourceRequested = false;
			this.hitTestSource = null;
		});

		this.hitTestSourceRequested = true;
	}

	if (this.hitTestSource) {
		const hitTestResults = frame.getHitTestResults(this.hitTestSource);

		if (hitTestResults.length) {
			const hit = hitTestResults[0];

			switchDisplay(true, this);
			this.cursor.matrix.fromArray(
				hit.getPose(referenceSpace).transform.matrix,
			);
		} else {
			switchDisplay(false, this);
		}
	}
}
```
#pagebreak()
=== loadOptions <appendix-loadOptions>
```js	
import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";
import { create_menu } from "components/menus";
import { hide } from "../hide";

/**
 * Load options from the DOM and add to scene
 * @param {import("../type").Config["options"]} options
 */
export async function loadOptions(options) {
	const loader = new GLTFLoader();

	// Load all models asynchronously
	const gltfs = Promise.all(
		[...options].map((option) =>
			loader.loadAsync(option.getAttribute("model")),
		),
	);

	// Wait for all models to load
	const models = await gltfs;

	// Process each loaded model
	models.forEach((gltf, index) => {
		const model = gltf.scene.children[0];
		model.userData.name = [...options][index].getAttribute("name");
		model.userData.id = [...options][index].getAttribute("id");
		this.options.push(model);
	});

	// Create menu and add to scene
	this.menus.create = create_menu(this.options);
	this.camera.add(this.menus.create);
	hide(this.menus.create);
}
```