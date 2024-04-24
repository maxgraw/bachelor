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

#show outline.entry.where(
  level: 1
): it => {
  v(12pt, weak: true)
  strong(it)
}
#outline(indent: auto)
#pagebreak()


#set page(numbering: "1", number-align: right)
#counter(page).update(1)

= Einleitung
#include "1-introduction/0-index.typ"

== Motivation
#include "1-introduction/1-motivation.typ"

== Ziel
#include "1-introduction/2-goal.typ"

== Vorgehensweise
#include "1-introduction/3-method.typ"

= Augmented Reality
#include "2-ar/0-index.typ"

== Begriffsabgrenzung
#include "2-ar/1-expression.typ"

== Definition
#include "2-ar/2-definition.typ"

== Prozess
#include "2-ar/3-pipeline.typ"

= Stand der Technik
#include "3-state/0-index.typ"
== Frameworks
#include "3-state/1-frameworks/0-index.typ"
=== Apple
#include "3-state/1-frameworks/1-apple.typ"
=== ARCore
#include "3-state/1-frameworks/2-arcore.typ"
=== Unity
#include "3-state/1-frameworks/3-unity.typ"
=== WebXR
#include "3-state/1-frameworks/4-webxr.typ"
== Applikation

= Konzeptentwicklung
branch concept-v0
== Zielgruppendefinition
== Anforderungsanalyse
== Wahl der Technik

= Implementierung
branch implementation-v0

= Evaluation
branch evaluation-v0
== Zielsetzung
== Methodik
== Ergebnisse

= Ausblick und Fazit
branch conclusion-v0

#bibliography("bib.yml")