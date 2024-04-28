Das "Reality-Virtuality Continuum", ursprünglich von Paul Milgram und Fumio Kishino konzipiert, bietet einen Rahmen zur Unterscheidung zwischen realen und virtuellen Umgebungen. An einem Ende des Kontinuums liegt die vollständig reale Umgebung, die unverändert und unbeeinflusst von digitalen Einflüssen bleibt. Am gegenüberliegenden Ende des Spektrums befindet sich die vollständig virtuelle Realität. Innerhalb dieses Kontinuums befindet sich die Mixed Reality, die laut Milgram weiter in Augmented Reality und Augmented Virtuality unterteilt wird. Die Zuordnung entlang dieses Kontinuums basiert auf dem Anteil der realen Welt sowie virtuellen Elemente. Augmented Reality zeichnet sich durch einen überwiegenden Anteil realer Elemente aus, während bei Augmented Virtuality die virtuellen Komponenten dominieren @ar-milgram.

In der wissenschaftlichen Literatur finden sich verschiedene Definitionen von Augmented Reality, wobei Ronald Azumas Definition häufig als Referenzpunkt dient. Azuma charakterisiert Augmented Reality durch drei wesentliche Merkmale. Die Kombination von realen und virtuellen Elementen, die Interaktion in Echtzeit sowie den 3D-Bezug zwischen realen und virtuellen Objekten @azuma-survey.

Darüber hinaus erweitert Azuma diese technische Definition, indem er erläutert, dass Augmented Reality es dem Nutzer ermöglicht, seine reale Umgebung weiterhin wahrzunehmen, während gleichzeitig virtuelle Inhalte und Objekte hinzugefügt werden. Diese virtuellen Ergänzungen bereichern die reale Welt, ohne sie vollständig zu ersetzen, wie es bei der virtuellen Realität der Fall wäre. Azumas Ansatz betont somit die subtile Integration von Augmentierungen in die Wahrnehmung der realen Welt, die das Erlebnis des Nutzers erweitert und vertieft @azuma-survey.

Ralf Döner hebt bei seiner Definition von Augmented Reality hervor, dass es sich beim Prozess der Augmentierung um keinen statischen, sondern einen kontinuierlichen und anpassbaren Vorgang handelt. Hierbei lässt sich der Prozess in fünf grundlegende Schritte gliedern. 

Der Prozess beginnt mit einer Aufnahme der Realität. Es folgt das Tracking, das die Position und Orientierung des Benutzers oder spezifischer Objekte im Raum bestimmt. Der dritte Schritt ist die Registrierung, bei der die virtuellen Inhalte mittels der Tracking-Daten mit der Realität abgeglichen werden. Anschließend erfolgt die Darstellung, bei der die virtuellen Inhalte visualisiert werden. Diese müssen perspektivisch korrekt in das reale Bildmaterial integriert werden, um eine nahtlose Überlagerung zu gewährleisten. Der letzte Schritt besteht in der Ausgabe, bei der die augmentierten Bilder dem Benutzer über ein Ausgabegerät präsentiert werden @vr-ar-doener.

Die in Abbildung 1 dargestellten Schritte reflektieren Döners Ansatz und werden durch zusätzliche Punkte von Shaveta Dargan ergänzt. Der Prozess wird um den Schritt der Mensch-Maschinen-Interaktion erweitert. Zusätzlich wird der Nutzer als Teil des Prozesses integriert, wo er über das zuvor definierte System der Mensch-Maschinen-Interaktion mit dem Prozess interagieren kann @ar-review.

#figure(
  image("../media/ar-pipeline.png", width: 100%),
  caption: [Prozess der Augmentierten Realität],
)

=== Interaktion
Im vorliegenden Abschnitt werden verschiedene Interaktionstechniken untersucht, die in Anwendungen der Erweiterten Realität verwendet werden.

Zunächst wird eine Untersuchung der verschiedenen Modalitäten der Ein- und Ausgabe durchgeführt. Hierbei wird auf die Vielfalt der Methoden eingegangen, durch die Benutzer mit AR-Umgebungen interagieren können. Anschließend wird die Integration und das Zusammenspiel verschiedener Interaktionstechniken thematisiert. Dies beinhaltet die Kombination und Abstimmung von Ein- und Ausgabemodalitäten, um eine kohärente und nutzerfreundliche Erfahrung zu schaffen.

Es wird eine Übersicht über verschiedene Arten der Interaktionen gegeben, welche für die Entwicklung von Augmented Reality Anwendungen auf Basis von WebXR relevant sind. Hierbei wird nicht auf eine präzise Beschreibung einzelner Techniken abgezielt, sondern eine breite Darstellung der verfügbaren Technologien und ihrer Anwendungskontexte geboten.

==== Gesten
Gesten sind natürliche Bewegungen, die eng mit der menschlichen Kommunikation verbunden sind. Die Entwicklung gestenbasierter Interaktionssysteme zielt darauf ab, eine Benutzererfahrung zu ermöglichen, die ohne physische Eingabegeräte auskommt und dadurch intuitiv nutzbar ist.

!https://dl.acm.org/doi/fullHtml/10.1145/3594806.3594815

==== Haptisch
Die haptische Interaktion in AR und VR Systemen erweitert die sensorische Erfahrung über auditive und visuelle Kanäle hinaus durch Einbeziehung des Tast- und Bewegungssinns. Haptische Geräte erzeugen mechanische Signale, die sowohl kutane/taktile als auch kinästhetische/propriozeptive Empfindungen ansprechen.

!A Survey on Haptic Technologies for Mobile Augmented Reality

==== Maus und Tastatur

==== Sprache

==== Multimodal
!A Review of Multimodal Interaction Technique in Augmented Reality Environment

=== Ausgabe
Für die Darstellung von Augmented Reality sind spezielle Hardwarekomponenten und Sensoren erforderlich, die die physische Umgebung erfassen und analysieren. Diese Technologien ermöglichen es, digitale Informationen nahtlos in die reale Welt einzubetten. Zu den Hauptkomponenten zählen Sensoren für das Tracking und Geräte für die Eingabe, die die Interaktionen der Nutzer mit der virtuellen Umgebung erfassen.

==== Handheld
Handheld bezeichnet eine breite Gerätegruppe, welche sich in der Anzahl und Qualität von Hardware und Sensoren stark unterscheidet. Dementsprechend kann die verfügbarkeit und qualität von z.B. Tracking-Technologien oder Eingabemethoden variieren. Meistens werden Smartphones oder Tablets unter dieser Kategorie zusammengefasst. Die Darstellung der Augmented Reality Inhalte erfolgt hierbei über das jeweilige Display als Video-See-Through. Mit der ansteigenden Leistungsfähigkeit von Smartphones und Tablets, werden diese Geräte immer häufiger für Augmented Reality Anwendungen verwendet. Vorteil dieser Geräte ist die hohe Verbreitung und Grundlegende Vertrautheit mit dem Gerät.

Allerdings stellt Handheld auch einige Probleme dar. Die Interaktion mit dem Augmented Reality System findet hierbei hauptsächlich über das Display in Form von Touch-Eingaben statt. Hierbei muss jedoch die 2 Dimensionale Eingabe auf die 6DOFs des Systems abgebildet werden.



@handheld-ar-design

Nachteilig ist die eingeschränkte Interaktionsmöglichkeit und die geringe Immersion.

!Brown and Hua, 2006 magic lens
!https://dl.acm.org/doi/pdf/10.1145/3626485.3626555
!https://opendata.uni-halle.de/bitstream/1981185920/88318/1/IlseLukas_Konzeption%20und%20Entwicklung%20einer%20Augmented%20Reality%20Anwendung.pdf

==== Ar-Brillen und Headsets

!https://opendata.uni-halle.de/bitstream/1981185920/88318/1/IlseLukas_Konzeption%20und%20Entwicklung%20einer%20Augmented%20Reality%20Anwendung.pdf

=== Tracking
Tracking umfasst den Einsatz von Technologien und Verfahren zur Bestimmung von Position und Orientierung sowohl physischer als auch virtueller Objekte. Hierbei muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen, um eine erfolgreiche Transformation von virtuellen Objekten durchzuführen.

In diesem Kapitel werden wir die verschiedenen Tracking-Technologien und -Methoden untersuchen, die in modernen AR-Systemen zum Einsatz kommen. Dazu gehören optisches Tracking, sensorbasiertes Tracking und hybride Ansätze, die mehrere Sensordaten kombinieren.

==== Inertial
Inertialtracking ist ein schnelles und robustes Verfahren, das die Bewegung eines Geräts messen kann. Dieses Verfahren kommt ohne externe Referenzen aus, was einen klaren Vorteil gegenüber visuellen Sensoren darstellt, deren Effizienz stark von externen Faktoren beeinflusst wird @interial-tracking-system. Das System setzt sich typischwereise aus einer Komibination von Beschleunigungsmessern und Gyroskopen die in einer Inertialmess-Einheit (IMU) integriert sind @interial-tracking-system.

Der Beschleunigungsmesser erfasst die lineare Beschleunigung des Geräts, wodurch die Orientierung und deren Veränderung in Bezug zur Erde bestimmt werden können. Das Gyroskop misst die Rotations- oder Winkelgeschwindigkeit des Geräts und ermöglicht so die Bestimmung der Drehbewegung.

==== Feature Matching
Feature Matching ist ein Verfahren in der Bildverarbeitung, das darauf ausgerichtet ist, korrespondierende Punkte zwischen verschiedenen Aufnahmen zu identifizieren. Dieser Prozess führt eine vollständige Durchsuchung des Bildes durch, um visuelle Merkmale zu erkennen. Dadurch ist kein vorheriges Wissen über die Szene notwendig, allerdings ist das Verfahren rechenintensiv.

Um die Effizienz zu steigern, werden Feature Descriptors eingesetzt. Der Prozess wird in zwei Hauptphasen unterteil: die Feature Detection und das Feature Matching. Während der Detektionsphase identifiziert das System Bereiche im Bild, die starke visuelle Merkmale aufweisen, wie beispielsweise Kanten oder Ecken. Diese Merkmale werden dann in der Matching-Phase genutzt, um ähnliche Punkte in anderen Bildern zu finden.

In der Anwendung von Augmented Reality sind die Ergebnisse des Feature Matchings oft nicht präzise genug, um allein für eine exakte Positionsschätzung der Kamera zu dienen. Stattdessen wird dieser Ansatz verwendet, um eine grobe Schätzung der Kameraposition zu erhalten, die dann in späteren Schritten durch weitere Tracking-Verfahren verfeinert wird.

==== Feature Tracking
Der Prozess der Detektion kann weiterhin optimiert werden, indem Vorwissen über die Positionen der visuellen Merkmale vorliegt. Insbesondere beim Tracking der Kameraposition von Frame zu Frame in einer Bildsequenz ist davon auszugehen, dass sich visuelle Merkmale in der Nähe ihrer vorherigen Position befinden. In solchen Fällen führt eine lokale Suche nach Merkmalen rund um ihre vorherige Position zu genaueren und effizienteren Ergebnissen als eine globale Suche @handbook-ar.

==== Structure from Motion
Structure from Motion (SfM) beschreibt einen Prozess, welcher die dreidimensionale Rekonstruktion einer Szene aus einer Serie von zweidimensionalen Bildern ermöglicht. Diese Bilder werden aus verschiedenen Blickwinkeln aufgenommen, wodurch die Extraktion von Tiefeninformationen und folglich die räumliche Struktur der Szene möglich wird @sfm-revisited. Die Technologie wird in vielen Anwendungen wie der Robotik, der Computer Vision und der Augmented Reality eingesetzt.

Der Prozess lässt sich hierbei in verschiedene Schritte unterteilen. Anfangs werden Korrespondenzen zwischen den Bildern durch Methoden wie Feature Matching oder andere Tracking-Techniken ermittelt. Nach der Identifikation von Korrespondenzen folgt die Bestimmung der Positionen und Orientierungen der Kamera. Die Relationen zwischen den Kamerapositionen und den Korrespondenzen bilden die Grundlage für die Rekonstruktion der 3D-Struktur der Szene @handbook-ar.

Eine wesentliche Herausforderung bei der Anwendung von SfM ist die Drift-Akkumulation, die aus kleinen Fehlern in der Pose-Schätzung resultiert und größere Ungenauigkeiten in der 3D-Strukturschätzung nach sich ziehen kann. Um diese Drift zu minimieren, kommen Techniken wie die visuelle-inertiale Fusion und Optimierung durch Bündeljustierung zum Einsatz.

==== Simultaneous Localization and Mapping
SLAM ist eine zentrale Technologie im Bereich der Augmented Reality und ermöglicht es, die Position und Orientierung eines Geräts in Echtzeit zu bestimmen, während parallel eine Karte der Umgebung erstellt wird. Die Architektur solcher SLAM-Systeme besteht typischerweise aus mehreren Modulen, wobei drei Grundmodule in jedem System vorhanden sind.

Das Initialisierungsmodul nutzt Kameradaten, um eine erste Karte der Umgebung zu generieren. Hierbei wird häufig die Structure-from-Motion-Technik eingesetzt, die es ermöglicht, die Positionen visueller Merkmale in der Umgebung zu erfassen. Das Tracking-Modul übernimmt die Aufgabe, die aktuelle Position und Orientierung des Geräts zu schätzen. Es verfolgt die Bewegungen des Geräts durch die Umgebung und bestimmt die relative Position zu dieser. Das Mapping-Modul ist für die Erstellung und fortlaufende Aktualisierung der Umgebungskarte zuständig. Es speichert die Positionen der visuellen Merkmale und passt die Karte entsprechend an. Dieses Modul arbeitet langsamer als das Tracking-Modul, da es eine umfangreichere Datenverarbeitung erfordert.

Darüber hinaus können zusätzliche Module integriert werden, die die Zuverlässigkeit und Robustheit des Systems verbessern. Ein Beispiel hierfür ist das Relokalisierungsmodul, das bei einem Verlust der Kameraposition hilft, die damit verbundenen Tracking- und Positionsabweichungen zu korrigieren. Diese Erweiterungen tragen wesentlich zur Leistungsfähigkeit und Flexibilität von SLAM-Systemen bei.