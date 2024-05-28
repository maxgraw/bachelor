import * as THREE from "three";
import ThreeMeshUI from "three-mesh-ui";

import FontJSON from "../assets/Geist-Medium-msdf.json";
import FontImage from "../assets/Geist-Medium.png";

export const create_menu = (options) => {
	const container = new ThreeMeshUI.Block({
		contentDirection: "column",
		justifyContent: "space-around",
		backgroundOpacity: 0.9,
		backgroundColor: new THREE.Color("hsl(0, 0%, 40%)"),
		borderRadius: 0.02,
		fontFamily: FontJSON,
		fontTexture: FontImage,
		padding: 0.05,
	});

	options.forEach((option, index) => {
		const block = new ThreeMeshUI.Block({
			height: 0.2,
			width: 0.5,
			bestFit: "auto",
			backgroundColor: new THREE.Color("hsl(180, 100%, 30%)"),
			borderRadius: 0.03,
			justifyContent: "center",
			alignItems: "center",
			margin: 0.05,
		});

		const text = new ThreeMeshUI.Text({
			content: option.userData.name,
			fontSize: 0.1,
			fontColor: new THREE.Color("hsl(0, 0%, 95%)"),
		});

		text.userData.index = index;
		text.userData.isCreate = true;

		block.add(text);

		block.userData.index = index;
		block.userData.isCreate = true;

		container.add(block);
	});

	container.position.set(0, -1, -2);

	return container;
};
