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

#bibliography("bib.yml")