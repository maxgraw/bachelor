Im vorherigen Kapitel wurden bereits die Grundlagen der Architektur und Technologie der Anwendung beschrieben. Hierbei wurde auch die Grundsätzliche Render Funktion der Anwendung dargestellt. Im Folgenden wird genauer auf die Darstellung der Anwendung eingegangen.

Um die Verschmelzung von realer und virtueller Welt zu verbessern, wird in der Anwendung ein Schattenwurf implementiert. Hierbei wird ein Schattenwurf für die 3D-Objekte in der Szene erstellt, um die Illusion von Tiefe und Realismus zu erhöhen. 

Three.js ermöglicht das Aktivieren von Schatten durch die Verwendung von Lichtquellen und Shadow Mapping wie in @figure-initShadow dargestellt. Shadow Mapping beschreibt den Prozess, bei dem Schatten zu einer 3D-Szene hinzugefügt werden. Dabei unterstützt Three.js verschiedene Arten von Shadow Mapping. In der Anwendung wurde "PCFSoftShadowMap" verwendet. Dieser Typ bietet einen weichen Schattenwurf, der besonders bei niedriger Auflösung der Schatten-Map geeignet ist. Obwohl er rechenintensiver als andere Typen ist, wird die Performance aufgrund der begrenzten Anzahl an 3D-Objekten in der Anwendung nicht stark beeinträchtigt.

#let code = ```js
renderer.shadowMap.enabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
```

#figure(
  code,
  caption: [Initialisierung des Shadow Mapping in Three.js]
) <figure-initShadow>

Im @webxr-lighting-chapter wurde die WebXR Estimated Light API vorgestellt. Diese API ermöglicht es, die Lichtverhältnisse in der realen Welt zu schätzen und diese Informationen in der AR-Anwendung zu verwenden. Dadurch wird eine realistischere Darstellung der 3D-Objekte in der Szene ermöglicht, was zu einer besseren Verschmelzung von realer und virtueller Welt führt. Three.js implementiert diese API und ermöglicht die direkte Verwendung in der Anwendung.

Zunächst muss eine neue Instanz der XREstimatedLight-Klasse initialisiert werden. In @figure-light wird diese Instanz erstellt. Anschließend wird mithilfe von EventListenern auf die Events "estimationstart" und "estimationend" auf die Verfügbarkeit der API gewartet. Sollte die API verfügbar sein und die Schätzung der Lichtverhältnisse beginnen, wird durch das Event "estimationstart" die Lichtquelle der Szene hinzugefügt und die Standardlichtquelle entfernt. Wenn die Schätzung beendet ist, wird durch das Event "estimationend" die Lichtquelle wieder entfernt und die Standardlichtquelle hinzugefügt.

Durch das Abwarten eines Events kann im Sinne des Progressive Enhancement auch ohne Verfügbarkeit der API eine alternative Darstellung gewählt werden. In diesem Fall wird eine vorgefertigte statische Lichtquelle verwendet.

#let code = ```js
const xrLight = new XREstimatedLight(renderer);

xrLight.addEventListener("estimationstart", () => {
  scene.add(xrLight);
  scene.remove(defaultLight);
});

xrLight.addEventListener("estimationend", () => {
  scene.add(defaultLight);
  scene.remove(xrLight);
});
```

#figure(
  code,
  caption: [Integration der WebXR Estimated Light API in Three.js]
) <figure-light>

Wie zuvor definiert verwendet die Anwendung das Stackcube System. Hierbei wurde die 3D-Modelle der einzelnen Möbelstücke bereitgestellt. Um eine realistische Darstellung der Möbelstücke zu ermöglichen, wurden die Modelle und Texturen in Blender importiert und leicht angepasst. Hierbei wurde die Größe sowie Texturskalierung einzelner Modelle angepasst, um eine realistische Darstellung in der Anwendung zu ermöglichen. Anschließend wurden die Modelle in das glTF-Format exportiert.