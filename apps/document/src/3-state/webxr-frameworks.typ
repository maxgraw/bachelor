Wie im @webgl-chapter definiert, ermöglicht die Kombination der WebXR Device API die Entwicklung von Augmented Reality Anwendungen im Web. Um den Entwicklungsprozess zu vereinfachen, existieren verschiedene Frameworks, die die Funktionalitäten von WebGL und WebXR abstrahieren und vereinfachen. Nachfolgend wird eine Auswahl an Frameworks vorgestellt, die für die Entwicklung von WebXR-Anwendungen besonders relevant sind. Diese Übersicht stellt keine vollständige Liste dar, sondern zeigt die relevantesten Frameworks, die für die Entwicklung von WebXR-Anwendungen verwendet werden können. Die Relevanz wurde hierbei anhand der Anzahl der GitHub-Sterne und npm-Downloads bestimmt @frameworks-stars @frameworks-download. Des Weiteren wird in der Übersicht der Funktionen einzelner Frameworks auf Aspekte eingegangen, die für die Entwicklung von WebXR-Anwendungen von besonderer Relevanz sind. Es findet jedoch nur ein Überblick über die Funktionalitäten statt, um die Unterschiede und Gemeinsamkeiten der Frameworks zu verdeutlichen.

=== Babylon.js
Babylon.js ist ein Open-Source-Framework für die Entwicklung von 3D-Anwendungen im Web. Es basiert auf WebGL und ermöglicht das Erstellen komplexer 3D-Szenen. Das Framework bietet eine Vielzahl von Funktionen, die die Entwicklung von 3D-Anwendungen vereinfachen.

Für die Darstellung von 3D-Anwendungen verwendet Babylon.js einen Szenengraphen, der die Struktur einer Szene definiert. Der Szenengraph besteht aus vordefinierten Objekten wie Lichtquellen, Kameras, Meshes und Animationen. Diese Objekte können in einer Hierarchie angeordnet werden, um die Struktur der Szene zu definieren @babylonjs-graph. Dies ermöglicht einen modularen Aufbau komplexer Szenen und die Wiederverwendung häufig genutzter Elemente. Hierbei wird jedes Objekt sowie die Szene selber als Instanz einer Klasse definiert, die spezifische Eigenschaften und Methoden besitzt. Desweiteren bietet Babylon.js weitere Module und Funktionen, welche spezifische Anforderungen an 3D-Anwendungen abdecken. Dazu gehört eine Physik-Engine sowie ein Partikelsystem. Im Folgenden wird jedoch der Fokus auf die Funktionen und Anbindung an die WebXR Device API gelegt.

Babylon.js unterstützt das Erstellen von WebXR-Anwendungen ohne zusätzliche Bibliotheken. Um die Arbeit mit der WebXR Device API zu erleichtern und alle Voraussetzungen für eine korrekte Darstellung und Interaktion zu bieten, stellt Babylon.js die Klassen WebXRExperienceHelper und WebXRDefaultExperience zur Verfügung. Beide Klassen bündeln die notwendigen Funktionen und Voraussetzungen, um die Entwicklung von WebXR-Anwendungen zu ermöglichen. 

Die Klasse WebXRExperienceHelper initialisiert die XR-Szene mit allen notwendigen Elementen und Parametern. Es wird eine XR-Kamera erstellt, die für die Darstellung der Szene aus der Perspektive des Benutzers erforderlich ist. Darüber hinaus übernimmt der WebXRExperienceHelper die Initialisierung des Features Managers, welcher für die Verwaltung und Ergänzung spezifischer Funktionen innerhalb der XR-Szene zuständig ist. Zudem bietet die Klasse Hilfsfunktionen an, um die XR-Session zu starten und zu beenden @babylonjs-webxr-experience-helper.

#let code = ```js
const xrHelper = await WebXRExperienceHelper.CreateAsync(scene);
```

#figure(
  code,
  caption: [Erstellen eines WebXRExperienceHelper in Babylon.js]
)

Die Klasse WebXRDefaultExperience erweitert die Funktionalitäten des WebXRExperienceHelper und bietet zusätzliche Funktionen, die für die Entwicklung von WebXR-Anwendungen nützlich sind. Zunächst wird ein HTML-Button bereitgestellt, welcher es ermöglicht, in die XR-Sitzung einzutreten. Parallel dazu initialisiert der Helper die Input Klasse, welche die Controller initialisiert und damit die Interaktion innerhalb der XR-Umgebung ermöglicht @babylonjs-webxr-experience-helper.

#let code = ```js
var defaultXR = await WebXRDefaultExperience.CreateAsync(scene, {});
```

#figure(
  code,
  caption: [Initialisierung der WebXRDefaultExperience-Klasse in Babylon.js]
)

Babylon.js bietet somit eine umfassende Unterstützung für die Entwicklung von WebXR-Anwendungen und ermöglicht es Entwicklern, komplexe 3D-Szenen zu erstellen und in einer XR-Umgebung darzustellen. Durch die Bereitstellung von Klassen wie WebXRExperienceHelper und WebXRDefaultExperience wird die Arbeit mit der WebXR Device API vereinfacht und die Entwicklung von WebXR-Anwendungen beschleunigt.

=== Three.js
Three.js ist ein weiteres Open-Source-Framework zur Entwicklung von 3D-Anwendungen im Web und basiert ebenfalls auf WebGL. Es bietet eine umfangreiche Auswahl an Funktionen, die die Erstellung von 3D-Szenen vereinfachen.

Innerhalb von Three.js wird ein Szenengraph verwendet, um die Struktur einer Szene zu definieren. Dieser Szenengraph besteht aus verschiedenen Objekten wie Lichtquellen, Kameras, Meshes und Animationen, die in einer Hierarchie angeordnet werden können. Die Definition von Objekten als Instanzen von Klassen ermöglicht eine modulare Struktur und fördert die Wiederverwendung von Elementen.

Die Integration mit der WebXR Device API erfolgt in Three.js über die Klasse WebGLRenderer. Diese Klasse initialisiert die Three.js-Szene und übernimmt die Verwaltung der Anwendung. Um die XR Device API zu aktivieren, muss die Eigenschaft xr.enabled auf true gesetzt werden wodurch die Klasse um die interne WebXRManager Klasse erweitert wird @threejs-webxr.

#let code = ```js
const renderer = new WebGLRenderer();
renderer.xr.enabled = true;
```

#figure(
  code,
  caption: [Erstellen eines WebGLRenderers in Three.js mit aktivierter WebXR Device API]
)

Im Vergleich zu Babylon.js, das spezifische Klassen wie WebXRExperienceHelper oder WebXRDefaultExperience bietet, erfolgt die Integration mit der WebXR Device API in Three.js direkt über die WebGLRenderer-Klasse. Zudem werden weniger Hilfsfunktionen bereitgestellt, was zu einer schlankeren API führt und den Fokus auf selbst implementierte Funktionen legt.

=== A-Frame
A-Frame ist ein weiteres Open-Source-Framework für die Erstellung von AR und VR Anwendungen im Web, das auf der Entity-Component-System-Architektur basiert @a-frame-introduction. Es baut hierbei auf Three.js auf und bietet eine deklarative HTML-Schnittstelle zur Erstellung von AR-Szenen.

In A-Frame wird eine Szene durch HTML-Tags dargestellt, wobei jede Entität als eigenständiges HTML-Element repräsentiert wird. Entitäten können durch das Hinzufügen von Komponenten, die Funktionen und Eigenschaften definieren, erweitert werden. Dies ermöglicht eine hohe Modularität und Wiederverwendbarkeit von erstellten Elementen und Logiken @a-frame-introduction.

Die Interaktion mit der WebXR Device API wird in A-Frame nahtlos umgesetzt. Das Framework passt sich automatisch an die Anforderungen von AR-Sessions an. Entwickler können durch einfaches Hinzufügen spezifischer AR-Komponenten immersive AR-Szenen erstellen @a-frame-introduction.

#let code = ```html
<a-scene xr="true">
  <a-entity camera position="0 1.6 0"></a-entity>
</a-scene>
```

#figure(
  code,
  caption: [Erstellen einer AR-Szene in A-Frame]
)

Im Gegensatz zu komplexeren Frameworks wie Three.js oder Babylon.js, die oft umfangreiche Programmkenntnisse erfordern, ermöglicht A-Frame die Erstellung von AR-Anwendungen durch eine intuitive und deklarative HTML-Schnittstelle. Dies macht das Framework besonders zugänglich für Web-Entwickler und reduziert die Einarbeitungszeit erheblich @a-frame-introduction.