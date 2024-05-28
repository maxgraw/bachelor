#show outline.entry.where(
  level: 1
): it => {
  v(16pt, weak: true)
  strong(it)
}

#outline(indent: auto, depth: 2, target: heading.where(supplement: [Abschnitt]))
#pagebreak()