Die WebXR Device API stellt eine Sammlung von Standards dar, die das Erstellen und die Interaktion mit 3D-Szenen in virtuellen und erweiterten Realitäten ermöglichen. Diese API unterstützt eine Vielzahl von Geräten, darunter mobile Endgeräte, 3D-Headsets und Datenbrillen @webxr-spec. WebXR ersetzt die ältere WebVR API, die ausschließlich für VR-Inhalte konzipiert war. Im Gegensatz dazu ermöglicht WebXR sowohl AR- als auch VR-Inhalte und ist somit die zukünftige Standard-API für immersive Inhalte im Web. Zum Zeitpunkt dieser Arbeit befindet sich die API im W3C Candidate Recommendation Draft, wird jedoch bereits von 74,37 % der Nutzer weltweit unterstützt @can-i-use-webxr, @webxr-spec. Diese hohe Zahl ist hauptsächlich auf die Dominanz von Android-Geräten und den weit verbreiteten Einsatz von Chrome, der einen Marktanteil von 65 % hat, zurückzuführen @browser-market-share.

Bei der Überprüfung der Kompatibilität in verschiedenen Browsern zeigt sich, dass WebKit, die Browser-Engine für Safari und Safari auf iOS-Geräten, die API derzeit nicht unterstützt @can-i-use-webxr. Folglich kann die API gegenwärtig nicht auf Apple-Geräten genutzt werden.

WebXR dient hierbei nicht als direkte Render-API, sondern bietet eine Schnittstelle zur Interaktion mit den Geräten. Für das Rendering kann WebGL verwendet werden, welches im @webgl-chapter näher erläutert wird. Im Folgenden wird eine relevante Auswahl an APIs und Methoden der WebXR Device API vorgestellt, die für die Konzeption und Implementierung der Anwendung von Bedeutung sind.

=== Modell
Das Modell beschreibt ein WebXR-kompatibles Gerät, welches Informationen über diese Schnittstelle abrufen und darstellen kann. Ein XR-Device ist hierbei eine physische Einheit, die immersive Inhalte wiedergibt. Inhalte gelten als immersiv, wenn sie visuelle, auditive oder andere sensorische Ausgaben erzeugen, die die Umgebung des Benutzers simulieren oder erweitern @webxr-spec.

Einzelne XR-Devices können unterschiedliche Modi unterstützen, wobei grundlegend zwischen "immersive-vr" und "immersive-ar" unterschieden wird. Jedes XR-Gerät verfügt über eine Liste der unterstützten Modi und eine Reihe zugesicherter Funktionen für jeden Modus, die im Vorfeld festgelegt werden @webxr-spec.

=== System
Das XRSystem stellt alle WebXR-APIs zur Verfügung. Es ist verantwortlich für die Erstellung von XR-Geräten, die Verwaltung von XR-Sessions und die Bereitstellung von XR-Ansichten. Das XRSystem wird über das Attribut "xr" des Interfaces Navigator bereitgestellt wie in @navigator-listing dargestellt @webxr-spec. Das Interface repräsentiert den User Agent und ermöglicht das Abfragen von Statusinformationen und Details. Ein User Agent ist jede Software, die Webinhalte für Endbenutzer abruft und darstellt oder mithilfe von Webtechnologien implementiert ist @user-agent.

#let code = ```ts
partial interface Navigator {
  [SecureContext, SameObject] readonly attribute XRSystem xr;
};
```

#figure(
  code,
  caption: [Navigator Interface]
) <navigator-listing>

=== Session
Eine XRSession stellt ein Objekt im WebXR Interface dar, welche für die Interaktion mit der XR-Hardware zuständig ist. Die XRSession wird durch die Methode "requestSession" eines XRSystem Objektes initialisiert. Wie in @requestSession-listing dargestellt, erwartet die Funktion den Modus der Session sowie optional ein XRSessionInit Objekt, welches die gewünschten Features definiert @webxr-spec.

#let code = ```ts
requestSession(XRSessionMode mode, optional XRSessionInit options = {});
```

#figure(
  code,
  caption: [requestSession Funktion]
) <requestSession-listing>

==== XRSessionMode
Jede XRSession besitzt einen Modus, der im XRSessionMode definiert ist. In dieser Arbeit liegt der Fokus auf dem Modus "immersive-ar", der vom WebXR Augmented Reality Module definiert wird. Dieses Modul stellt eine Erweiterung der WebXR Device API dar und signalisiert, dass die Sitzung Zugriff auf das verwendete Display erhält und Inhalte so darstellen kann, dass sie mit der realen Welt verschmelzen @webxr-spec @webxr-ar-module.

#let code = ```ts
enum XRSessionMode {
  "inline",
  "immersive-vr",
  "immersive-ar"
};
```

#figure(
  code,
  caption: [Enum der Session-Modi]
)

==== Feature Dependencies
Einige Features einer XRSession sind möglicherweise nicht universell verfügbar. Hierbei können sowohl Hardware- als auch Softwareunterschiede der jeweiligen Geräte eine Rolle spielen. Des Weiteren stellen einige Funktionen sensible Informationen bereit, die erst nach einer expliziten Zustimmung des Nutzers abgerufen werden sollten. So stellt das Scannen eines Gesichts ein erhebliches Datenschutzrisiko dar @webxr-spec.

Um die Verfügbarkeit von Features zu überprüfen kann bei der Initialisierung einer XRSession ein Lexikon mit den gewünschten Features übergeben werden. In @XRSessionInit-listing wird das XRSessionInit Dictionary definiert, welches die Features in zwei Listen aufteilt. Im Sinne von Progressive Enhancement können Features als optional oder erforderlich definiert werden. Erforderliche Features müssen vom XR-Device unterstützt werden, um eine XRSession zu erstellen. Optionale Features können unterstützt werden @webxr-spec.

#let code = ```ts
dictionary XRSessionInit {
  sequence<DOMString> requiredFeatures;
  sequence<DOMString> optionalFeatures;
};
```

#figure(
  code,
  caption: [Das XRSessionInit Dictionary]
) <XRSessionInit-listing>

=== Spaces
Eine Grundfunktion der WebXR Device API besteht in der Bereitstellung von "Spatial Tracking". Hierbei stellt ein XRSpace ein Interface dar, das die räumlichen Beziehungen und die Anordnung von Objekten in einer virtuellen oder erweiterten Realität ermöglicht. Die API ermöglicht das Tracking von virtuellen Objekten, Nutzern sowie Eingabegeräten @webxr-spec.

Ein XRSpace stellt ein virtuelles Koordinatensystem dar, dessen Ursprung einem physischen Standort entspricht. Wie in @XRSpace-listing dargestellt, ist das bereitgestellte Interface abstrakt. Die Implementierung sowie das Tracking der Position finden nativ im XRDevice statt. Die verwendete Technologie und Methodik können sich hierbei von Gerät zu Gerät unterscheiden. Die API ermöglicht ein geräteübergreifendes, einheitliches Interface, das unabhängig von der verwendeten Technologie und Tracking-Methode ist @webxr-spec.

#let code = ```ts
[SecureContext, Exposed=Window] interface XRSpace : EventTarget {
  // Implementation
};
```

#figure(
  code,
  caption: [Das XRSpace Interface]
) <XRSpace-listing>

==== XRReferenceSpace
Die Anforderungen an virtuelle Räume unterscheiden sich in Bezug auf die Positionierung und Orientierung der Objekte sowie die Bewegung innerhalb des Raumes. Die WebXR Device API definiert verschiedene vorgefertigte Referenzräume, die Anforderungen an die Positionierung und Orientierung der Objekte festlegen @webxr-spec.

Im Folgenden wird auf relevante Referenzräume eingegangen, die für die Implementierung der Anwendung von Bedeutung sind. Der Local-Space ist ein Raumtyp, dessen Koordinatensystemursprung nahe der ursprünglichen Position des Benutzers liegt. Dieses Koordinatensystem eignet sich optimal für Anwendungen, bei denen der Benutzer nicht weit von seinem Startpunkt entfernt ist. Eine Erweiterung des Local-Space stellt der Local-Floor-Space dar, der zusätzlich die Bodenhöhe berücksichtigt. Der Ursprung dieses Raumes wird auf Bodenniveau festgelegt, was eine präzise Platzierung von Objekten auf dem Boden ermöglicht und die Immersion in Anwendungen verstärkt, bei denen der Benutzer steht oder sich nur geringfügig bewegt. Schließlich bietet der Bounded-Floor-Space eine klar definierte Umgebung mit festgelegten Grenzen, innerhalb derer sich der Benutzer bewegen kann. Diese Grenzen werden durch ein Polygon definiert, das die Bewegungsfreiheit sicher und vorhersehbar gestaltet @webxr-spec.

=== Input
Die WebXR Device API ermöglicht es, mit kompatiblen Eingabegeräten zu interagieren, indem sie das XRInputSource Interface verwendet. Dieses Interface dient zur Repräsentation von Eingabegeräten in der XR-Umgebung. Eingabemechanismen, die nicht explizit mit dem XR-Gerät verbunden sind, wie herkömmliche Gamepads, Mäuse oder Tastaturen, werden nicht als XR-Eingabequellen betrachtet @webxr-spec @webxr-gamepad-module.

Das XRInputSource stellt hierbei ein abstraktes Interface dar, welches es ermöglicht unterschiedliche Eingabegeräte zu repräsentieren. Einzelne Eingabegeräte können sich in der Verfügbarkeit von Features oder der insgesamten Funktionalität unterscheiden. Die API definiert verschiedene Kategorien und Funktionen, wodurch die Interaktion einheitliche gestaltet werden kann.

Der XRTargetRayMode beschreibt die Methode zur Erzeugung eines Zielstrahls, wodurch die Darstellung und Interaktion dieses Strahls an das jeweilige Gerät angepasst werden kann. Die vier Modi sind „gaze“, „tracked-pointer“, „screen“ und „transient-pointer“. Der Modus „gaze“ bezeichnet einen Zielstrahl, der vom Betrachter ausgeht und der Blickrichtung folgt, häufig in Head-Mounted Displays verwendet. Der Modus „tracked-pointer“ beschreibt einen Zielstrahl, der von einem Handheld-Gerät oder Hand-Tracking-Mechanismus stammt und ergonomischen Richtlinien folgt, wobei er in die Richtung des ausgestreckten Zeigefingers zeigt. „Screen“ bezeichnet eine Eingabe, die durch Interaktion mit dem Canvas-Element erfolgt, beispielsweise durch Mausklick oder Touch-Event. „Transient-pointer“ bedeutet, dass die Eingabequelle aus Betriebssystem-Interaktionen stammt und nicht von spezifischer Hardware. Dies umfasst Benutzerabsichten, die auf sensiblen Informationen basieren, oder Eingaben von unterstützenden Technologien, ohne direkt die Nutzung solcher Technologien zu offenbaren @webxr-spec.

=== Events
Um auf Änderungen in der XR-Umgebung zu reagieren, bietet die WebXR Device API verschiedene Events, die von der XRSession und den XRInputSources ausgelöst werden. Diese Events ermöglichen es, auf Benutzereingaben zu reagieren, die Position und Orientierung von Objekten zu aktualisieren und die Interaktion mit der XR-Umgebung zu steuern @webxr-spec.