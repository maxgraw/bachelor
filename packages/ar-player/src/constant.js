import * as THREE from "three";

// Create a basic rectangle geometry
const geometry = new THREE.BoxGeometry(0.1, 0.5, 0.1);

// Create two meshes from the geometry
const mesh1 = new THREE.Mesh(geometry);
const mesh2 = new THREE.Mesh(geometry);

// Rotate one mesh by 45 degrees clockwise around the Y axis
mesh1.rotation.z = Math.PI / 4;

// Rotate the other mesh by 45 degrees counter-clockwise around the Y axis
mesh2.rotation.z = -Math.PI / 4;

// Create a group and add the two meshes to it
export const REMOVE = new THREE.Group();
REMOVE.add(mesh1);
REMOVE.add(mesh2);

// Create two meshes from the geometry
const plus_mesh_one = new THREE.Mesh(geometry);
const plus_mesh_two = new THREE.Mesh(geometry);

// Position the second mesh to form a plus sign
plus_mesh_two.rotation.z = Math.PI / 2;

// Create a group and add the two meshes to it
export const PLUS = new THREE.Group();
PLUS.add(plus_mesh_one);
PLUS.add(plus_mesh_two);
