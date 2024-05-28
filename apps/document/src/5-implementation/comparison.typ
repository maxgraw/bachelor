Im Folgenden wird die Implementierung des Systems mit den zuvor definierten Anforderungen verglichen. Es wird aufgezeigt, inwieweit diese Anforderungen umgesetzt wurden und ob sie vollständig erfüllt wurden. Anschließend wird die Implementierung mit dem ursprünglichen Wireframe verglichen, um zu überprüfen, ob die geplanten Designs und Strukturen erfolgreich umgesetzt wurden.

Die Entwicklung des Systems basierte auf spezifischen Anforderungen. Zunächst wird die Fähigkeit der Anwendung betrachtet, 3D-Modelle und die dazugehörigen Metadaten zu importieren. Der Importprozess wurde robust gestaltet, um eine einfache und zuverlässige Integration neuer Modelle zu ermöglichen. Dies wurde durch Tests und Validierungen im Rahmen der Integration in das Shopsystem von Maximilian Patzke bestätigt. Ein zentraler Aspekt der Anwendung ist die Darstellung der 3D-Modelle in der virtuellen Szene. Die Anwendung ermöglicht eine präzise und realitätsgetreue Wiedergabe der geometrischen Eigenschaften sowie der Texturen und Materialien der Modelle. Die Implementierung der StackCube-Modelle stellte sicher, dass die 3D-Modelle korrekt dargestellt werden. Zudem wurde die visuelle Qualität durch die Nutzung von Schatten- und Lichteffekten verbessert. Ein weiteres wichtiges Merkmal ist die Integration und Positionierung importierter 3D-Modelle in einer bestehenden virtuellen Szene. Die Implementierung erlaubt das Scannen der Szene nach nutzbaren Flächen und das Platzieren von 3D-Modellen an ausgewählten Positionen. Jedoch ist eine nachträgliche Positionsänderung der Möbelstücke nicht möglich. Die Anwendung bietet Funktionen zum Arrangieren der 3D-Modelle innerhalb der Szene. Das System ermöglicht das Anhängen von Möbelstücken an bereits platzierte Möbelstücke, wobei zwischen vordefinierten Positionen gewählt werden kann. Ein weiteres wesentliches Feature ist die Selektion von 3D-Modellen innerhalb der Szene. Diese Funktion erlaubt es Nutzern, einzelne Modelle auszuwählen und Aktionen wie Verschieben oder Löschen durchzuführen. Die Selektion der Modelle funktioniert zuverlässig und ermöglicht eine weitere Interaktion mit den ausgewählten Modellen. Zusätzlich enthält die Anwendung eine Funktion zum irreversiblen Entfernen von 3D-Modellen aus der Szene. Dieser Prozess stellt sicher, dass die Modelle vollständig und sicher gelöscht werden. Auch diese Funktion wurde erfolgreich implementiert. Abschließend wurde die Fähigkeit der Anwendung, Metadaten der hinzugefügten 3D-Modelle in verschiedenen Formaten zu exportieren, untersucht. Dies umfasst Informationen wie Modellname, Position, Orientierung und benutzerdefinierte Metadaten. Innerhalb der Integration mit dem Shopsystem von Maximilian Patzke wurde ein erfolgreicher Export der erforderlichen Metadaten implementiert.

Bei der Gegenüberstellung der Implementierung mit dem ursprünglichen Wireframe lässt sich feststellen, dass die grundlegende Menü- und Informationsdarstellung beibehalten und erfolgreich umgesetzt wurde. Die Interfaces orientieren sich deutlich an den im Wireframe vorgegebenen Strukturen.

Die Menüdarstellung folgt den im Wireframe festgelegten Vorgaben. Die Anordnung der Menüpunkte und die visuelle Gestaltung entsprechen den entworfenen Konzepten, wodurch eine intuitive Navigation gewährleistet wird. Auch die Informationsdarstellung wurde gemäß den Wireframe-Vorgaben umgesetzt. Die Positionierung und Darstellung von Informationen, wie Modellnamen, Metadaten und Benutzeraktionen, wurden wie geplant realisiert. Dies ermöglicht eine konsistente und benutzerfreundliche Interaktion innerhalb der Anwendung. Die Implementierung der Interfaces zeigt eine klare Orientierung an den Wireframes, wie in den Abbildungen ersichtlich ist. Dies stellt sicher, dass die Benutzererfahrung den ursprünglich definierten Designprinzipien entspricht und die Erwartungen der Nutzer erfüllt. Die Implementierung des Systems hält sich strikt an die im Wireframe festgelegten Designs für Menü- und Informationsdarstellungen. Dies gewährleistet eine konsistente und intuitive Benutzeroberfläche, die den Anforderungen und Erwartungen der Nutzer entspricht.

#grid(
  columns: (1fr, 1fr, 1fr),
  rows: (auto),
  gutter: 20pt,
  figure(
    image("../media/implementation/view_one.jpeg", width: 100%),
    caption: [Menü "Auswahl" sichtbar],
  ),
  figure(
    image("../media/implementation/view_two.jpeg", width: 100%),
    caption: [Möbelstück wird platziert],
  ),
  figure(
    image("../media/implementation/view_three.jpeg", width: 100%),
    caption: [Menü "Löschen" und "Möbelstück anhängen" sichtbar],
  ),
)

Zusammenfassend lässt sich feststellen, dass die Implementierung des Systems alle definierten Anforderungen erfüllt. Allerdings wurden während der Implementierung einige Herausforderungen und Probleme identifiziert. Die größten technischen Herausforderungen ergaben sich aus dem fehlerhaften Tracking sowie der Tipp-Registrierung. Augmented Reality ist eine Technologie, die trotz ihrer Fortschritte immer noch fehleranfällig ist. Probleme mit den Lichtverhältnissen können dazu führen, dass das Erkennen von Flächen gestört wird. Dies kann zur Folge haben, dass der Cursor nicht angezeigt wird, was zu Verwirrung bei den Nutzern führt. Um dieses Problem zu entschärfen, wurde eine Textanzeige implementiert, die "Kamera bewegen" anzeigt, wenn keine Fläche erkannt wird. Wie bereits zuvor beschrieben, ermöglicht die Nutzung von WebXR die geräteübergreifende Nutzung der Anwendung. Dies stellt jedoch auch Herausforderungen im Hinblick auf die unterschiedlichen Kapazitäten der Geräte dar. Android-Smartphones weisen ein breites Spektrum hinsichtlich Leistung, Kameras und weiterer Sensoren auf. Dies kann zu Inkompatibilitäten führen. Im Rahmen dieser Arbeit wurde die Anwendung hauptsächlich auf einem Gerät getestet, da es aus zeitlichen und finanziellen Gründen nicht möglich war, eine Vielzahl an Geräten zu testen.