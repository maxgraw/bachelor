import * as THREE from "three";

const remove_color = new THREE.Color("hsl(84, 100%, 50%)");
const remove_material = new THREE.MeshStandardMaterial({
  color: remove_color,
});
const remove_geometry = new THREE.BoxGeometry(0.03, 0.1, 0.03);

const remove_one = new THREE.Mesh(remove_geometry, remove_material);
const remove_two = new THREE.Mesh(remove_geometry, remove_material);

remove_one.rotation.z = Math.PI / 4;
remove_two.rotation.z = -Math.PI / 4;

export const remove = new THREE.Group();
remove.add(remove_one, remove_two);
remove.isremove = true;
