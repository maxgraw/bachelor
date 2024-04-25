#let project(
  title: [Thesis Title],
  type: "",
  course: "",
  author: "",
  number: "",
  supervisor: "",
  date: none,
  logo: none,
  body,
) = {
  // Set the document's basic properties.
  set document(author: author, title: title)
  set text(font: "Linux Libertine", lang: "de")
  set heading(numbering: "1.1")
  set text(12pt)
  set page(margin: (top: 3cm, left: 2.5cm, right: 2.5cm, bottom: 3.5cm))
  set figure(gap: 1cm)

  set align(center)

  if logo != none {
    logo
  }

  text(2em, weight: 700, title)

  v(4em, weak: true)

  text(1.5em, type)
  linebreak()
  "Studiengang "
  text(course)
  linebreak()
  " der Hochschule Ruhr West"

  v(5em, weak: true)

  text(author)
  v(1.2em, weak: true)

  "Matrikelnummer: "
  text(number)

  if date != none {
    v(1fr, weak: true)
    "Abgabedatum: "
    text(date)
  }

  pagebreak()

  // Main body.
  set align(start)
  show heading.where(level: 1): set block(above: 1.95em, below: 1em)
  show heading.where(level: 2): set block(above: 1.85em, below: 1em)
  show heading.where(level: 3): set block(above: 1.75em, below: 1em)
  show heading.where(level: 4): set block(above: 1.55em, below: 1em)
  set par(justify: true)

  body
}