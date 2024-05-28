Wie im Kapitel der Konzeption festgelegt, ermöglicht die Entwicklung der Anwendung als Web Component eine modulare und wiederverwendbare Architektur. Die Web Components werden in dem Paket "player" definiert und exportiert. Hierbei werden drei unterschiedliche Komponenten erstellt. Die Klasse "BaseElement" stellt die Grundlage für alle weiteren Komponenten dar und definiert die grundlegenden Variablen und Funktionen. Die Klassen "ARElement" und "ShopARElement" erweitern die Klasse "BaseElement" und definieren die spezifischen Funktionen und Variablen für die Anwendung. Hierbei stellt ARElement die Anwendung für die Evaluation dieser Arbeit dar, während ShopARElement die Anwendung für die Evaluation von Maximilian Patzke darstellt.

Jede Klasse folgt einem einheitlichen Aufbau. Im Konstruktor der Klasse werden Variablen und Funktionen definiert, die für die Anwendung von Bedeutung sind. Für die Klasse "BaseElement", welche in @BaseElement-listing auszugsweise vorgestellt wird, umfasst dies grundlegende Variablen für die Three.js-Szene, wie beispielsweise den Renderer, die Szene und die Kamera. Durch die Deklaration dieser Variablen im Konstruktor sind sie innerhalb der Klasse zugänglich. Darüber hinaus werden Funktionen und Hilfsvariablen definiert, die für die Anwendung von Bedeutung sind. Die Klasse "BaseElement" definiert beispielsweise die Funktion "hitTest", die für die Interaktion mit der Umgebung notwendig ist sowie die dazugehörigen Variablen "hitTestSource" und "hitTestSourceRequested". Die Funktion "hitTest" wird in einem späteren Kapitel ausführlich behandelt. Die gesamte Klasse "BaseElement" ist im @appendix-baseElement zu finden.

#let code = ```js
import { hitTest, ... } from "utils";

export class BaseElement extends HTMLElement {
	constructor() {
		super();

		// Three.js Basic Setup
		this.renderer = new THREE.WebGLRenderer(...);
    this.scene = new THREE.Scene();
		this.camera = new THREE.PerspectiveCamera(...);

    // Hit Test
		this.hitTest = hitTest;
		this.hitTestSource = null;
		this.hitTestSourceRequested = false;
	}
}
```

#figure(
  code,
  caption: [Ausschnitt der BaseElement Klasse mit grundlegenden Variablen und Funktionen]
) <BaseElement-listing>

Wie im @appendix-baseElement dargestellt, stellt die Klasse BaseElement die Funktion "init" bereit, die die zuvor definierten Variablen und Funktionen nutzt, um eine Three.js-Szene zu erstellen. Ein Ausschnitt dieser Funktion wird in @init-listing dargestellt, um wichtige Funktionalitäten zu verdeutlichen. Zunächst wird das Shadow DOM initialisiert. Wie im @web-components-chapter über Web-Komponenten beschrieben, ermöglicht das Shadow DOM die Erstellung von gekapselten DOM-Bäumen und Logiken.

In diesem Schritt wird ein von Three.js bereitgestellter ARButton hinzugefügt, der die WebXR-Funktionen des Browsers aktiviert und die Anwendung startet. Wie im @webxr-chapter über WebXR definiert, wird eine Liste an benötigten oder optionalen Features übergeben. Für die Anwendung sind die Features "hit-test" erforderlich und "light-estimation" optional.

Anschließend wird die Three.js Render-Klasse konfiguriert und die Unterklasse XR aktiviert. Die Erstellung und Initialisierung einer XRScene wird automatisch von Three.js übernommen. Dabei wird der XRReferenceSpace auf "local-floor" gesetzt, was das Zentrum der Szene auf den Boden legt, wie im @webxr-chapter beschrieben. Zusätzlich werden Elemente wie Lichter und Kameras zur Szene hinzugefügt.

#let code = ```js	
init(renderer, scene) {
  // Initialize Shadow DOM
  const shadow = this.attachShadow({ mode: "open" });
  shadow.appendChild(renderer.domElement);
  shadow.appendChild(
    ARButton.createButton(renderer, {
      requiredFeatures: ["hit-test"],
      optionalFeatures: ["light-estimation"],
    }),
  );

  // Renderer
  renderer.xr.enabled = true;

  // Scene
  scene.add(this.camera);

  // Light
  const defaultLight = new THREE.HemisphereLight(0xffffff, 0xbbbbff, 1);
  defaultLight.position.set(0.5, 1, 0.25);
  scene.add(defaultLight);
}
```

#figure(
  code,
  caption: [Ausschnitt der init-Funktion der BaseElement Klasse]
) <init-listing>

In @ARElement-listing wird Klasse ARElement definiert. Dabei wird die "connectedCallback"-Funktion verwendet, um die Anwendung zu initialisieren. In dieser Funktion werden die zuvor beschriebene "init"-Funktion sowie die "setAnimationLoop"-Funktion der Three.js Render-Klasse aufgerufen.

Die "setAnimationLoop"-Funktion ruft die "render"-Funktion auf, die den Render-Loop von Three.js startet. Der Render-Loop ist ein kontinuierlicher Prozess, der die Szene in jedem Frame aktualisiert und darstellt. Dies ist entscheidend für die Echtzeit-Darstellung und Interaktion innerhalb der Augmented Reality-Anwendung. Während jedes Frame wird der Zustand der Szene überprüft und alle notwendigen Aktualisierungen vorgenommen, bevor die Szene gerendert wird @threejs-webxr.

#let code = ```js
export class ARElement extends BaseElement {
	constructor() {
		super();
	}

	async connectedCallback() {
		// Set up
		this.init(this.renderer, this.scene);
		this.renderer.setAnimationLoop(this.render.bind(this));
	}

	render(timestamp, frame) {
		this.renderer.render(this.scene, this.camera);
	}
}
```

#figure(
  code,
  caption: [Ausschnitt der ARElement Klasse mit connectedCallback- und render-Funktion aus @appendix-ARElement]
) <ARElement-listing>

Durch die Kombination der "init"-Funktion und der Initialisierung des Render-Loops wird die Three.js-Szene erstellt und bereitgestellt. In den folgenden Kapiteln wird diese Szene um die Darstellung und Funktionalitäten der Anwendung erweitert.