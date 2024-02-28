import * as THREE from "three";
import { ARButton } from "three/addons/webxr/ARButton.js";

import { cursor } from "components";

import {
  hit_test,
  raycast,
  set_parameter,
  raycast_controller,
  window_resize,
} from "./modules";

export class BaseElement extends HTMLElement {
  constructor() {
    super();

    this.renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(
      50,
      window.innerWidth / window.innerHeight,
      0.1,
      10
    );

    this.hit_test = hit_test.bind(this);
    this.raycast = raycast.bind(this);
    this.set_parameter = set_parameter.bind(this);
    this.raycast_controller = raycast_controller.bind(this);
    this.window_resize = window_resize.bind(this);

    this.hitTestSource = null;
    this.hitTestSourceRequested = false;

    this.cursor = null;

    this.controller = this.renderer.xr.getController(0);

    this.raycaster = {
      controller: new THREE.Raycaster(),
    };
  }

  init(renderer, scene) {
    const shadow = this.attachShadow({ mode: "open" });
    shadow.appendChild(renderer.domElement);
    shadow.appendChild(
      ARButton.createButton(renderer, {
        requiredFeatures: ["hit-test"],
        style: {
          backgroundColor: "transparent",
        },
      })
    );

    shadow.renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;
    renderer.xr.enabled = true;
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(window.devicePixelRatio);

    scene.add(this.camera);

    const ambient_light = new THREE.HemisphereLight(
      "white",
      "darkslategrey",
      5
    );
    scene.add(ambient_light);

    const main_light = new THREE.DirectionalLight("white", 4);
    main_light.position.set(10, 10, 10);
    scene.add(main_light);

    this.cursor = cursor;

    this.cursor.matrixAutoUpdate = false;
    this.cursor.visible = false;
    this.cursor.lookAt(this.camera);

    scene.add(this.cursor);
  }

  render(timestamp, frame) {
    if (frame) {
      this.raycast_controller();
    }

    this.renderer.render(this.scene, this.camera);
  }
}

customElements.define("ar-element-base", BaseElement);
