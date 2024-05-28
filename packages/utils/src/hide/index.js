/**
 * Hide an element and its children
 * @param {THREE.Object3D} element
 */
export const hide = (element) => {
	element.layers.set(3);

	element.traverse((child) => {
		if (child.isMesh) {
			child.layers.set(3);
		}
	});

	element.visible = false;
};
