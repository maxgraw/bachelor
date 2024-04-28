Tracking umfasst den Einsatz von Technologien und Verfahren zur Bestimmung von Position und Orientierung sowohl physischer als auch virtueller Objekte. Hierbei muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen, um eine erfolgreiche Transformation von virtuellen Objekten durchzuführen.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren.

=== Inertial
Inertialtracking ist ein schnelles und robustes Verfahren, das die Bewegung eines Geräts messen kann. Dieses Verfahren kommt ohne externe Referenzen aus, was einen klaren Vorteil gegenüber visuellen Sensoren darstellt, deren Effizienz stark von externen Faktoren beeinflusst wird. Das System setzt sich typischwereise aus einer Komibination von Beschleunigungsmessern, Gyroskopen und optional einem Magnetometern zusammen, die in einer Inertialmess-Einheit (IMU) integriert sind.

Der Beschleunigungsmesser erfasst die lineare Beschleunigung des Geräts, wodurch die Orientierung und deren Veränderung in Bezug zur Erde bestimmt werden können.

$ p_"n+1" = p_n + v_n dot Delta Tau + 0.5 dot a_"n-1" dot Delta Tau^2 $

- $p_"n+1"$: Die Position des Objekts zum Zeitpunkt $ n plus 1$. Es ist die neue berechnete Position, die basierend auf der vorherigen Position und den aktuellen Bewegungsinformationen aktualisiert wird.

- $p_n$: Die Position des Objekts zum Zeitpunkt $n$, also die vorherige Position.

- $v_n$: Die Geschwindigkeit des Objekts zum Zeitpunkt $n$. Diese Geschwindigkeit wird genutzt, um die Veränderung der Position über das Zeitintervall $Delta Tau$ zu berechnen.

- $Delta Tau$: Das Zeitintervall zwischen den Berechnungen. Dies ist die Dauer zwischen zwei aufeinanderfolgenden Positionsberechnungen.

- $0.5$: Dieser Faktor kommt von der Integration der Beschleunigung zur Berechnung der zurückgelegten Strecke, basierend auf der Formel für die gleichmäßig beschleunigte Bewegung.

- $a-1$: Die Beschleunigung des Objekts zum Zeitpunkt $n minus 1$. Diese Beschleunigung wird verwendet, um den zusätzlichen Abstand zu berechnen, der aufgrund der Beschleunigung über das Zeitintervall zurückgelegt wird.

- $ Delta Tau^2$: Dieser Term erscheint in der Gleichung als Teil der Beschleunigungskomponente. Er wird in der Formel für die Berechnung des zurückgelegten Weges aufgrund der Beschleunigung verwendet. Mathematisch wird Δτ2Δτ2 genutzt, um die Fläche unter der Beschleunigungs-Zeit-Kurve zu berechnen, was der durch Beschleunigung verursachten Verschiebung entspricht.

$ a_n = q_n ⊗ a_n^m ⊗ q_n^* minus g $

- $a_n$: Die korrigierte Beschleunigung des Objekts im inertialen (Referenz-) Koordinatensystem zum Zeitpunkt nn.

- $q_n$: Der Quaternion, der die Orientierung des Objekts zum Zeitpunkt $n$ repräsentiert.

- $a^m_n$: Die im bewegten Rahmen gemessene Beschleunigung, also die Beschleunigung, die direkt von den Beschleunigungssensoren gemessen wird.

- $q^*_n$: Der konjugierte Quaternion zu $q_n$, der für die Rücktransformation der Beschleunigung in das Referenzsystem verwendet wird.

- $⊗$: Die Quaternion-Multiplikation, die zur Rotation von Vektoren im Raum verwendet wird.

- $g$: Die Gravitationsbeschleunigung, die von der gemessenen Beschleunigung abgezogen wird, um die tatsächliche Beschleunigung zu erhalten, die nicht durch die Schwerkraft beeinflusst wird.

Das Gyroskop misst die Rotations- oder Winkelgeschwindigkeit des Geräts und ermöglicht so die Bestimmung der Drehbewegung.

$ q_"n+1" = q_n ⊗ (1 + 1/2 Omega_n Delta Tau) $

- $q_"n+1"$: Dies ist der neue Quaternion, der die aktualisierte Orientierung des Objekts zum Zeitpunkt n+1n+1 repräsentiert.

- $q_n$: Der Quaternion, der die Orientierung des Objekts zum Zeitpunkt $n$ repräsentiert.

- $⊗$: Die Quaternion-Multiplikation, die zur Rotation von Vektoren im Raum verwendet wird.

- $Omega_n$: Dies ist der Quaternion der Winkelgeschwindigkeit zum Zeitpunkt nn. Er beschreibt, wie schnell und in welcher Achse sich das Objekt dreht.

- $Delta Tau$: Das Zeitintervall zwischen den Updates nn und n+1n+1, also die Zeitdauer, über die die Drehung stattfindet.

- $(1 + 1/2 Omega_n Delta Tau)$: Diese Konstruktion repräsentiert eine Approximation des exponentiellen Terms, der normalerweise in der Lösung der Differentialgleichung für die Rotation in der Quaternion-Darstellung verwendet wird. Es ist eine lineare Näherung des exponentiellen Mappings von Winkelgeschwindigkeiten zu Quaternionen, die oft in der Praxis verwendet wird, weil sie rechnerisch einfacher ist.

Der Magnetometer misst das Magnetfeld des Geräts und ermöglicht die Bestimmung der Ausrichtung des Geräts relativ zum magnetischen Nordpol @interial-tracking-system.

=== Feature Matching
Feature Matching ist ein Prozess in der Bildverarbeitung, der darauf abzielt, korrespondierende Punkte zwischen verschiedenen Bildern zu erkennen. Dieser Vorgang erfordert kein Vorwissen über die Szene, was ihn besonders flexibel macht. Allerdings ist das Feature Matching rechenintensiv, da es das gesamte Bild nach Merkmalen durchsuchen muss @handbook-ar. 

https://docs.opencv.org/4.x/dc/dc3/tutorial_py_matcher.html

Um die Effizienz zu steigern, werden Feature Descriptors eingesetzt. Der Prozess wird in zwei Hauptphasen unterteil: die Feature Detection und das Feature Matching. Während der Detektionsphase identifiziert das System Bereiche im Bild, die starke visuelle Merkmale aufweisen, wie beispielsweise Kanten oder Ecken. Diese Merkmale werden dann in der Matching-Phase genutzt, um ähnliche Punkte in anderen Bildern zu finden @handbook-ar. 

In der Anwendung von Augmented Reality sind die Ergebnisse des Feature Matchings oft nicht präzise genug, um allein für eine exakte Positionsschätzung der Kamera zu dienen. Stattdessen wird dieser Ansatz verwendet, um eine grobe Schätzung der Kameraposition zu erhalten, die dann in späteren Schritten durch weitere Tracking-Verfahren verfeinert wird @handbook-ar. 

=== Feature Tracking
Der Prozess der Detektion kann weiterhin optimiert werden, indem Vorwissen über die Positionen der visuellen Merkmale vorliegt. Insbesondere beim Tracking der Kameraposition von Frame zu Frame in einer Bildsequenz ist davon auszugehen, dass sich visuelle Merkmale in der Nähe ihrer vorherigen Position befinden. In solchen Fällen führt eine lokale Suche nach Merkmalen rund um ihre vorherige Position zu genaueren und effizienteren Ergebnissen als eine globale Suche. @handbook-ar

=== Structure from Motion
SfM stellt ein zentrales Verfahren innerhalb der Computer Vision dar. Hierbei werden simultan Kameraposition sowie die Struktur der Szene aus einer Sequenz an Bildern bestimmt. Ein Standardansatz für SfM umfasst drei Hauptmodule. Ein Feature-Matching- oder Tracking-Modul, das Korrespondenzen zwischen den Bildern etabliert, ein Pose-Schätzungsmodul, das die aktuelle Kameraposition basierend auf verfügbaren Informationen zur 3D-Struktur bestimmt, und ein Mapping-Modul, das die 3D-Struktur mithilfe multipler Ansichten der erfassten Merkmale rekonstruiert. Eine wesentliche Herausforderung bei der Anwendung von SfM ist die Drift-Akkumulation, die aus kleinen Fehlern in der Pose-Schätzung resultiert und größere Ungenauigkeiten in der 3D-Strukturschätzung nach sich ziehen kann. Um diese Drift zu minimieren, kommen Techniken wie die visuelle-inertiale Fusion und Optimierung durch Bündeljustierung zum Einsatz.

!AUSBAUEN

!Drift Bild einbauen

=== Simultaneous Localization and Mapping
SLAM stellt eine Schlüsseltechnologie im Rahmen von Augmented Reality dar. Es ermöglicht die die Position der Kamera zu erfassen und gleichzeitig eine Karte der Umgebung zu erstellen.

!AUSBAUEN