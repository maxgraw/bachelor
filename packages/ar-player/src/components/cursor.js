import * as THREE from "three";

const plus_color = new THREE.Color("hsl(76, 76%, 72%)");
const ring_color = new THREE.Color("hsl(0, 0%, 95%)");

// PLUS Element

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

export const plus = new THREE.Group();
plus.add(mesh_one);
plus.add(mesh_two);

plus.position.y = 0.1;

// RING

export const ring = new THREE.Mesh(
  new THREE.RingGeometry(0.1, 0.12, 32).rotateX(-Math.PI / 2),
  new THREE.MeshStandardMaterial({
    color: ring_color,
  })
);

// CURSOR

export const CURSOR = new THREE.Group();
CURSOR.add(ring);
CURSOR.add(plus);
