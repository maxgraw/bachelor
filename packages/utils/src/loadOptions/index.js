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
