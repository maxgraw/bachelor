Um virtuelle Objekte in einer realen Umgebung realistisch erscheinen zu lassen, ist es wichtig, dass sie sich in Farbgebung, Größe und Beleuchtung an die reale Umgebung anpassen. Das WebXR Lighting Estimation Modul ermöglicht die Schätzung der Umgebungslichtverhältnisse, wodurch eine bessere Integration von virtuellen und realen Objekten erreicht wird @webxr-lighting-estimation-module.

=== XRLightProbe
Das XRLightProbe Interface liefert Informationen über die Lichtverhältnisse in der Umgebung zu einem bestimmten Zeitpunkt @webxr-lighting-estimation-module.

#let code = ```ts
interface XRLightProbe : EventTarget {
  readonly attribute XRSpace probeSpace;
  attribute EventHandler onreflectionchange;
};
```

#figure(
  code,
  caption: [XRLightProbe Interface]
)

Um das WebXR Lighting Modul zu initialisieren, muss zunächst der String „light-probe“ in die Feature Dependencies der XRSession aufgenommen werden. Anschließend kann die Funktion requestLightProbe aufgerufen werden, um ein XRLightProbe Objekt zu erhalten @webxr-lighting-estimation-module. Wie in @XRLightProbe-listing dargestellt wird die Funktion hierbei vom XRSession Objekt bereitgestellt

#let code = ```ts
partial interface XRSession {
  Promise<XRLightProbe> requestLightProbe(options = {});
  readonly attribute XRReflectionFormat preferredReflectionFormat;
};
```

#figure(
  code,
  caption: [requestLightProbe Funktion und preferredReflectionFormat Attribut]
) <XRLightProbe-listing>