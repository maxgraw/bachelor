export function set_parameter(mesh, parameter, value) {
  if (!mesh) return;

  mesh.traverse((child) => {
    if (child.isMesh) {
      child[parameter] = value;
    }
  });
}
