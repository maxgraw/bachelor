import * as THREE from "three";

const plus_color = new THREE.Color("hsl(76, 76%, 72%)");

const geometry = new THREE.BoxGeometry(0.03, 0.1, 0.03);

const mesh_one = new THREE.Mesh(
  geometry,
  new THREE.MeshStandardMaterial({
    color: plus_color,
    emissive: plus_color,
  })
);

const mesh_two = new THREE.Mesh(
  geometry,
  new THREE.MeshStandardMaterial({
    color: plus_color,
    emissive: plus_color,
  })
);

mesh_two.rotation.z = Math.PI / 2;

mesh_one.castShadow = true;
mesh_one.receiveShadow = true;

mesh_two.castShadow = true;
mesh_two.receiveShadow = true;

export const PLUS = new THREE.Group();
plus.add(mesh_one);
plus.add(mesh_two);
