Nachdem die Implementierung der Interfaces vorgestellt wurde, wird nun auf die Interaktion mit diesen eingegangen. Zuvor wurde bereits die Implementierung des 3D-Cursors über die Hit-Test-API erläutert. Zur Interaktion mit diesem Cursor, basierend auf der Kameraposition und -rotation, wird die entsprechende Funktion innerhalb der Render-Funktion von Three.js aufgerufen. In @figure-renderHitTest wird die Integration der Hit-Test-Funktion in die Render-Funktion dargestellt.

#let code = ```js
render(timestamp, frame) {
  if (frame) {
    this.hitTest(this.renderer, frame);
  }
  this.renderer.render(this.scene, this.camera);
}
```

#figure(
  code,
  caption: [Integration der "hitTest" Funktion in die Render-Funktion]
) <figure-renderHitTest>

Um die Interaktion mit allen anderen Interfaces zu ermöglichen, wird zunächst auf ein Select Event des Controllers gewartet. Der Controller stellt hierbei ein Touch Event auf dem Bildschirm dar. Wird dieses Event ausgelöst, wird die Methode handleSelect aufgerufen wie in @figure-eventListenerSelect dargestellt.

#let code = ```js
this.controller.addEventListener("select", () => this.handleSelect());
```

#figure(
  code,
  caption: [Event-Listener für das "select" Event des Controllers]
) <figure-eventListenerSelect>

Die Funktion handleSelect nutzt hierbei die Daten des Touch Events, um einen Raycast durchzuführen. Ein Raycast funktioniert ähnlich wie die Hit Test API und ermöglicht das Erstellen und Feuern eines virtuellen Strahls in die Szene. Wird dieser Strahl von einem Objekt geschnitten, wird dieses als Ergebnis des Raycasts zurückgegeben. Die Funktion nutzt verschiedene Hilfsfunktionen, um diese Logik zu implementieren, wie in @figure-handleSelectFirst dargestellt.

#let code = ```js
export async function handleSelect() {
	this.raycaster.controller.setFromXRController(this.controller);
	let options = [...];
	const data = this.raycast(this.raycaster.controller, options);
	const type = getType(data);
}
```

#figure(
  code,
  caption: [Auszug der "handleSelect" Funktion von @appendix-handleSelect]
) <figure-handleSelectFirst>

Wie zuvor im User Flow dargestellt, wird anschließend die Art des angetippten Elements ausgewählt und die entsprechende Interaktion ausgeführt. Die Funktion dient hierbei als zentrale Steuerung der Anwendung und entscheidet durch aufbauende if-Abfragen, welche Interaktion ausgeführt wird. In @figure-handleSelectSecond wird ein weiterer Ausschnitt der "handleSelect"-Funktion dargestellt. Nachdem die Art des angetippten Elements ermittelt wurde, wird die jeweilige Interaktion durchgeführt. Im Falle eines 2D-Interfaces wird weiter auf die Art des Menüs überprüft, wie bereits im User Flow beschrieben. Die Funktion nutzt die handleDisplay-Funktion, um das Anzeigen oder Verstecken von Elementen zu steuern. Durch die Sammlung der gesamten Interaktionslogik in dieser Funktion kann die Anwendung leicht angepasst und durch neue Interaktionen erweitert werden.

#let code = ```js
export async function handleSelect() {
	if (type.ui) {
		if (data.object.userData.isCreate) {
			handleUI(this, data);
		}

		if (data.object.userData.isRemove) {
			this.selection.remove(this.selected);
		}

		handleDisplay(this, {
			menu: {
				create: false,
				remove: false,
			},
			selected: false,
			appendOptions: false,
		});

		return;
	}
}
```

#figure(
  code,
  caption: [Auszug der "handleSelect" Funktion von @appendix-handleSelect]
) <figure-handleSelectSecond>