import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "../assets/Geist-Medium-msdf.json";
import FontImage from "../assets/Geist-Medium.png";

const no_cursor = new ThreeMeshUI.Block({
	fontFamily: FontJSON,
	fontTexture: FontImage,
	padding: 0.02,
	width: 1,
	backgroundOpacity: 0,
});

const text = new ThreeMeshUI.Text({
	content: "Kamera bewegen",
	fontSize: 0.15,
	textAlign: "center",
});

no_cursor.add(text);

no_cursor.position.set(0, 0, -2);

export { no_cursor };
