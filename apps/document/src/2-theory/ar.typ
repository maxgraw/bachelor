Das "Reality-Virtuality Continuum", ursprünglich von Paul Milgram und Fumio Kishino konzipiert, bietet einen Rahmen zur Unterscheidung zwischen realen und virtuellen Umgebungen. An einem Ende des Kontinuums liegt die vollständig reale Umgebung, die unverändert und unbeeinflusst von digitalen Einflüssen bleibt. Am gegenüberliegenden Ende des Spektrums befindet sich die vollständig virtuelle Realität. Innerhalb dieses Kontinuums befindet sich die Mixed Reality, die laut Milgram weiter in Augmented Reality und Augmented Virtuality unterteilt wird. Die Zuordnung entlang dieses Kontinuums basiert auf dem Anteil der realen Welt sowie virtuellen Elementen. Augmented Reality zeichnet sich durch einen überwiegenden Anteil realer Elemente aus, während bei Augmented Virtuality die virtuellen Komponenten dominieren @ar-milgram.

In der wissenschaftlichen Literatur finden sich verschiedene Definitionen von Augmented Reality, wobei Ronald Azumas Definition häufig als Referenzpunkt dient. Azuma charakterisiert Augmented Reality durch drei wesentliche Merkmale. Die Kombination von realen und virtuellen Elementen, die Interaktion in Echtzeit sowie den 3D-Bezug zwischen realen und virtuellen Objekten @azuma-survey.

=== Interaktion
Im Bereich der Augmented Reality gibt es eine Vielzahl von Interaktionsmethoden, von denen viele miteinander kombiniert werden können. Im Kontext dieser Arbeit liegt der Fokus auf Methoden, die für die Entwicklung von Anwendungen auf Basis von WebXR relevant und nutzbar sind.

==== Hand-Gesten
Gesten sind natürliche Bewegungen, die eng mit der menschlichen Kommunikation verbunden sind. Die Entwicklung gestenbasierter Interaktionssysteme zielt darauf ab, eine Benutzererfahrung zu ermöglichen, die ohne physische Eingabegeräte auskommt und dadurch intuitiv nutzbar sein soll @handbook-ar @gesture-ar. Im Zuge dieser Arbeit wird zwischen Touch-Gesten und Hand-Gesten unterschieden. Im Folgenden werden zunächst Hand-Gesten betrachtet.

Die Erkennung von Gesten kann durch verschiedene Technologien oder durch die Kombination mehrerer Technologien erfolgen. Song et al. @in-air-gesture beschrieben in ihrer Arbeit die Verwendung von Kamerasystemen in Kombination mit Machine-Learning-Algorithmen zur Erkennung von Handgesten. Weitere Lösungen basieren auf der Verwendung von Tiefenkameras @depth-gesture oder Handschuhen, die mit Sensoren ausgestattet sind @glove-gesture.

Die Nutzung dieser Interaktionsmethode findet hierbei in einem breiten Spektrum von Anwendungen und Branchen statt. So wird die Gestensteuerung beispielsweise in der Medizin, der Industrie oder im Bereich der Unterhaltungselektronik eingesetzt @gesture-ar.

Trotz der vielfältigen Anwendungsmöglichkeiten und der intuitiven Bedienung lassen sich gestenbasierte Interaktionen nicht in allen Anwendungsfällen sinnvoll einsetzen @gesture-ar. Einfache Interaktionen lassen sich hierbei leicht merken, allerdings kann die Komplexität der Interaktionen schnell ansteigen, was zu immer komplexeren Gesten führen kann. In Kombination mit einer geringen Fehlertoleranz @user-defined-gesture kann dies die Interaktionsqualität negativ beeinflussen @gesture-ar.

==== Touch-Gesten
Touch-Gesten stellen eine natürliche und intuitiv nutzbare Interaktionsmethode dar. Sie basieren auf den gleichen Prinzipien wie die zuvor genannte Interaktion mittels Handgesten @handbook-ar.

Die Interaktion erfolgt über das Display eines Geräts, wobei Nutzer durch Berührung oder Bewegung des Fingers auf dem Bildschirm mit der Anwendung interagieren können. Touch-Gesten sind weit verbreitet und finden in vielen Anwendungen Verwendung, wie beispielsweise in Smartphones, Tablets oder interaktiven Tischen @handheld-ar-design.

Touch-Gesten bieten zahlreiche Anwendungsmöglichkeiten und sind aufgrund ihrer hohen Verfügbarkeit und Vertrautheit eine beliebte Interaktionsmethode. Jedoch stellt die Interaktion mit Augmented-Reality-Szenen eine Herausforderung dar, da die 2D-Eingabe auf ein 6DOF-System (six degrees of freedom) übertragen werden muss @handheld-ar-design.

==== Multimodal
Die Interaktion über einen einzelnen Eingabekanal wird als unimodales System bezeichnet. Die Art des Eingabekanals kann hierbei variieren, beispielsweise durch die Verwendung von Handgesten, Sprachsteuerung oder Touch-Gesten @overview-multimodal. Multimodale Interaktionssysteme ermöglichen es, mehrere dieser Eingabekanäle zu kombinieren, um eine effizientere und vielseitigere Interaktion zu ermöglichen @handbook-ar.

Nizam et al. stellen eine Übersicht über multimodale Interaktionen bereit. Es werden verschiedene Kombinationen von Eingabekanälen vorgestellt, die in ihrer Anzahl variieren. Beispielsweise wird die Kombination von Handgesten und Sprachsteuerung sowie die Kombination von Touch-Gesten und Sprachsteuerung beschrieben @overview-multimodal. Die Interaktion über verschiedene Eingabekanäle kann hierbei zeitgleich oder sequenziell erfolgen. In einer weiteren Studie wird die Kombination von Touch-Gesten und Handgesten beschrieben. Hierbei wird zunächst über eine Touch-Geste eine Auswahl getroffen, die anschließend durch eine Handgeste in der Augmented Reality Szene manipuliert wird @touch-and-gesture-interaction.

Multimodale Interaktionen bieten eine effizientere Möglichkeit der Interaktion mit Augmented Reality-Anwendungen, setzen jedoch gleichzeitig eine höhere Lernkurve für den Nutzer voraus. Des Weiteren kann die Kombination von Eingabekanälen zu einer höheren Komplexität der Interaktion führen @overview-multimodal.

=== Ausgabe
Für die Darstellung von Augmented Reality sind spezielle Hardwarekomponenten und Sensoren erforderlich. Diese Komponenten erfassen und analysieren die physische Umgebung, wodurch digitale Informationen nahtlos in die reale Welt eingebettet werden können. Zu den Hauptkomponenten gehören Sensoren für das Tracking sowie Eingabegeräte, die die Interaktionen der Nutzer mit der virtuellen Umgebung erfassen.

==== Handheld
Handheld bezeichnet eine breite Gerätegruppe, die sich in der Anzahl und Qualität der jeweiligen Hardware und Sensoren erheblich unterscheiden kann. Diese Variation beeinflusst die Verfügbarkeit und Qualität von Funktionen wie Tracking-Technologien oder Eingabemethoden. Die gängigsten Geräte in dieser Kategorie sind Smartphones und Tablets, die über das Display eine Video-See-Through-Ansicht für Augmented Reality-Inhalte bereitstellen @vr-ar-doener. Mit zunehmender Leistungsstärke von Smartphones und Tablets eröffnen sich immer mehr Anwendungsmöglichkeiten für auf Handhelds basierte Augmented Reality-Anwendungen. Hierbei ist einer der entscheidenden Vorteile im Vergleich zu spezialisierter Hardware die weite Verbreitung und die Vertrautheit der Nutzer mit der Technologie @handheld-ar-design.

Die Nutzung von Handheld-Geräten bringt spezifische Herausforderungen mit sich. Die Interaktion mit Augmented Reality Systemen erfolgt hauptsächlich über Touch-Eingaben auf dem Display. Diese Form der Interaktion erfordert die Übertragung einer 2D-Eingabe auf ein 6DOF-System (Six Degrees of Freedom), was die Interaktionsqualität einschränken kann @handheld-ar-design. Darüber hinaus basiert die Augmentierung auf der Position und Rotation der am Handheld-Gerät angebrachten Kamera, was den sogenannten Magic-Lens-Effekt einschränken kann. Dieser Effekt beschreibt den Idealfall, in dem die Perspektiven des aufgenommenen und des augmentierten Bildes übereinstimmen @vr-ar-doener. Ein weiteres Problem ist die Begrenzung des Sichtfeldes. Interaktionsmöglichkeiten sowie wichtige Informationen können sich außerhalb des Sichtfeldes des Geräts befinden, was dazu führen kann, dass diese Interaktionen oder Informationen möglicherweise nicht genutzt oder wahrgenommen werden @handheld-ar-design.

==== AR-Brillen
Neben Handheld-Geräten kann auch spezialisierte Hardware wie AR-Brillen für die Darstellung von Augmented Reality-Inhalten genutzt werden. Das optische See-Through-Display ermöglicht die Überlagerung von realen und virtuellen Inhalten durch optische Durchsicht. Im Gegensatz dazu ermöglicht das Video-See-Through-Display die Darstellung von virtuellen Inhalten auf einem Bildschirm, der die reale Umgebung durch eine Kamera aufnimmt @vr-ar-doener.

AR-Brillen bieten durch die Überlagerung des gesamten Sichtfeldes eine immersive Erfahrung. Im Gegensatz zu Handheld-Geräten ermöglichen sie eine freihändige Interaktion, da sie die Hände des Nutzers nicht blockieren. Allerdings sind AR-Brillen aufgrund ihrer spezialisierten Hardware und Sensoren in der Regel teurer und weniger verbreitet als Handheld-Geräte @vr-ar-doener.

=== Tracking
Tracking umfasst den Einsatz von Technologien und Verfahren zur Bestimmung von Position und Orientierung sowohl physischer als auch virtueller Objekte. Hierbei muss das System in der Lage sein, die Bewegungen des Benutzers und der Umgebung präzise zu erfassen, um eine erfolgreiche Transformation von virtuellen Objekten durchzuführen.

==== Sensorbasiertes Tracking
Sensorbasiertes Tracking nutzt verschiedene Sensoren, um die Position und Orientierung eines Geräts oder Objekts zu bestimmen. 

Inertialtracking ist ein schnelles und robustes Verfahren, das die Bewegung eines Geräts messen kann. Dieses Verfahren kommt ohne externe Referenzen aus, was einen klaren Vorteil gegenüber visuellen Sensoren darstellt, deren Effizienz stark von externen Faktoren beeinflusst wird @interial-tracking-system. Das System setzt sich typischerweise aus einer Kombination von Beschleunigungsmessern und Gyroskopen zusammen. Die einzelnen Sensoren werden hierbei in einer Inertialmess-Einheit (IMU) integriert @interial-tracking-system.

Der Beschleunigungsmesser erfasst die lineare Beschleunigung des Geräts, wodurch die Orientierung und deren Veränderung in Bezug zur Erde bestimmt werden können. Das Gyroskop misst die Rotations- oder Winkelgeschwindigkeit des Geräts und ermöglicht so die Bestimmung der Drehbewegung.

==== Optisches Tracking
Optisches Tracking beschreibt ein Verfahren, in welchem Kamerabilder benutzt werden, um die Position der Kamera sowie die Position von Objekten in der Umgebung zu bestimmen. Hierbei kann grundlegend zwischen markerbasiertem und markerlosen Verfahren unterschieden werden @vr-ar-doener. Für diese Arbeit wird auf Grundlage der Relevanz für WebXR-Anwendungen der Fokus auf markerlose Verfahren gelegt.

Im Bereich der markerlosen Verfahren wird Simultaneous Localization and Mapping (SLAM) als eine der wichtigsten Technologien angesehen. SLAM ermöglicht es, die Position und Orientierung eines Geräts in Echtzeit zu bestimmen, während parallel eine Karte der Umgebung erstellt wird. Die Architektur solcher SLAM-Systeme besteht typischerweise aus mehreren Modulen, wobei drei Grundmodule in jedem System vorhanden sind @handbook-ar.

Das Initialisierungsmodul nutzt Kameradaten, um eine erste Karte der Umgebung zu generieren. Hierbei wird häufig die Structure-from-Motion-Technik eingesetzt, die es ermöglicht, die Positionen visueller Merkmale in der Umgebung zu erfassen. Das Tracking-Modul übernimmt die Aufgabe, die aktuelle Position und Orientierung des Geräts zu schätzen. Es verfolgt die Bewegungen des Geräts durch die Umgebung und bestimmt die relative Position zu dieser. Das Mapping-Modul ist für die Erstellung und fortlaufende Aktualisierung der Umgebungskarte zuständig. Es speichert die Positionen der visuellen Merkmale und passt die Karte entsprechend an. Dieses Modul arbeitet langsamer als das Tracking-Modul, da es eine umfangreichere Datenverarbeitung erfordert @handbook-ar.

Darüber hinaus können zusätzliche Module integriert werden, die die Zuverlässigkeit und Robustheit des Systems verbessern. Ein Beispiel hierfür ist das Relokalisierungsmodul, das bei einem Verlust der Kameraposition hilft, die damit verbundenen Tracking- und Positionsabweichungen zu korrigieren. Diese Erweiterungen tragen wesentlich zur Leistungsfähigkeit und Flexibilität von SLAM-Systemen bei @handbook-ar.

Der Vorteil dieser optischen Verfahren besteht darin, dass kein Vorwissen über die Umgebungen vorhanden sein muss, was zu einer höheren Flexibilität als bei markerbasierten Verfahren führt @handbook-ar. Allerdings sind optische Verfahren stark anfällig für externe Faktoren wie Beleuchtung oder Reflektionen, die die Genauigkeit und Zuverlässigkeit der Tracking-Ergebnisse beeinträchtigen können @handbook-ar.

==== Hybrides Tracking
Viele Anwendungen im Bereich der Augmented Reality benötigen eine hohe Präzision und Robustheit des Tracking-Systems. Hybride Ansätze können zur Verbesserung der Systemstabilität beitragen. Döner betont die situative Qualität verschiedener Sensoren @vr-ar-doener. Optische Verfahren können beispielsweise durch externe Einflüsse wie Beleuchtung oder Reflexionen stark beeinträchtigt werden @handbook-ar. In solchen Fällen können andere Sensortypen dazu beitragen, diese situativen Schwächen auszugleichen @vr-ar-doener @handbook-ar.