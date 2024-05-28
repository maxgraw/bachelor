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
