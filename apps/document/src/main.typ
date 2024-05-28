#import "template.typ": *

#show: project.with(
  title: "Konzeption und Entwicklung einer Augmented Reality Konstruktionsumgebung für Möbelsysteme auf Basis von WebXR",
  type: "Bachelorarbeit",
  course: "Mensch Technik Interaktion",
  author: "Maximilian David Graw",
  number: "10012985",
  date: "28.05.2024",
  logo: image("./media/logo/hrw.jpg", width: 40%),
)

#include "0-base/0-index.typ"

#set page(numbering: "1", number-align: right)
#counter(page).update(1)

#show raw.where(block: true): set block(
  breakable: false,
  fill: luma(240),
  inset: 5pt,
  radius: 4pt,
  width: 100%,
)

#set heading(numbering: "1.1", supplement: [Abschnitt])

= Einleitung
#include "1-introduction/0-index.typ"

= Theoretische Grundlagen
#include "2-theory/0-index.typ"

= Stand der Technik
#include "3-state/0-index.typ"

= Konzeptentwicklung
#include "4-concept/0-index.typ"

= Implementierung
#include "5-implementation/0-index.typ"

= Evaluation
#include "6-evaluation/0-index.typ"

= Zusammenfassung und Ausblick
#include "7-conclusion/0-index.typ"

#pagebreak()
#bibliography(("./bib/base.yml", "./bib/current-studies.yml", "./bib/ikea.yml", "./bib/wayfair.yml", "./bib/webxr.yml", "./bib/webgl.yml", "./bib/frameworks.yml", "./bib/interfaces.yml", "./bib/shop-interface.yml", "./bib/implementation.yml", "./bib/evaluation.yml"))

#set heading(numbering: none)

#let appendix(body) = {
  set heading(numbering: "1.1", supplement: [Anhang])
  counter(heading).update(1)
  body
}

#pagebreak()
= Anhangsverzeichnis
#outline(indent: auto, title: none, target: heading.where(supplement: [Anhang]))
#pagebreak()

#show: appendix

#show raw.where(block: true): set block(
  breakable: true,
)

#include "8-appendix/0-index.typ"