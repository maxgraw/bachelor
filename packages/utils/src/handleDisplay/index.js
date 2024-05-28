import { hide } from "../hide";
import { show } from "../show";
import { getPosition } from "../getPosition";

/**
 * Handle display logic for the interface
 * @param {import("../type").Config} config
 * @param {import("../type").DisplaySettings} settings
 * @description
 * This function will handle the display logic for the interface.
 * It will show or hide the menus based on the settings.
 */
export function handleDisplay(config, settings) {
	if (settings.selected === false && config.selected) {
		config.selected.material.emissive.setHex(
			config.selected.userData.currentHex,
		);
		config.selected = null;
	}

	if (settings.appendOptions === true) {
		config.appendOptions.visible = true;

		const height =
			config.selected.geometry.boundingBox.max.y -
			config.selected.geometry.boundingBox.min.y;

		for (const item of config.appendOptions.children) {
			if (item.userData.position === "top") {
				item.position.copy(getPosition(config.selected));
				item.position.y += height + 0.2;
			}

			if (item.userData.position === "left") {
				item.position.copy(getPosition(config.selected));
				item.position.x -= height;
				item.position.y += height / 2;
			}

			if (item.userData.position === "right") {
				item.position.copy(getPosition(config.selected));
				item.position.x += height;
				item.position.y += height / 2;
			}
		}
	}

	if (settings.appendOptions === false) {
		config.appendOptions.visible = false;
	}

	if (settings.menu.shop === false && config.menus.shop) {
		hide(config.menus.shop);
	}

	if (settings.menu.create === false) {
		hide(config.menus.create);
	}

	if (settings.menu.remove === false) {
		hide(config.menus.remove);
	}

	if (settings.menu.shop === true && config.menus.shop) {
		show(config.menus.shop);
	}

	if (settings.menu.create === true) {
		show(config.menus.create);
	}

	if (settings.menu.remove === true) {
		show(config.menus.remove);
	}
}
