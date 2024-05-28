/**
 * Handle Selection Interaction
 * @param {import("../type").Config} config
 * @param {import("../type").Intersection} data
 * @description
 * When the user clicks on an object, this function will be called.
 * It will highlight the selected object.
 */
export function handleSelection(config, data) {
	if (config.selected) {
		config.selected.material.emissive.setHex(
			config.selected.userData.currentHex,
		);
	}

	config.selected = data.object;
	config.selected.userData.currentHex =
		config.selected.material.emissive.getHex();
	config.selected.material.emissive.setHex(0x00cdd4);
}
