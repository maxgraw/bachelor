Im folgenden Kapitel wird die Struktur der Anwendung definiert, welche auf Grundlage der Zielgruppen- und Anforderungsanalyse entwickelt wurde. Hierbei wird zunächst eine theoretische Grundstruktur der Anwendung definiert, welche auf Grundlage der zuvor gesammelten Informationen definiert wird.

=== Hardware
Zunächst kann die Anwendung in ihre Hardware-Komponenten aufgeteilt werden. Wie in der Zielgruppenanalyse beschrieben, handelt es sich bei der Primärgruppe um Endnutzer, welche die Software zur Planung und Visualisierung von Möbeln einsetzen möchten. Aus dieser Analyse ergeben sich direkte Anforderungen an die Hardware. Die Verwendung von spezialisierter Hardware kann zwar Vorteile in Bezug auf die Performance und Interaktion bieten, jedoch ist die Nutzerbasis deutlich geringer als bei Smartphones und Tablets. Hierbei kann die Nutzerbasis als ausschlaggebender Faktor für die Auswahl der Hardware betrachtet werden. Smartphones und Tablets bieten eine breite Nutzerbasis und sind bereits im Besitz der Zielgruppe.

=== Software
Im nächsten Schritt wird die Software-Komponente der Anwendung definiert. Wie in der Zielgruppen- und Anforderungsanalyse beschrieben, soll die Anwendung in bereits bestehende Systeme integriert werden. Die Anwendung sollte daher nicht als eigenständige Software entwickelt werden, sondern als Modul, das in bestehende Systeme integriert werden kann.

In @web-components-chapter wurde die Verwendung von Web Components vorgestellt. Hierbei handelt es sich um eine Reihe an Web-API, die es ermöglichen, abgekapselte und wiederverwendbare Komponenten in Webdokumenten und Webanwendungen zu erstellen. Diese Technologie erfüllt somit die gestellten Anforderungen an die Anwendung. Es handelt sich um einen etablierten Webstandard, der ohne externe Abhängigkeiten genutzt werden kann. Dieser Punkt ist von Bedeutung, da die Verwendung von externen Frameworks, z. B. für User Interfaces, zwar Vorteile in Bezug auf die Entwicklungsgeschwindigkeit bietet, jedoch auch Nachteile darstellt. Dazu gehört die Abhängigkeit von externen Bibliotheken und die Notwendigkeit, auf die Weiterentwicklung des Frameworks zu vertrauen. Zudem müssen zur Erweiterung und Wartung der Anwendung Entwickler mit spezifischen Kenntnissen aller Frameworks ausgestattet sein oder diese Kenntnisse erwerben.

=== Import/Export
Das Import- und Exportmodul ist ein zentrales Element der Anwendung, da es die Schnittstelle zu bestehenden Systemen bildet. Zunächst muss festgelegt werden, welche Daten importiert und exportiert werden sollen. Importiert werden Möbelstücke mit Metadaten, wie interne IDs und Namen aus dem Shopsystem. Exportiert werden die vom Nutzer erstellten Daten, insbesondere Auswahl und Anzahl der Möbelstücke.

3D-Modelle der Möbelstücke können in verschiedenen Formaten vorliegen. In dieser Arbeit wird der Open Source glTF-Standard verwendet, der mehrere für die Anwendung relevante Vorteile bietet. Das Format glTF wird von vielen 3D-Modellierungsprogrammen unterstützt, was die Integration in bestehende Systeme erleichtert. Zudem ist der Standard auf die Echtzeitdarstellung optimiert, was insbesondere für die Nutzung auf Smartphones und Tablets von Bedeutung ist. Dies ermöglicht eine hohe Performance bei der Darstellung der 3D-Modelle. Darüber hinaus können Materialien und Texturen direkt in glTF-Dateien gespeichert werden, was den Importprozess vereinfacht @gltf-format.

Die zuvor erwähnten Metadaten der Möbelstücke könnten theoretisch direkt im glTF-Format gespeichert werden. Dies würde jedoch den direkten Zugriff auf das 3D-Modell zum Erstellen, Bearbeiten und Auslesen der Metadaten erfordern. Dadurch würde die Wartbarkeit und Erweiterbarkeit der Anwendung erschwert. Daher sollten die Metadaten in einem separaten Format importiert werden.

Web Components bieten verschiedene Ansätze für den Datenimport. Eine Möglichkeit besteht darin, Daten über externe APIs zu laden. Alternativ können die Daten als Attribute an die Web Component übergeben werden. Diese Methode ermöglicht es, die Daten direkt im HTML-Code zu definieren, wodurch die Notwendigkeit entfällt, neue API-Endpunkte für die Datenbereitstellung zu erstellen, was die Integration in bestehende Systeme erleichtert.

#let code = ```html
<component data="[box.gltf, apple.gltf]"></component>
```

#figure(
  code,
  caption: [Beispiel für den Import von Daten über Attribute]
)

Das Importieren von Daten über Attribute kann durch die Verwendung von verschachtelten Web Components weiter verbessert werden. Wie zuvor festgestellt, sollten Metadaten getrennt von den 3D-Modellen importiert werden. Durch die Verschachtelung können Metadaten separat, aber in Bezug auf das jeweilige 3D-Modell definiert werden. Diese Methode ermöglicht eine klarere Strukturierung und verbessert die Wartbarkeit des Codes, da sie sich an den gängigen Strukturen von HTML-Elementen orientiert.

#let code = ```html
<component>
  <component-option data="box.gltf" shopId="1"></component-option>
  <component-option data="apple.gltf" shopId="2"></component-option>
</component>
```

#figure(
  code,
  caption: [Beispiel für den Import von Daten über verschachtelte Web Components]
)

Web Components bieten die Möglichkeit, Daten durch die Nutzung von Events zu exportieren. Diese Events ermöglichen die Kommunikation mit anderen Systemen oder Komponenten und können durch Benutzerinteraktionen ausgelöst werden. Es kann grundlegend zwischen externen und internen Events unterschieden werden. Bei externen Events überwacht das externe System die Anwendung und führt die Logik des Datenexports aus. Im Gegensatz dazu wird bei internen Events die Exportlogik innerhalb der Anwendung ausgeführt. Da die Anforderungen an die Schnittstelle je nach externem System variieren können, ist es notwendig, dass die Anwendung flexible und beide Methoden des Datenexports bereitstellt.

=== Darstellung
Für die Darstellung der Augmented Reality-Anwendung wird WebXR verwendet. Im @webxr-frameworks-chapter wurden verschiedene Frameworks untersucht, die die Arbeit mit WebXR erleichtern. Für diese Arbeit wurde Three.js ausgewählt. Three.js ist ein etabliertes Framework, das hinsichtlich Downloadzahlen und Community die höchste Relevanz besitzt @frameworks-stars @frameworks-download. Im Vergleich zu Babylon.js bietet Three.js eine schlankere API, die eine bessere Anpassung an die spezifischen Anforderungen der Anwendung ermöglicht. Babylon.js verfügt über viele vorgefertigte Funktionen, die jedoch für diese Anwendung keine relevanz besitzen. Ein weiteres Framework, A-Frame, ermöglicht die deklarative Erstellung von AR-Szenen über HTML-Tags und baut dabei auf Three.js auf. Diese Abstraktionsebene ist jedoch für die vorliegende Anwendung nicht notwendig und kann direkt in Three.js erreicht werden.

Wie bereits im @webxr-frameworks-chapter über WebXR-Frameworks beschrieben, bietet Three.js eine umfangreiche Unterstützung für die Entwicklung von 3D- und WebXR-Anwendungen. Das Framework ermöglicht die Erstellung und Verwaltung von komplexen 3D-Szenen und -Logiken und bietet die Möglichkeit, mit WebXR-APIs zu interagieren.

=== Interface
Das Interface der Anwendung basiert auf den zuvor definierten Kapiteln der Darstellung und bildet die Grundlage für die Interaktion. Augmented Reality stellt grundsätzlich besondere Herausforderungen an die Entwicklung von Interfaces. Durch die frei bewegliche Ansicht können Informationen, die im Raum platziert sind, übersehen oder nicht aufgenommen werden. Diese Problematik wird durch die begrenzte Ansicht eines Smartphones noch verstärkt. Aus diesem Grund sollte beim Design des Interfaces darauf geachtet werden, dass wichtige Informationen unabhängig von der Kameraposition und -drehung sichtbar sind. Hierbei bietet es sich an, die Informationen in Bezug auf Position und Drehung mit der Kameraposition zu verbinden, um eine durchgehend sichtbare Darstellung zu gewährleisten.

=== Interaktion
Die Interaktion mit der Anwendung beschreibt die Schnittstelle zwischen Endbenutzer und Anwendung. Augmented Reality bietet grundsätzlich eine Vielzahl von Interaktionsmöglichkeiten. Durch die Fokussierung auf Smartphones und Tablets als Hardware sowie die Verwendung von WebXR als Technologie wird die Anzahl der Interaktionsmöglichkeiten jedoch eingeschränkt. Diese Einschränkung muss nicht als Nachteil angesehen werden, da die Verwendung von Smartphones die Interaktion über den Touchscreen ermöglicht. Hierbei kann durch Tippen auf den Bildschirm die jeweilige Interaktion ausgelöst werden. Dadurch kann auf bereits bekannte Interaktionsmuster zurückgegriffen werden, was die Benutzererfahrung der Anwendung verbessert.

Zusätzlich kann auch die Kamera des Smartphones als Interaktionsmöglichkeit genutzt werden. Durch die Verwendung der Kamera sowie die Erfassung von Position und Drehung des Geräts kann die Position der Möbelstücke bestimmt werden. Die Interaktion bzw. die Struktur dieser wird im Folgenden Abschnitt genauer erläutert. Hierbei wird ein User-Flow erstellt, um die Interaktion und Abläufe der Anwendung zu visualisieren.