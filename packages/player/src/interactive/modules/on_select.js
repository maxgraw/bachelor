import * as THREE from "three";

export function on_select() {
  const data = this.raycast(this.raycaster.controller, [this.cursor]);

  if (data) {
    const position = new THREE.Vector3();
    position.setFromMatrixPosition(this.cursor.matrix);
    this.menu.position.copy(position);
    this.menu.position.y += 0.5;
    this.menu.lookAt(this.camera.position);
    this.menu.visible = true;
  }
}
