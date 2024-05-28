import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "../assets/Geist-Medium-msdf.json";
import FontImage from "../assets/Geist-Medium.png";

const container = new ThreeMeshUI.Block({
	contentDirection: "column",
	justifyContent: "space-around",
	backgroundOpacity: 0,
	fontFamily: FontJSON,
	fontTexture: FontImage,
	padding: 0.05,
});

const menu = new ThreeMeshUI.Block({
	padding: 0.02,
	width: 1,
	height: 0.2,
	bestFit: "auto",
	backgroundColor: new THREE.Color("hsl(180, 100%, 30%)"),
	borderRadius: 0.03,
});

const text = new ThreeMeshUI.Text({
	content: "Bestellen",
	fontSize: 0.2,
});

text.userData.isShop = true;

menu.add(text);
menu.userData.isShop = true;

container.add(menu);

container.position.set(0, -1, -2);

export { container as shop_menu };
