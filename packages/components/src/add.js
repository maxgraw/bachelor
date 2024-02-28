import * as THREE from "three";

const plus_color = new THREE.Color("hsl(84, 100%, 50%)");
const plus_material = new THREE.MeshStandardMaterial({
  color: plus_color,
});
const plus_geometry = new THREE.BoxGeometry(0.03, 0.1, 0.03);

const plus_one = new THREE.Mesh(plus_geometry, plus_material);
const plus_two = new THREE.Mesh(plus_geometry, plus_material);

plus_two.rotation.z = Math.PI / 2;

export const add = new THREE.Group();
add.add(plus_one, plus_two);
add.isAdd = true;
