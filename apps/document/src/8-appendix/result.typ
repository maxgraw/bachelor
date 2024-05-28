=== Grunddaten <appendix-resultBase>
#let results = csv("../data/response.csv")
#rotate(-90deg, reflow: true, table(
  columns: 28,
  gutter: 0pt,
  ..results.flatten(),
))

#pagebreak()
=== Daten Transformiert <appendix-resultTransformed>
#let results = csv("../data/response_transformed.csv")
#rotate(-90deg, reflow: true, table(
  columns: 26,
  gutter: 0pt,
  ..results.flatten(),
))

#pagebreak()
=== Skalenmittelwerte pro Person <appendix-resultTransformedMean>
#let results = csv("../data/response_transformed_mean.csv")
#rotate(0deg, reflow: true, table(
  columns: 6,
  gutter: 0pt,
  ..results.flatten(),
))

#pagebreak()
=== Daten Konfidenz <appendix-responseConfidence>
#let results = csv("../data/response_confidence.csv")
#rotate(0deg, reflow: true, table(
  columns: 7,
  gutter: 0pt,
  ..results.flatten(),
))

#pagebreak()
=== Verteilung der UEQ-Skalen <appendix-resultDistribution>
#rotate(-90deg, image("../media/result/ueq_distribution.png"), reflow: true)

=== Anmerkungen <appendix-Anmerkungen>
- Start-Button deutlicher darstellen, Neu laden der Seite anders gestalten, "Löschen"-Button verschwindet hinter Stack-Cubes -> Ebene auf davor verschieben

- Nachdem der Kreis erschienen ist, weiß man nicht wie es weitergeht, evtl. Anweisung am Kreis, Knopf am Anfang größer und pregnanter. 

- Die Möbel verdecken die buttons wenn diese sie überlagern. die buttons sollten immer im Vordergrund angezeigt werden.

- Die Anwendung hat sich einmal aufgehangen. Das Menü mit 1x1 und 2x1 hat keine Eingabe akzeptiert und die Seite musste neu geladen werden

- Die Stackcubes wurden nicht ohne Lücken aufeinander gestapelt. Es war möglich unrealistische (schwebende) Konstruktionen zu bauen.