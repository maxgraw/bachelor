import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";

import { CURSOR } from "./models/cursor.js";

export class TestElement extends HTMLElement {
  constructor() {
    super();

    console.log("check constructor");

    // Base Three.js Components
    this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(
      50,
      window.innerWidth / window.innerHeight,
      0.1,
      10
    );
  }

  connectedCallback() {
    console.log("check");
    this.init(this.renderer, this.scene);

    this.renderer.setAnimationLoop(this.render.bind(this));
  }

  init(renderer, scene) {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.appendChild(renderer.domElement);
    shadow.appendChild(
      ARButton.createButton(renderer, {
        requiredFeatures: ["hit-test"],
      })
    );

    scene.add(this.camera);

    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.xr.enabled = true;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);

    const sphereGeometry = new THREE.SphereGeometry(1, 16, 16);
    const sphereMaterial = new THREE.MeshStandardMaterial({ color: "blue" });
    const sphere = new THREE.Mesh(sphereGeometry, sphereMaterial);
    sphere.castShadow = true; //default is false
    sphere.receiveShadow = true; //default

    scene.add(sphere);

    const box = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshStandardMaterial({ color: "red" });
    const cube = new THREE.Mesh(box, material);
    cube.castShadow = true; //default is false
    cube.receiveShadow = true; //default

    scene.add(cube);

    cube.position.z = -5;
    cube.position.y = 2;

    sphere.position.z = -5;

    scene.add(new THREE.AmbientLight(0xffffff, 0.5)); // optional

    const light = new THREE.PointLight(0xffffff, 1, 20);
    this.camera.add(light);

    scene.add(CURSOR);
  }

  render(timestamp, frame) {
    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element-test", TestElement);
