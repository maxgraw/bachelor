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

== Motivation
#include "1-introduction/1-motivation.typ"

== Ziel
#include "1-introduction/2-goal.typ"

== Vorgehensweise
#include "1-introduction/3-method.typ"

= Grundlagen
#include "2-basics/0-index.typ"

== Augmented Reality
#include "2-basics/1-ar.typ"

== Web Component
#include "2-basics/2-component.typ"

== XR
#include "2-basics/3-xr.typ"

= Stand der Technik
#include "3-state/0-index.typ"

== Trackingverfahren
== Frameworks
#include "3-state/1-frameworks/0-index.typ"
=== Apple
#include "3-state/1-frameworks/1-apple.typ"
=== Google
#include "3-state/1-frameworks/2-arcore.typ"
=== Unity
#include "3-state/1-frameworks/3-unity.typ"
=== WebXR
#include "3-state/1-frameworks/4-webxr.typ"
== Applikation

= Konzeptentwicklung
#include "4-concept/0-index.typ"
== Definition der Zielgruppe
#include "4-concept/1-group.typ"
== Anforderungsanalyse
#include "4-concept/2-requirement.typ"
== Wahl der Technik

= Implementierung
== Softwarearchitektur
== Technische Grundlagen
== ?

= Evaluation
== Zielsetzung
== Methodik
== Ergebnisse

= Ausblick und Fazit

#bibliography("bib.yml")