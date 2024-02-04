import * as THREE from "three";

const plus_color = new THREE.Color("hsl(76, 76%, 72%)");
const ring_color = new THREE.Color("hsl(0, 0%, 80%)");

// PLUS

const geometry = new THREE.BoxGeometry(0.05, 0.2, 0.05);

const mesh_one = new THREE.Mesh(
  geometry,
  new THREE.MeshBasicMaterial({
    color: plus_color,
  })
);
const mesh_two = new THREE.Mesh(
  geometry,
  new THREE.MeshBasicMaterial({
    color: plus_color,
  })
);

mesh_two.rotation.z = Math.PI / 2;

export const plus = new THREE.Group();
plus.add(mesh_one);
plus.add(mesh_two);

plus.position.y = 0.2;
plus.castShadow = true;
plus.receiveShadow = true;

// RING

export const ring = new THREE.Mesh(
  new THREE.RingGeometry(0.15, 0.2, 32).rotateX(-Math.PI / 2),
  new THREE.MeshBasicMaterial({
    color: ring_color,
  })
);

ring.castShadow = true;
ring.receiveShadow = true;

// CURSOR

export const CURSOR = new THREE.Group();
CURSOR.add(ring);
CURSOR.add(plus);
