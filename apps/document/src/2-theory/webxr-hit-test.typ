Das Hauptziel der Augmented Reality-Anwendung besteht in der Integration virtueller und realer Inhalte. Im @webxr-chapter wurde das WebXR Spaces Interface vorgestellt, welche das Tracking von Position und Bewegung in einer XRSession ermöglichen. Das System kann jedoch nicht bestimmen, ob sich das platzierte virtuelle Objekt auf einer realen Ebene oder Wand befindet. Die WebXR Hit Test API ermöglicht das Abfragen von realen Flächen und ermöglicht damit eine präzise Platzierung von Objekten @webxr-hit-test-module. 

In dieser Arbeit wird der Hit Test als ein Prozess definiert, der überprüft, ob ein mathematischer Strahl mit der durch die Technologie erfassten realen Welt interagiert. Virtuelle Objekte werden in diesem Zusammenhang nicht berücksichtigt.

=== XRHitTestSource
Das Interface XRHitTestSource ermöglicht das Verwalten von Hit Tests innerhalb einer XRSession. Als Grundlage dient hierbei die jeweilige XRSession welche Informationen bereitstellt, die für die Durchführung des Hit Tests benötigt werden @webxr-hit-test-module.

#let code = ```ts
interface XRHitTestSource {
  undefined cancel();
};

partial interface XRSession {
  Promise<XRHitTestSource> requestHitTestSource(options);
};
```

#figure(
  code,
  caption: [XRHitTestSource Interface und requestHitTestSource Funktion]
) <XRHitTestSource-listing>

Die Funktion requestHitTestSource aus @XRHitTestSource-listing einer XRSession ermöglicht das Initialisieren eines Hit-Testes. Bei diesem Vorgang wird ein XRSpace-Objekt übergeben, welches Informationen über die erfasste Umgebung enthält. Diese Informationen dienen als Grundlage für die räumliche Verortung der Hit-Tests in der realen Welt @webxr-hit-test-module.

=== XRHitTestResult
Um die Ergebnisse eines Hit-Tests zu verarbeiten, wird das Interface XRHitTestResult bereitgestellt. Dieses Interface ermöglicht es, die Position und Orientierung eines getroffenen Punktes in der realen Welt zu bestimmen @webxr-hit-test-module.

#let code = ```ts
interface XRHitTestResult {
  XRPose? getPose(XRSpace);
};

partial interface XRFrame {
  FrozenArray<XRHitTestResult> getHitTestResults(XRHitTestSource);
};
```

#figure(
  code,
  caption: [XRHitTestResult Interface und getHitTestResults Funktion]
) <XRHitTestResult-listing>

Um das Ergebnis abzurufen, wird die Funktion getHitTestResults eines XRFrame-Objektes bereitgestellt. Wie in @XRHitTestResult-listing dargestellt wird hierbei das zuvor initialisierte XRHitTestSource-Objekt als Parameter übergeben. Das Ergebnis wird als Array von XRHitTestResult-Objekten zurückgegeben, welche Informationen über den getroffenen Punkt in der realen Welt enthalten. Die Funktion getPose eines XRHitTestResult-Objektes ermöglicht es, die Position und Orientierung des getroffenen Punktes in der realen Welt zu bestimmen @webxr-hit-test-module.