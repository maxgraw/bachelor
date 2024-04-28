#import "template.typ": *

#show: project.with(
  title: "Konzeption und Entwicklung einer Augmented Reality Konstruktionsumgebung für Möbelsysteme auf Basis von WebXR",
  type: "Bachelorarbeit",
  course: "Mensch Technik Interaktion",
  author: "Maximilian David Graw",
  number: "10012985",
  date: "12.07.2024",
  logo: image("./media/HRW_LOGO.jpg", width: 40%),
)

#include "0-base/1-oath.typ"
#include "0-base/2-abstract.typ"
#include "0-base/3-short.typ"
#include "0-base/4-outline.typ"

#set page(numbering: "1", number-align: right)
#counter(page).update(1)

= Einleitung
#include "1-introduction/0-index.typ"

= Theoretische Grundlagen
#include "2-basics/0-index.typ"

= Stand der Technik
#include "3-state/0-index.typ"

= Konzeptentwicklung
#include "4-concept/0-index.typ"

= Implementierung
#include "5-implementation/0-index.typ"

= Evaluation
#include "6-evaluation/0-index.typ"

= Ausblick und Fazit
#include "7-conclusion/0-index.typ"

#bibliography("bib.yml")