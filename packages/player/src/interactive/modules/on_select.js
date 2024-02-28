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

  const mesh = config.options[index].children[index].clone();
  mesh.material = new THREE.MeshStandardMaterial().copy(
    config.options[index].children[index].material
  );
  mesh.material.needsUpdate = true;
  mesh.isSelection = true;

  if (config.selected) {
    const position = get_position(config.selected);
    mesh.position.copy(position);
    mesh.position.y += 0.5;

    config.selection.push(mesh);
    config.scene.add(mesh);

    return;
  }

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
    this.add,
    ...this.selection,
    ...this.menu.childrenUIs,
  ]);

  if (data?.isAdd) {
    const position = get_position(this.add);
    this.menu.position.copy(position);
    this.menu.position.y += 0.5;
    this.menu.visible = true;
    return;
  }

  if (data?.object?.isSelection) {
    this.selected = data.object;
    this.selected.material.color.set("red");

    this.scene.add(this.add);
    this.add.visible = true;
    this.add.position.copy(this.selected.position);
    this.add.position.y = this.selected.position.y + 0.5;

    this.menu.visible = false;
    return;
  }

  if (data?.object?.isUI) {
    handle_ui({
      data: data,
      options: this.options,
      cursor: this.cursor,
      selection: this.selection,
      scene: this.scene,
      selected: this.selected,
    });

    this.menu.visible = false;
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

  this.add.visible = false;
  this.selected = null;
  this.menu.visible = false;
}
