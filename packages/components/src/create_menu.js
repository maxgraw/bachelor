import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "./assets/Roboto-msdf.json";
import FontImage from "./assets/Roboto-msdf.png";

export const create_menu = (options) => {
  const container = new ThreeMeshUI.Block({
    contentDirection: "row",
    justifyContent: "space-around",
    backgroundOpacity: 0,
    fontFamily: FontJSON,
    fontTexture: FontImage,
    padding: 0.02,
  });

  options.forEach((option, index) => {
    const block = new ThreeMeshUI.Block({
      height: 0.2,
      width: 0.2,
      backgroundColor: new THREE.Color("red"),
      justifyContent: "center",
      alignItems: "center",
      borderRadius: 0.05,
      margin: 0.05,
    });

    const text = new ThreeMeshUI.Text({
      content: `${index + 1}`,
      fontSize: 0.15,
    });

    block.add(text);

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
