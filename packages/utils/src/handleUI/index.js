import { getPosition } from "../getPosition";

/**
 * Handle UI Interaction
 * @param {import("../type").Config} config
 * @param {import("../type").Intersection} data
 */
export function handleUI(config, data) {
	const index = data.object.userData.index;

	const mesh = config.options[index].clone();
	mesh.material = config.options[index].material.clone();
	mesh.userData.isSelectable = true;
	mesh.userData.id = config.options[index].userData.id;

	if (config.appendSelected) {
		const height =
			config.selected.geometry.boundingBox.max.y -
			config.selected.geometry.boundingBox.min.y;
		const position = getPosition(config.selected);

		if (config.appendSelected === "top") {
			mesh.position.copy(position);
			mesh.position.y += height;
		}

		if (config.appendSelected === "left") {
			mesh.position.copy(position);
			mesh.position.x -= height;
		}

		if (config.appendSelected === "right") {
			mesh.position.copy(position);
			mesh.position.x += height;
		}
	} else {
		const position = getPosition(config.cursor);
		mesh.position.copy(position);
	}

	config.selection.add(mesh);
}
