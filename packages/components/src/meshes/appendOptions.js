import * as THREE from "three";

const plus_color = new THREE.Color("hsl(84, 100%, 50%)");
const plus_material = new THREE.MeshStandardMaterial({
	color: plus_color,
});
const plus_geometry = new THREE.BoxGeometry(0.03, 0.1, 0.03);

const plus_one = new THREE.Mesh(plus_geometry, plus_material);
const plus_two = new THREE.Mesh(plus_geometry, plus_material);

plus_two.rotation.z = Math.PI / 2;

const mesh_top = new THREE.Group();
const mesh_top_plus_one = plus_one.clone();
const mesh_top_plus_two = plus_two.clone();
mesh_top.add(mesh_top_plus_one, mesh_top_plus_two);
mesh_top.userData.position = "top";
mesh_top.userData.isAdd = true;

const mesh_left = new THREE.Group();
const mesh_left_plus_one = plus_one.clone();
const mesh_left_plus_two = plus_two.clone();
mesh_left.add(mesh_left_plus_one, mesh_left_plus_two);
mesh_left.userData.position = "left";
mesh_left.userData.isAdd = true;

const mesh_right = new THREE.Group();
const mesh_right_plus_one = plus_one.clone();
const mesh_right_plus_two = plus_two.clone();
mesh_right.add(mesh_right_plus_one, mesh_right_plus_two);
mesh_right.userData.position = "right";
mesh_right.userData.isAdd = true;

export const appendOptions = new THREE.Group();
appendOptions.add(mesh_top, mesh_left, mesh_right);
appendOptions.visible = false;