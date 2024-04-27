Tracking bezieht sich auf Technologien und Methoden, um die Position und Orientierung von Objekten in Echtzeit zu bestimmen. Dies kann sowohl reale als auch virtuelle Objekte umfassen. Das Ziel des Trackings in der AR ist es, eine nahtlose Interaktion zwischen der realen Welt und digital ergänzten Inhalten zu gewährleisten.

Für eine effektive AR-Anwendung muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen und die virtuellen Objekte entsprechend anzupassen, um eine kohärente und immersivere Erfahrung zu bieten. Dies umfasst das Erkennen und Verfolgen von räumlichen Referenzpunkten, Gesichtern, Gesten oder speziellen Markern.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren, um eine höhere Genauigkeit und Robustheit in verschiedenen Umgebungen zu erreichen. Der Fokus liegt auf Technologien und Methoden, welche für das verständnis von WebXR relevant sind. Es findet keine allgemeine Betrachtung aller Tracking-Verfahren und Technologien statt, sondern eine Auswahl relevanter Methoden.

=== Grundlagen
Zunächst ist die Definition der relevanten Koordinatensysteme erforderlich. Es gibt das Koordinatensystem des AR-Geräts, beispielsweise eines Smartphones oder einer AR-Brille, sowie das globale Koordinatensystem, das die physische Umgebung abbildet. Die Position des Augmented Reality Gerätes im globalen Koordinatensystem wird durch eine Rotationsmatrix $R_"ba"$ und einen Translationsvektor $b_a$ beschrieben. Die gewünschte Position eines virtuellen Objekts wird relativ zum AR-Gerät definiert. Um die tatsächliche Position des virtuellen Objekts im globalen Koordinatensystem zu berechnen, wird die relative Position des Objekts, angegeben durch einen Vektor $m_a$ im Koordinatensystem des Geräts, mit der Rotationsmatrix des Geräts multipliziert und dann der Translationsvektor hinzugefügt.

$ m_b = R_"ba" m_a + a_b $

Der Translationsvektor $a_b$ in der Gleichung ist entscheidend für die korrekte Platzierung des virtuellen Objekts im globalen Koordinatensystem. Er leitet sich aus dem ursprünglichen Translationsvektor $b_a$ ab, der die Verschiebung des Ursprungs des Koordinatensystems des AR-Geräts relativ zum globalen Koordinatensystem beschreibt.

Um $a_b$ zu bestimmen, verwendet man die negative Transformation des Vektors $b_a$ durch die Rotationsmatrix $R_"ba"$. Dieser Schritt ist notwendig, um die ursprüngliche Verschiebung des AR-Geräteursprungs im globalen Koordinatensystem rückgängig zu machen.

$ a_b = -R_"ba"b_a $

Dadurch wird gewährleistet, dass die Position des virtuellen Objekts korrekt, relativ zum globalen Ursprung und nicht zum verschobenen Ursprung des Geräts, berechnet wird. Diese Transformation ermöglicht die präzise Einbettung der Objektkoordinaten in die reale Welt.

=== Inertialsensoren
Inertialsensoren wie Beschleunigungsmesser, Gyroskope und Magnetometer werden oft zusätzlich zu visuellen Sensoren in AR-Tracking-Systemen verwendet. Diese Sensoren messen Bewegungen ohne externe Referenzen und sind in einer Inertialmess-Einheit (IMU) kombiniert. Die Sensororientierung wird über Beschleunigungsmesser und Gyroskopdaten relativ zu einem globalen Koordinatensystem, das gegen die Schwerkraft und zum magnetischen Nordpol ausgerichtet ist, bestimmt.

=== Computer Vision
Computer Vision ist ein zentraler Bestandteil von AR-Tracking-Systemen. Es umfasst Techniken zur Erkennung, Verfolgung und Analyse von Bildern und Videos. Computer Vision-Algorithmen werden verwendet, um visuelle Merkmale in Echtzeit zu erkennen und zu verfolgen, um die Position und Orientierung von Objekten zu bestimmen. Dazu gehören Techniken wie Feature Detection, Feature Matching, Optical Flow und Structure from Motion (SfM).

Feature Matching ist ein Prozess in der Bildverarbeitung, der darauf abzielt, korrespondierende Punkte zwischen verschiedenen Bildern zu erkennen. Dieser Vorgang erfordert kein Vorwissen über die Szene, was ihn besonders flexibel macht. Allerdings ist das Feature Matching rechenintensiv, da es das gesamte Bild nach Merkmalen durchsuchen muss.

Um die Effizienz zu steigern, werden Feature Descriptors eingesetzt. Diese ermöglichen es, den Prozess in zwei Hauptphasen zu unterteilen: die Feature Detection und das Feature Matching. Während der Detektionsphase identifiziert das System Bereiche im Bild, die starke visuelle Merkmale aufweisen, wie beispielsweise Kanten oder Ecken. Diese Merkmale werden dann in der Matching-Phase genutzt, um ähnliche Punkte in anderen Bildern zu finden.

In der Anwendung von Augmented Reality sind die Ergebnisse des Feature Matchings oft nicht präzise genug, um allein für eine exakte Positionsschätzung der Kamera zu dienen. Stattdessen wird dieser Ansatz verwendet, um eine grobe Schätzung der Kameraposition zu erhalten, die dann in späteren Schritten durch weitere Tracking-Verfahren verfeinert wird.

Der Prozess der Detektion kann weiterhin optimiert werden, indem Vorwissen über die Positionen der visuellen Merkmale vorliegt. Insbesondere beim Tracking der Kameraposition von Frame zu Frame in einer Bildsequenz ist davon auszugehen, dass sich visuelle Merkmale in der Nähe ihrer vorherigen Position befinden. In solchen Fällen führt eine lokale Suche nach Merkmalen rund um ihre vorherige Position zu genaueren und effizienteren Ergebnissen als eine globale Suche.

=== Structure from Motion
SfM stellt ein zentrales Verfahren innerhalb der Computer Vision dar. Hierbei werden simultan Kameraposition sowie die Struktur der Szene aus einer Sequenz an Bildern bestimmt. Ein Standardansatz für SfM umfasst drei Hauptmodule. Ein Feature-Matching- oder Tracking-Modul, das Korrespondenzen zwischen den Bildern etabliert, ein Pose-Schätzungsmodul, das die aktuelle Kameraposition basierend auf verfügbaren Informationen zur 3D-Struktur bestimmt, und ein Mapping-Modul, das die 3D-Struktur mithilfe multipler Ansichten der erfassten Merkmale rekonstruiert. Eine wesentliche Herausforderung bei der Anwendung von SfM ist die Drift-Akkumulation, die aus kleinen Fehlern in der Pose-Schätzung resultiert und größere Ungenauigkeiten in der 3D-Strukturschätzung nach sich ziehen kann. Um diese Drift zu minimieren, kommen Techniken wie die visuelle-inertiale Fusion und Optimierung durch Bündeljustierung zum Einsatz.

!Drift Bild einbauen

=== Simultaneous Localization and Mapping
SLAM stellt eine Schlüsseltechnologie im Rahmen von Augmented Reality dar. Es ermöglicht die die Position der Kamera zu erfassen und gleichzeitig eine Karte der Umgebung zu erstellen.