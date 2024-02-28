import { GLTFLoader } from "three/addons/loaders/GLTFLoader.js";

import { create_menu } from "components";

export function load_options(options) {
  const loader = new GLTFLoader();
  const values = options.split(",").map((option) => option.trim());

  Promise.all(values.map((option) => loader.loadAsync(option))).then(
    (gltfs) => {
      this.options = gltfs.map((gltf) => gltf.scene);

      this.menu = create_menu(this.options);
      this.menu.visible = false;
      this.scene.add(this.menu);
    }
  );
}
