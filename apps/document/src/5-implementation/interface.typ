Wie zuvor im Kapitel der Konzeption festgestellt, kann das Interface der Anwendung in 3D- und 2D-Elemente unterteilt werden. Hierbei besitzen die einzelnen Elemente unterschiedliche Funktionen und Interaktionsmöglichkeiten.

Als erstes Interface-Element wird der Cursor der Anwendung betrachtet. Im Wireframe wurde festgelegt, dass der Cursor eine geeignete Position auf einer Ebene symbolisiert, auf der ein Möbelstück virtuell platziert werden kann. Zur Überprüfung der geeigneten Fläche wird die WebXR Hit Test API verwendet. Three.js bietet hierbei eine direkte Möglichkeit, auf diese WebXR API zuzugreifen. Grundsätzlich wird der Cursor als 3D-Objekt dargestellt und seine Position abhängig von der Hit Test API gesetzt.

Zur Implementierung wurde die Funktion "hitTest" erstellt. Ein Auszug dieser Funktion ist in @figure-hitTest dargestellt. Zuerst wird der Referenzraum und die Session des Renderers abgefragt. Anschließend wird geprüft, ob bereits ein HitTestSource angefordert wurde. Falls dies nicht der Fall ist, wird ein HitTestSource angefordert. Andernfalls wird das erste HitTestResult aus dem Frame abgefragt und die Position des Cursors entsprechend gesetzt. Hierbei kann die von der WebXR Hit Test API bereitgestellte Funktion "getPose" verwendet werden, um die Position des Cursors zu bestimmen.

#let code = ```js
export function hitTest(renderer, frame) {
	const referenceSpace = renderer.xr.getReferenceSpace();
	const session = renderer.xr.getSession();

	if (this.hitTestSourceRequested === false) {
		session.requestReferenceSpace("viewer").then((referenceSpace) => {
			session.requestHitTestSource({ space: referenceSpace })
      ...
		});

		this.hitTestSourceRequested = true;
	}

	if (this.hitTestSource) {
		const hitTestResults = frame.getHitTestResults(this.hitTestSource);

		if (hitTestResults.length) {
			const hit = hitTestResults[0];

			switchDisplay(true, this);
			this.cursor.matrix.fromArray(
				hit.getPose(referenceSpace).transform.matrix,
			);
		} else {
			switchDisplay(false, this);
		}
	}
}
```

#figure(
  code,
  caption: [Auszug aus der Funktion hitTest vom @appendix-hitTest],
) <figure-hitTest>

Auch das Menü, welches das Anheften von Möbelstücken ermöglicht, wird als 3D-Element dargestellt. Hierbei werden einzelne Platzierungsoptionen als 3D-Plus-Objekte visualisiert. Die Positionierung der einzelnen Optionen basiert auf den importierten Möbelstücken. Durch die Verwendung der jeweiligen Höhe und Breite der Möbelstücke können die Optionen um das Möbelstück herum angeordnet werden.

Im Wireframe werden jedoch auch 2D-Elemente verwendet, um die Benutzerinteraktion zu ermöglichen. Hierbei wird die Benutzeroberfläche in Form von Menüs und Buttons dargestellt. Um die Menüs zu erstellen und zu verwalten, wurde wie bereits im Abschnitt der Technologie beschrieben, die externe Bibliothek "three-mesh-ui" verwendet. Three Mesh UI ermöglicht das Erstellen von XR-Interfaces, welche direkt in Three.js verwendet werden können. Die Bibliothek bietet hierfür eine eigene Klasse namens ThreeMeshUI, welche das Erstellen von komplexen und verschachtelten Interfaces ermöglicht. Des Weiteren können direkt Schriftarten geladen und Text einzelnen Elementen hinzugefügt werden wie in @figure-ui dargestellt @three-mesh-ui.

#let code = ```js
const container = new ThreeMeshUI.Block({
	fontFamily: FontJSON,
	fontTexture: FontImage,
});

const text = new ThreeMeshUI.Text({
	content: "Löschen",
});

container.add(text);
```

#figure(
  code,
  caption: [Auszug aus der Erstellung eines 2D-Buttons],
) <figure-ui>

Mithilfe dieser Bibliothek wurden alle 2D-Interfaces der Anwendung umgesetzt. Hervorzuheben ist hierbei das Menü "Auswahl". Da sich die Anzahl an Möbelstücken sowie deren Metadaten ändern können, wird das Menü automatisch beim Laden der Webkomponente generiert. In @figure-createMenu wird ein Auszug dieser Funktion dargestellt. Als Parameter wird eine Liste der bereitgestellten Möbelstücke übergeben. Diese werden mithilfe einer Schleife durchlaufen und als Auswahloptionen im Menü hinzugefügt. Dabei werden auch die Metadaten der Möbelstücke auf das Interface übertragen, um im späteren Schritt zwischen den einzelnen Optionen unterscheiden zu können.

#let code = ```js
export const create_menu = (options) => {
	const container = new ThreeMeshUI.Block();

	options.forEach((option, index) => {
		const block = new ThreeMeshUI.Block();

		const text = new ThreeMeshUI.Text({
			content: option.userData.name,
		});

		block.add(text);
		block.userData.index = index;
		block.userData.isCreate = true;

		container.add(block);
	});
	return container;
};
```

#figure(
  code,
  caption: [Auszug aus der Funktion "create_menu" vom @appendix-createMenu]
) <figure-createMenu>

Um die Sichtbarkeit und Ergonomie der 2D-Menüs zu verbessern, wurde in der Konzeption festgelegt, dass sich diese mit der Kamera-Rotation und -Position bewegen sollen. Um dies zu erreichen, kann der Three.js-Szenengraph wie in @figure-Graph verwendet werden. Hierbei können Objekte miteinander verschachtelt und somit in Bezug zueinander gesetzt werden. Durch das Hinzufügen des Auswahlmenüs zur Kamera folgt dieses automatisch deren Position und Rotation und bleibt somit automatisch im Sichtfeld der Kamera.

#let code = ```js
this.camera.add(this.menus.remove);
```

#figure(
  code,
  caption: [Beispielhafte Anwendung des Szenengraphen]
) <figure-Graph>