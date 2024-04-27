Tracking umfasst den Einsatz von Technologien und Verfahren zur Bestimmung von Position und Orientierung sowohl physischer als auch virtueller Objekte. Hierbei muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen, um eine erfolgreiche Transformation von virtuellen Objekten durchzuführen.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren.

=== Grundlagen
Um die grundlegende Transformation durchzuführen müssen zunächst alle relevanten Koordinatensystem definiert werden. Das globale Koordinatensystem, welches die Position und Ausrichtung seiner Elemente in der Realität darstellt, und das Koordinatensystem des Augmented-Reality-Geräts, welches die Position und Ausrichtung innerhalb der virtuellen Realität repräsentiert. Das Augmented-Reality-Gerät besitzt sowohl im eigenen als auch im globalen System eine definierte Position und Ausrichtung. 

Die Position des Augmented-Reality-Geräts im globalen Koordinatensystem wird durch eine Rotationsmatrix $R_"ba"$ und einen Translationsvektor $b_a$ bestimmt. Die gewünschte Position eines virtuellen Objekts ist relativ zum Gerät definiert. Zur Berechnung der tatsächlichen Position im globalen System wird die relative Objektposition $m_a$ mit der Rotationsmatrix multipliziert und der Translationsvektor hinzugefügt.

$ m_b = R_"ba" m_a + a_b $

Um $a_b$ zu bestimmen, verwendet man die negative Transformation des Vektors $b_a$ durch die Rotationsmatrix $R_"ba"$. Dieser Schritt ist notwendig, um die ursprüngliche Verschiebung des AR-Geräteursprungs im globalen Koordinatensystem rückgängig zu machen.

$ a_b = -R_"ba"b_a $

Diese Korrektur des Translationsvektors stellt sicher, dass das virtuelle Objekt korrekt relativ zum globalen Ursprung positioniert wird und nicht zum verschobenen Ursprung des AR-Geräts.

=== Inertial
Inertialtracking ist ein schnelles und robustes Verfahren, das die Bewegung eines Geräts messen kann. Dieses Verfahren kommt ohne externe Referenzen aus, was einen klaren Vorteil gegenüber visuellen Sensoren darstellt, deren Effizienz stark von externen Faktoren beeinflusst wird. Das System setzt sich typischwereise aus einer Komibination von Beschleunigungsmessern, Gyroskopen und Magnetometern zusammen, die in einer Inertialmess-Einheit (IMU) integriert sind. Der Beschleunigungsmesser erfasst die lineare Beschleunigung des Geräts, wodurch die Orientierung und deren Veränderung in Bezug zur Erde bestimmt werden können. Das Gyroskop misst die Rotations- oder Winkelgeschwindigkeit des Geräts und ermöglicht so die Bestimmung der Drehbewegung. Der Magnetometer misst das Magnetfeld des Geräts und ermöglicht die Bestimmung der Ausrichtung des Geräts relativ zum magnetischen Nordpol.

!https://www.researchgate.net/publication/3950848_Inertial_tracking_for_mobile_augmented_reality

=== Computer Vision
Computer Vision ist ein zentraler Bestandteil von AR-Tracking-Systemen. Es umfasst Techniken zur Erkennung, Verfolgung und Analyse von Bildern und Videos. Computer Vision-Algorithmen werden verwendet, um visuelle Merkmale in Echtzeit zu erkennen und zu verfolgen, um die Position und Orientierung von Objekten zu bestimmen. Dazu gehören Techniken wie Feature Detection, Feature Matching, Optical Flow und Structure from Motion (SfM).

Feature Matching ist ein Prozess in der Bildverarbeitung, der darauf abzielt, korrespondierende Punkte zwischen verschiedenen Bildern zu erkennen. Dieser Vorgang erfordert kein Vorwissen über die Szene, was ihn besonders flexibel macht. Allerdings ist das Feature Matching rechenintensiv, da es das gesamte Bild nach Merkmalen durchsuchen muss.

Um die Effizienz zu steigern, werden Feature Descriptors eingesetzt. Diese ermöglichen es, den Prozess in zwei Hauptphasen zu unterteilen: die Feature Detection und das Feature Matching. Während der Detektionsphase identifiziert das System Bereiche im Bild, die starke visuelle Merkmale aufweisen, wie beispielsweise Kanten oder Ecken. Diese Merkmale werden dann in der Matching-Phase genutzt, um ähnliche Punkte in anderen Bildern zu finden.

In der Anwendung von Augmented Reality sind die Ergebnisse des Feature Matchings oft nicht präzise genug, um allein für eine exakte Positionsschätzung der Kamera zu dienen. Stattdessen wird dieser Ansatz verwendet, um eine grobe Schätzung der Kameraposition zu erhalten, die dann in späteren Schritten durch weitere Tracking-Verfahren verfeinert wird.

Der Prozess der Detektion kann weiterhin optimiert werden, indem Vorwissen über die Positionen der visuellen Merkmale vorliegt. Insbesondere beim Tracking der Kameraposition von Frame zu Frame in einer Bildsequenz ist davon auszugehen, dass sich visuelle Merkmale in der Nähe ihrer vorherigen Position befinden. In solchen Fällen führt eine lokale Suche nach Merkmalen rund um ihre vorherige Position zu genaueren und effizienteren Ergebnissen als eine globale Suche.

=== Structure from Motion
SfM stellt ein zentrales Verfahren innerhalb der Computer Vision dar. Hierbei werden simultan Kameraposition sowie die Struktur der Szene aus einer Sequenz an Bildern bestimmt. Ein Standardansatz für SfM umfasst drei Hauptmodule. Ein Feature-Matching- oder Tracking-Modul, das Korrespondenzen zwischen den Bildern etabliert, ein Pose-Schätzungsmodul, das die aktuelle Kameraposition basierend auf verfügbaren Informationen zur 3D-Struktur bestimmt, und ein Mapping-Modul, das die 3D-Struktur mithilfe multipler Ansichten der erfassten Merkmale rekonstruiert. Eine wesentliche Herausforderung bei der Anwendung von SfM ist die Drift-Akkumulation, die aus kleinen Fehlern in der Pose-Schätzung resultiert und größere Ungenauigkeiten in der 3D-Strukturschätzung nach sich ziehen kann. Um diese Drift zu minimieren, kommen Techniken wie die visuelle-inertiale Fusion und Optimierung durch Bündeljustierung zum Einsatz.

!AUSBAUEN

!Drift Bild einbauen

=== Simultaneous Localization and Mapping
SLAM stellt eine Schlüsseltechnologie im Rahmen von Augmented Reality dar. Es ermöglicht die die Position der Kamera zu erfassen und gleichzeitig eine Karte der Umgebung zu erstellen.

!AUSBAUEN