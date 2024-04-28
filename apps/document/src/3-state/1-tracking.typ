Tracking umfasst den Einsatz von Technologien und Verfahren zur Bestimmung von Position und Orientierung sowohl physischer als auch virtueller Objekte. Hierbei muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen, um eine erfolgreiche Transformation von virtuellen Objekten durchzuführen.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren.

=== Inertial
Inertialtracking ist ein schnelles und robustes Verfahren, das die Bewegung eines Geräts messen kann. Dieses Verfahren kommt ohne externe Referenzen aus, was einen klaren Vorteil gegenüber visuellen Sensoren darstellt, deren Effizienz stark von externen Faktoren beeinflusst wird @interial-tracking-system. Das System setzt sich typischwereise aus einer Komibination von Beschleunigungsmessern und Gyroskopen die in einer Inertialmess-Einheit (IMU) integriert sind @interial-tracking-system.

Der Beschleunigungsmesser erfasst die lineare Beschleunigung des Geräts, wodurch die Orientierung und deren Veränderung in Bezug zur Erde bestimmt werden können. Das Gyroskop misst die Rotations- oder Winkelgeschwindigkeit des Geräts und ermöglicht so die Bestimmung der Drehbewegung.

=== Feature Matching
Feature Matching ist ein Verfahren in der Bildverarbeitung, das darauf ausgerichtet ist, korrespondierende Punkte zwischen verschiedenen Aufnahmen zu identifizieren. Dieser Prozess führt eine vollständige Durchsuchung des Bildes durch, um visuelle Merkmale zu erkennen. Dadurch ist kein vorheriges Wissen über die Szene notwendig, allerdings ist das Verfahren rechenintensiv.

Um die Effizienz zu steigern, werden Feature Descriptors eingesetzt. Der Prozess wird in zwei Hauptphasen unterteil: die Feature Detection und das Feature Matching. Während der Detektionsphase identifiziert das System Bereiche im Bild, die starke visuelle Merkmale aufweisen, wie beispielsweise Kanten oder Ecken. Diese Merkmale werden dann in der Matching-Phase genutzt, um ähnliche Punkte in anderen Bildern zu finden.

In der Anwendung von Augmented Reality sind die Ergebnisse des Feature Matchings oft nicht präzise genug, um allein für eine exakte Positionsschätzung der Kamera zu dienen. Stattdessen wird dieser Ansatz verwendet, um eine grobe Schätzung der Kameraposition zu erhalten, die dann in späteren Schritten durch weitere Tracking-Verfahren verfeinert wird.

=== Feature Tracking
Der Prozess der Detektion kann weiterhin optimiert werden, indem Vorwissen über die Positionen der visuellen Merkmale vorliegt. Insbesondere beim Tracking der Kameraposition von Frame zu Frame in einer Bildsequenz ist davon auszugehen, dass sich visuelle Merkmale in der Nähe ihrer vorherigen Position befinden. In solchen Fällen führt eine lokale Suche nach Merkmalen rund um ihre vorherige Position zu genaueren und effizienteren Ergebnissen als eine globale Suche @handbook-ar.

=== Structure from Motion
Structure from Motion (SfM) beschreibt einen Prozess, welcher die dreidimensionale Rekonstruktion einer Szene aus einer Serie von zweidimensionalen Bildern ermöglicht. Diese Bilder werden aus verschiedenen Blickwinkeln aufgenommen, wodurch die Extraktion von Tiefeninformationen und folglich die räumliche Struktur der Szene möglich wird @sfm-revisited. Die Technologie wird in vielen Anwendungen wie der Robotik, der Computer Vision und der Augmented Reality eingesetzt.

Der Prozess lässt sich hierbei in verschiedene Schritte unterteilen. Anfangs werden Korrespondenzen zwischen den Bildern durch Methoden wie Feature Matching oder andere Tracking-Techniken ermittelt. Nach der Identifikation von Korrespondenzen folgt die Bestimmung der Positionen und Orientierungen der Kamera. Die Relationen zwischen den Kamerapositionen und den Korrespondenzen bilden die Grundlage für die Rekonstruktion der 3D-Struktur der Szene @handbook-ar.

Eine wesentliche Herausforderung bei der Anwendung von SfM ist die Drift-Akkumulation, die aus kleinen Fehlern in der Pose-Schätzung resultiert und größere Ungenauigkeiten in der 3D-Strukturschätzung nach sich ziehen kann. Um diese Drift zu minimieren, kommen Techniken wie die visuelle-inertiale Fusion und Optimierung durch Bündeljustierung zum Einsatz.

=== Simultaneous Localization and Mapping
SLAM ist eine zentrale Technologie im Bereich der Augmented Reality und ermöglicht es, die Position und Orientierung eines Geräts in Echtzeit zu bestimmen, während parallel eine Karte der Umgebung erstellt wird. Die Architektur solcher SLAM-Systeme besteht typischerweise aus mehreren Modulen, wobei drei Grundmodule in jedem System vorhanden sind.

Das Initialisierungsmodul nutzt Kameradaten, um eine erste Karte der Umgebung zu generieren. Hierbei wird häufig die Structure-from-Motion-Technik eingesetzt, die es ermöglicht, die Positionen visueller Merkmale in der Umgebung zu erfassen. Das Tracking-Modul übernimmt die Aufgabe, die aktuelle Position und Orientierung des Geräts zu schätzen. Es verfolgt die Bewegungen des Geräts durch die Umgebung und bestimmt die relative Position zu dieser. Das Mapping-Modul ist für die Erstellung und fortlaufende Aktualisierung der Umgebungskarte zuständig. Es speichert die Positionen der visuellen Merkmale und passt die Karte entsprechend an. Dieses Modul arbeitet langsamer als das Tracking-Modul, da es eine umfangreichere Datenverarbeitung erfordert.

Darüber hinaus können zusätzliche Module integriert werden, die die Zuverlässigkeit und Robustheit des Systems verbessern. Ein Beispiel hierfür ist das Relokalisierungsmodul, das bei einem Verlust der Kameraposition hilft, die damit verbundenen Tracking- und Positionsabweichungen zu korrigieren. Diese Erweiterungen tragen wesentlich zur Leistungsfähigkeit und Flexibilität von SLAM-Systemen bei.