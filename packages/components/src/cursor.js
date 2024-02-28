import * as THREE from "three";

// Ring

const ring_color = new THREE.Color("hsl(0, 0%, 100%)");
const ring_material = new THREE.MeshStandardMaterial({
  color: ring_color,
});
const ring_geometry = new THREE.RingGeometry(0.08, 0.12, 32).rotateX(
  -Math.PI / 2
);

const ring = new THREE.Mesh(ring_geometry, ring_material);

// Plus

const plus_color = new THREE.Color("hsl(84, 100%, 50%)");
const plus_material = new THREE.MeshStandardMaterial({
  color: plus_color,
});
const plus_geometry = new THREE.BoxGeometry(0.03, 0.1, 0.03);

const plus_one = new THREE.Mesh(plus_geometry, plus_material);
const plus_two = new THREE.Mesh(plus_geometry, plus_material);

plus_two.rotation.z = Math.PI / 2;

const plus = new THREE.Group();
plus.add(plus_one, plus_two);

plus.position.y += 0.1;

// Cursor

const cursor = new THREE.Group();
cursor.add(ring, plus);

export { cursor };
