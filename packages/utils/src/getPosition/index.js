import * as THREE from "three";

/**
 * Get the position of an element
 * @param {THREE.Object3D} element
 * @returns {THREE.Vector3}
 */
export const getPosition = (element) => {
	const position = new THREE.Vector3();
	position.setFromMatrixPosition(element.matrix);
	return position;
};
