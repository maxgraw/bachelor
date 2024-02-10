import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

export const create_menu = (options) => {
  const container = new ThreeMeshUI.Block({
    height: 1,
    width: 1,
    contentDirection: "row",
    justifyContent: "space-around",
    backgroundOpacity: 0,
  });

  options.forEach((option) => {
    const block = new ThreeMeshUI.Block({
      height: 0.3,
      width: 0.3,
      backgroundColor: new THREE.Color(option.color),
    });

    block.setupState({
      state: "selected",
      attributes: {
        backgroundColor: new THREE.Color("green"),
      },
    });

    container.add(block);
  });

  return container;
};
