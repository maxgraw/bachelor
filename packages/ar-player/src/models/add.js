import * as THREE from "three";

const geometry = new THREE.BoxGeometry(0.1, 0.5, 0.1);

const mesh_one = new THREE.Mesh(geometry);
const mesh_two = new THREE.Mesh(geometry);

mesh_two.rotation.z = Math.PI / 2;

export const PLUS = new THREE.Group();
PLUS.add(mesh_one);
PLUS.add(mesh_two);
