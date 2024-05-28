Um die Anforderungen an die Benutzeroberfläche zu visualisieren, wurden Wireframes erstellt. Dabei dienen die zuvor definierten Anforderungen sowie der User Flow als Grundlage. Die Wireframes wurden mithilfe des 3D-Modellierungsprogramms Blender erstellt. Das Wireframe stellt hierbei keine endgültige Version der Benutzeroberfläche dar, sondern dient als Grundlage für die Implementierung der Anwendung.

Im Folgenden werden einzelne Bilder des Wireframes als Screens bezeichnet. Es handelt sich hierbei nicht um klassische Screens einer Anwendung, sondern um spezifische Ansichten. Die Bezeichnung Screens hilft jedoch dabei, die einzelnen Ansichten voneinander zu unterscheiden. Das Wireframe besteht aus sechs verschiedenen Screens, die alle zuvor definierten Interaktionen und Informationen darstellen. Die Screens werden in ihrer Reihenfolge dargestellt und bieten einen Programmablauf, der die Interaktion des Benutzers mit der Anwendung widerspiegelt.

#grid(
  columns: (1fr, 1fr, 1fr),
  rows: (auto),
  gutter: 20pt,
  figure(
    image("../media/wireframe/screen1.jpg", width: 100%),
    caption: [Erste Screen - Cursor auf dem Boden],
  ),
  figure(
    image("../media/wireframe/screen2.jpg", width: 100%),
    caption: [Zweite Screen - Menü "Auswahl" wird angezeigt],
  ),
  figure(
    image("../media/wireframe/screen3.jpg", width: 100%),
    caption: [Dritte Screen - Möbelstück wird platziert],
  ),
)

Der erste Screen zeigt den Beginn der zweiten Interaktionsphase, die bereits im User Flow definiert wurde. Es wird ein Cursor auf dem Boden dargestellt, der eine geeignete Fläche zur weiteren Interaktion signalisiert. Der Cursor folgt hierbei der Position und Rotation der Kamera. Der zweite Screen zeigt das Menü "Auswahl". Dieses Menü ermöglicht die Auswahl eines Möbelstücks zur Platzierung. Um sicherzustellen, dass das Menü unabhängig von der Position oder Rotation der Kamera sichtbar bleibt, wird es am unteren Bildschirmrand platziert. Diese Positionierung gewährleistet eine ergonomische Bedienung und eine kontinuierliche Sichtbarkeit, wie im Kapitel zur Architektur beschrieben. Auf dem dritten Screen wird der Abschluss der Interaktion dargestellt. Durch die Auswahl einer Option wird ein Möbelstück in der Szene platziert und alle Menüs werden ausgeblendet. Das System ist nun bereit, einen neuen Interaktionszyklus aufzunehmen.

#grid(
  columns: (1fr, 1fr, 1fr),
  rows: (auto),
  gutter: 20pt,
  figure(
    image("../media/wireframe/screen4.jpg", width: 100%),
    caption: [Vierter Screen - Menüs "Löschen" und "Möbelstück anhängen" sichtbar],
  ),
  figure(
    image("../media/wireframe/screen5.jpg", width: 100%),
    caption: [Fünfter Screen - Menü "Auswahl" wird angezeigt],
  ),
  figure(
    image("../media/wireframe/screen6.jpg", width: 100%),
    caption: [Sechster Screen - Möbelstück wird angehängt],
  ),
)

Wie zuvor im User Flow dargestellt, ermöglicht die Anwendung die Auswahl eines platzierten Möbelstücks. Diese Interaktion wird im vierten Screen dargestellt. Hierbei wird das Menü "Löschen" und "Anhängen" sichtbar. Das Menü "Löschen" ermöglicht das Entfernen des ausgewählten Möbelstücks und wird, wie das Menü "Auswahl", am unteren Bildschirmrand platziert.

Das Menü "Anhängen" stellt jedoch eine Herausforderung dar. Eines der Probleme bei der Interaktion mit Augmented-Reality-Systemen über Bildschirme ist das Mapping von 2D-Eingaben auf 3D-Objekte. Im Fall des "Löschen" oder "Auswahl"-Menüs ist dies unproblematisch, da die 3D-Szene hierbei nicht benötigt wird. Beim "Anhängen"-Menü ist dies jedoch anders. Aus diesem Grund wird eine 3D-Interaktion verwendet. Hierbei werden, wie in der Abbildung dargestellt, Plus-Objekte verwendet, die um das ausgewählte Möbelstück platziert werden. Dadurch kann der Nutzer frei entscheiden, an welcher Stelle das Möbelstück angehängt werden soll.

Der fünfte Screen zeigt das Menü "Auswahl", welches durch die Auswahl eines "Anhängen" Menüs geöffnet wurde. Im Falle des Wireframes wurde das obere "Anhängen"-Menü ausgewählt, wodurch im sechsten Screen ein Möbelstück an das obere Ende des ausgewählten Möbelstücks angehängt wird.