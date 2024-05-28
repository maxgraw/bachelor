Das Hauptmerkmal der Anwendung liegt in der erweiterten Interaktion mit dem Möbelsystem. Aus der Anforderungsanalyse ergeben sich klare Funktionen und Interaktionen, welche von der Anwendung umgesetzt werden müssen. Um die Interaktion und Entwicklung der Anwendung zu unterstützen, wird ein User Flow erstellt. Der User Flow ist hierbei aus drei Blöcken aufgebaut. Diese Blöcke sind Aktion (Kreis), Prozess (Rechteck) und Entscheidung (Raute). Diese Blöcke stellen die Abläufe und Entscheidungen dar, welche in der Anwendung getroffen werden. Die einzelnen Blöcke sind durch Pfeile miteinander verbunden, welche die Richtung der Interaktionen und Abläufe darstellen.

Die Interaktion mit dem System lässt sich in zwei Bereiche unterteilen. Im ersten Bereich erfolgt die Interaktion über die Kameraposition und die Ausrichtung des Geräts. Das System sucht nach einer geeigneten Fläche zur Darstellung von Möbelstücken, die durch Anpassen der Kameraposition und der Ausrichtung des Geräts beeinflusst werden kann. Bei einer geeigneten Fläche erscheint ein Cursor, der weitere Interaktionen ermöglicht. Wird keine geeignete Fläche gefunden, wird der Prozess zurückgesetzt und die Suche erneut gestartet wie in @user-flow dargestellt.

Falls der Cursor dargestellt wird, beginnt der zweite Bereich des User Flows. Hier wird die Interaktion über Tap-Events ermöglicht. Die Art des angetippten Elements entscheidet über den weiteren Verlauf im User Flow. Wird kein Element angetippt, wird zum Anfang des User Flows zurückgesprungen und alle Menüs werden nicht mehr angezeigt. Ein Sonderfall tritt ein, wenn die Szene leer ist und bisher kein Möbelstück platziert wurde. In diesem Fall wird das Menü "Auswahl" sichtbar. Dieser Sonderfall stellt den Startprozess der Anwendung dar und ermöglicht das Platzieren eines ersten Möbelstücks, das als Grundlage für die weitere Interaktion dient.

Im Falle eines angetippten Elements wird zwischen einem Möbelstück und einem Menü unterschieden. Ist das angetippte Element ein platziertes Möbelstück, werden die Menüs "Löschen" und "Anhängen" sichtbar. Handelt es sich um ein Menü, wird zwischen drei unterschiedlichen Optionen unterschieden. Das Menü "Auswahl" ermöglicht es, einzelne Optionen auszuwählen und das entsprechende Möbelstück in der Umgebung zu platzieren. Danach wird der User Flow zurückgesetzt. Die Menüs "Löschen" und "Anhängen" sind nur sichtbar, wenn zuvor ein Möbelstück angetippt und somit ausgewählt wurde. Das Menü "Löschen" ermöglicht das Löschen des ausgewählten Möbelstücks. Das Menü "Anhängen" erlaubt es, ein weiteres Möbelstück an das ausgewählte Möbelstück anzuhängen. Hierfür wird das Menü "Auswahl" erneut angezeigt, um ein weiteres Möbelstück auszuwählen.

#figure(
    image("../media/user_flow.svg", width: 100%),
    caption: [User Flow der Anwendung],
) <user-flow>