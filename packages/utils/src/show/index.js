/**
 * Show an element and its children
 * @param {THREE.Object3D} element
 */
export const show = (element) => {
	element.layers.set(0);

	element.traverse((child) => {
		if (child.isMesh) {
			child.layers.set(0);
		}
	});

	element.visible = true;
};
