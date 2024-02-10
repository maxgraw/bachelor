import * as THREE from "three";

const base = new THREE.Mesh(
  new THREE.BoxGeometry(0.5, 0.5, 0.5),
  new THREE.MeshStandardMaterial({
    color: plus_color,
    emissive: plus_color,
  })
);

export const Element = new THREE.Group();
Element.add(base);
Element.add(mesh_two);
