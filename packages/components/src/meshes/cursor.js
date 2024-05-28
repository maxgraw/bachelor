import * as THREE from "three";

const cursor_color = new THREE.Color("hsl(0, 0%, 100%)");
const cursor_material = new THREE.MeshStandardMaterial({
	color: cursor_color,
});
const cursor_geometry = new THREE.RingGeometry(0.16, 0.2, 32).rotateX(
	-Math.PI / 2,
);

const cursor = new THREE.Mesh(cursor_geometry, cursor_material);

export { cursor };
