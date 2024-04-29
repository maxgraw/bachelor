Das "Reality-Virtuality Continuum", ursprünglich von Paul Milgram und Fumio Kishino konzipiert, bietet einen Rahmen zur Unterscheidung zwischen realen und virtuellen Umgebungen. An einem Ende des Kontinuums liegt die vollständig reale Umgebung, die unverändert und unbeeinflusst von digitalen Einflüssen bleibt. Am gegenüberliegenden Ende des Spektrums befindet sich die vollständig virtuelle Realität. Innerhalb dieses Kontinuums befindet sich die Mixed Reality, die laut Milgram weiter in Augmented Reality und Augmented Virtuality unterteilt wird. Die Zuordnung entlang dieses Kontinuums basiert auf dem Anteil der realen Welt sowie virtuellen Elemente. Augmented Reality zeichnet sich durch einen überwiegenden Anteil realer Elemente aus, während bei Augmented Virtuality die virtuellen Komponenten dominieren @ar-milgram.

In der wissenschaftlichen Literatur finden sich verschiedene Definitionen von Augmented Reality, wobei Ronald Azumas Definition häufig als Referenzpunkt dient. Azuma charakterisiert Augmented Reality durch drei wesentliche Merkmale. Die Kombination von realen und virtuellen Elementen, die Interaktion in Echtzeit sowie den 3D-Bezug zwischen realen und virtuellen Objekten @azuma-survey.

Darüber hinaus erweitert Azuma diese technische Definition, indem er erläutert, dass Augmented Reality es dem Nutzer ermöglicht, seine reale Umgebung weiterhin wahrzunehmen, während gleichzeitig virtuelle Inhalte und Objekte hinzugefügt werden. Diese virtuellen Ergänzungen bereichern die reale Welt, ohne sie vollständig zu ersetzen, wie es bei der virtuellen Realität der Fall wäre. Azumas Ansatz betont somit die subtile Integration von Augmentierungen in die Wahrnehmung der realen Welt, die das Erlebnis des Nutzers erweitert und vertieft @azuma-survey.

=== Interaktion
Im Bereich der Augmented Reality gibt es eine Vielzahl von Methoden der Interaktion, desweiteren können viele dieser Methoden miteinander kombiniert werden. Im Kontext dieser Arbeit wird der Fokus auf Methoden gelegt, welche für die Entwicklung von Applikation auf Basis von WebXR relevant und nutzbar sind.

==== Hand-Gesten
Gesten sind natürliche Bewegungen, die eng mit der menschlichen Kommunikation verbunden sind. Die Entwicklung gestenbasierter Interaktionssysteme zielt darauf ab, eine Benutzererfahrung zu ermöglichen, die ohne physische Eingabegeräte auskommt und dadurch intuitiv nutzbar sein soll @handbook-ar @gesture-ar. Im Zuge dieser Arbeit wird zwischen Touch-Gesten und Hand-Gesten unterschieden. Im folgenden werden zunächst Hand-Gesten betrachtet.

Die Erkennung von Gesten kann hierbei durch verschiedene Technologien oder die Kombination von Technologien erfolgen. Song et al. @in-air-gesture beschrieben in ihrer Arbeit die Verwendung von Kamerasystemen in Kombination mit Machine-Learning-Algorithmen zur Erkennung von Handgesten. Weitere Lösungen basieren auf der Verwendung von Tiefenkameras @depth-gesture oder der Verwendung von Handschuhen, die mit Sensoren ausgestattet sind @glove-gesture.

Die Nutzung dieser Interaktionsmethode findet hierbei in einem breiten Spektrum von Anwendungen und Branchen statt. So wird die Gestensteuerung beispielsweise in der Medizin, der Industrie oder im Bereich der Unterhaltungselektronik eingesetzt @gesture-ar.

Trotz der vielfältigen Anwendungsmöglichkeiten und der intuitiven Bedienung lassen sich gestenbasierte Interaktionen nicht in allen Anwendungsfällen sinnvoll einsetzen @gesture-ar. Einfache Interaktionen lassen sich hierbei leicht merken, allerdings kann die Komplexität der Interaktionen schnell ansteigen, was zu immer komplexeren Gesten führen kann. In Kombination mit einer geringen Fehlertoleranz @user-defined-gesture kann dies die Interaktionsqualität negativ beeinflussen @gesture-ar.

==== Touch-Gesten
Touch-Gesten stellen eine natürliche und intuitiv nutzbare Interaktionsmethode dar. Sie basieren hierbei den gleichen Prinzipien wie die zuvor genannte Interaktion mittels Handgesten @handbook-ar.

Die Interaktion erfolgt über das Display eines Geräts, wodurch Nutzer durch Berührung oder Bewegung des Fingers auf dem Bildschirm mit der Anwendung interagieren können. Touch-Gesten sind weit verbreitet und finden in vielen Anwendungen Verwendung, wie beispielsweise in Smartphones, Tablets oder interaktiven Tischen @handheld-ar-design.

Touch-Gesten bieten zahlreiche Anwendungsmöglichkeiten und sind aufgrund ihrer hohen Verfügbarkeit und Vertrautheit eine beliebte Interaktionsmethode. Jedoch stellt die Interaktion mit Augmented-Reality-Szenen eine Herausforderung dar, da die 2D-Eingabe auf ein 6DOF-System übertragen werden muss @handheld-ar-design.

==== Multimodal
Die Interaktion über einen einzelnen Eingabekanal wird als unimodales System bezeichnet. Die Art des Eingabekanals kann hierbei variieren, beispielsweise durch die Verwendung von Handgesten, Sprachsteuerung oder Touch-Gesten @overview-multimodal. Multimodale Interaktionssysteme ermöglichen es, mehrere dieser Eingabekanäle zu kombinieren, um eine effizientere und vielseitigere Interaktion zu ermöglichen @handbook-ar.

Nizam et al. stellen eine Übersicht über multimodale Interaktionen bereit. Es werden verschiedene Kombinationen von Eingabekanälen vorgestellt, die in ihrer Anzahl variieren. Beispielsweise wird die Kombination von Handgesten und Sprachsteuerung sowie die Kombination von Touch-Gesten und Sprachsteuerung beschrieben @overview-multimodal. Die Interaktion über verschiedene Eingabekanäle kann hierbei zeitgleich oder sequenziell erfolgen. In einer weiteren Studie wird die Kombination von Touch-Gesten und Handgesten beschrieben. Hierbei wird zunächst über eine Touch-Geste eine Auswahl getroffen, die anschließend durch eine Handgeste in der Augmented Reality Szene manipuliert wird @touch-and-gesture-interaction.

Multimodale Interaktionen bieten eine effizientere Möglichkeit der Interaktion mit Augmented Reality-Anwendungen, setzen jedoch gleichzeitig eine höhere Lernkurve für den Nutzer voraus. Des Weiteren kann die Kombination von Eingabekanälen zu einer höheren Komplexität der Interaktion führen @overview-multimodal.

=== Ausgabe
Für die Darstellung von Augmented Reality sind spezielle Hardwarekomponenten und Sensoren erforderlich, die die physische Umgebung erfassen und analysieren. Diese Technologien ermöglichen es, digitale Informationen nahtlos in die reale Welt einzubetten. Zu den Hauptkomponenten zählen Sensoren für das Tracking und Geräte für die Eingabe, die die Interaktionen der Nutzer mit der virtuellen Umgebung erfassen.

==== Handheld
Handheld-Geräte bezeichnet eine breite Gerätegruppe, die sich in der Anzahl und Qualität ihrer Hardware und Sensoren erheblich unterscheiden können. Diese Variation beeinflusst die Verfügbarkeit und Qualität von Funktionen wie Tracking-Technologien oder Eingabemethoden. In der Regel werden unter diese Kategorie Smartphones und Tablets gefasst, deren Augmented Reality-Inhalte über das jeweilige Display in einer Video-See-Through-Ansicht dargestellt werden @vr-ar-doener.

Mit zunehmender Leistungsstärke von Smartphones und Tablets werden diese immer häufiger für Augmented Reality-Anwendungen eingesetzt. Ein entscheidender Vorteil dieser Geräte ist ihre weite Verbreitung und die grundsätzliche Vertrautheit der Nutzer mit der Technologie @handheld-ar-design.

Jedoch bringt die Nutzung von Handheld-Geräten auch spezifische Herausforderungen mit sich. Die Interaktion mit Augmented Reality-Systemen erfolgt hauptsächlich über Touch-Eingaben auf dem Display. Wie bereits zuvor beschrieben erfordert diese Form der Interaktion eine Übertragung einer 2D-Eingabe auf ein 6DOF-System @handheld-ar-design. Weiterhin basiert die Augmentierung auf der Position und Rotation der Kamera, die am Handheld-Gerät angebracht ist, was den Magic-Lens-Effekt einschränken kann. Dieser Effekt beschreibt einen Idealfall, in dem die Perspektiven des aufgenommenen und des augmentierten Bildes übereinstimmen @vr-ar-doener. Ein zusätzliches Problem stellt die Begrenzung des Sichtfeldes dar. Potenzielle Interaktionsmöglichkeiten sowie wichtige Informationen können sich außerhalb des Sichtfeldes des Gerätes befinden, was zur Folge hat, dass Interaktionen oder Informationen möglicherweise nicht genutzt oder wahrgenommen werden können @handheld-ar-design.

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