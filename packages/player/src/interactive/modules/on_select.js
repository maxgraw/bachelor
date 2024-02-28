import * as THREE from "three";

/**
 * Get the position of an element
 * @param {THREE.Mesh} element
 * @returns {THREE.Vector3}
 */
const get_position = (element) => {
  const position = new THREE.Vector3();
  position.setFromMatrixPosition(element.matrix);
  return position;
};

/**
 * Handle Menu display
 * @param {object} config
 * @param {THREE.Mesh} config.cursor
 * @param {THREE.Mesh} config.menu
 * @param {THREE.Camera} config.camera
 * @returns {void}
 */
const handle_menu = (config) => {
  const position = get_position(config.cursor);
  config.menu.position.copy(position);
  config.menu.position.y += 0.5;
  config.menu.lookAt(config.camera.position);
  config.menu.visible = true;
};

/**
 * Handle UI event
 * @param {Config} config
 * @param {THREE.Mesh} config.data
 * @param {Array} config.options
 * @param {THREE.Mesh} config.cursor
 * @param {Array} config.selection
 * @param {THREE.Scene} config.scene
 * @returns {void}
 */
const handle_ui = (config) => {
  const index = config.data.object.index;

  const mesh = new THREE.Mesh(
    config.options[index].children[0].geometry,
    config.options[index].children[0].material
  );

  const position = get_position(config.cursor);
  mesh.position.copy(position);

  config.selection.push(mesh);
  config.scene.add(mesh);
};

/**
 * Handle on select event
 * @returns {void}
 */
export function on_select() {
  const data = this.raycast(this.raycaster.controller, [
    this.cursor,
    ...this.selection,
    ...this.menu.childrenUIs,
  ]);

  if (data?.object?.isUI) {
    handle_ui({
      data: data,
      options: this.options,
      cursor: this.cursor,
      selection: this.selection,
      scene: this.scene,
    });
    return;
  }

  if (data) {
    handle_menu({
      cursor: this.cursor,
      menu: this.menu,
      camera: this.camera,
    });
    return;
  }

  this.menu.visible = false;
}
