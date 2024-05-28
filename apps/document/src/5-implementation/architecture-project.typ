Im Folgenden wird auf die grundlegenden Technologien eingegangen, die zur Entwicklung der Anwendung verwendet wurden. Hierbei wird auf die verwendeten Frameworks und Bibliotheken eingegangen, die die Grundlage für die Entwicklung der Anwendung bilden. Zunächst wird Node.js als Laufzeitumgebung für JavaScript verwendet. Node.js ermöglicht die Ausführung von JavaScript-Code außerhalb des Browsers und unterstützt die Entwicklung von Webanwendungen @nodejs. Um externe und interne Pakete zu verwalten und zu installieren, wird pnpm als Package-Manager verwendet. Pnpm stellt eine Alternative zu npm dar, dem Standard-Package-Manager für Node.js, bietet jedoch Vorteile in Bezug auf Geschwindigkeit und das Verwalten von Paketen @pnpm-motivation. Für die Verwaltung und Orchestrierung von Paketen und Build-Prozessen innerhalb der Monorepo wird Turborepo verwendet. Turborepo dient hierbei nicht als tatsächliches Build-Tool, welches Pakete kompiliert, sondern ermöglicht das Erstellen von Pipelines, wodurch Entwicklungs- oder Build-Prozesse paketübergreifend ausgeführt werden können. Zum Erstellen eines Produktions-Builds wird Vite verwendet @turborepo. Vite bietet hierbei die Möglichkeit, Code zu bündeln sowie weitere Eigenschaften, die bei der Entwicklung von Webanwendungen relevant sind @vite.

Bis jetzt wurden nur Technologien vorgestellt, welche die Entwicklungsumgebung betreffen. Im Folgenden wird genauer auf externe Packete eingegangen, welche für die Anwendung direkt relevant sind. Wie zuvor in der Konzeption festgelgt wird zunächst Three.js als Framework verwendet @three-js. Als zusätzliches Packet wird "three-mesh-ui" verwendet, um Interfaces innerhalb von Three.js zu erstellen und zu verwalten @three-mesh-ui.

Die Anwendung wurde in einer Monorepo Architektur entwickelt. Hierbei wurden insgesamt vier Pakete erstellt, welche Teile der Anwendung darstellen. Das Paket "player" stellt die eigentliche Anwendung dar. Es bündelt verschiedene Pakte und exportiert die fertigen Web Components. Im Paket "components" finden sich 3D Objekte wie der zuvor vorgestellte Cursor sowie die Menüs der Anwendung. Das Paket "utils" beinhaltet Funktionen, welche in mehreren Paketen und Klassen verwendet werden. Durch die separate Strukturierung wird es ermöglicht, dass Funktion aus diesem Paket in anderen Paketen verwendet werden können. Abschließend gibt es das Paket "example", welches eine Beispielanwendung darstellt. Im Folgenden wird genauer auf die einzelnen Pakete eingegangen @github-project.