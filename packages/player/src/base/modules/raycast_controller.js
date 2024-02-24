import * as THREE from "three";

export function raycast_controller() {
  this.controller.updateMatrixWorld();
  const tempMatrix = new THREE.Matrix4();

  tempMatrix.identity().extractRotation(this.controller.matrixWorld);

  this.raycaster.controller.ray.origin.setFromMatrixPosition(
    this.controller.matrixWorld
  );

  this.raycaster.controller.ray.direction
    .set(0, 0, -1)
    .applyMatrix4(tempMatrix);
}
