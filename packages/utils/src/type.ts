import type * as THREE from "three";

export type Config = {
	renderer: THREE.WebGLRenderer;
	options: THREE.Group[];
	selection: THREE.Group[];
	selected: THREE.Object3D | null;
};

export type Data = THREE.Object3D;

export type DisplaySettings = {
	selected: boolean;
	menu: {
		create: boolean;
		remove: boolean;
		shop: boolean;
	};
	appendOptions: boolean;
};

export type TypeResult = {
	selectable: boolean;
	ui: boolean;
	appendOptions: boolean;
};

export type Intersection = {
	distance: number;
	point: THREE.Vector3;
	face: THREE.Face | null;
	faceIndex: number | null;
	object: THREE.Object3D;
	uv: THREE.Vector2 | undefined;
} | null;
