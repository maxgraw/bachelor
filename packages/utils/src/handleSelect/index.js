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
