#import "@preview/cetz:0.2.2": canvas, chart, draw, palette, plot

#let data = ((19, 0, 1, 0), (22, 1, 0, 0), (23, 10, 0, 0), (24, 1, 0, 0), (25, 1, 0, 0), (28, 2, 0, 0), (31, 1, 0, 0), (54, 0, 1, 0), (55, 1, 0, 0), (56, 0, 1, 0), (60, 1, 0, 0))

#let age_gender = canvas({
  draw.set-style(legend: (fill: white))
  chart.columnchart(
    size: (12, 5),
    mode: "stacked", 
    value-key: (1,2,3),
    data,
    x-label: "Alter",
    y-label: "Anzahl",
    bar-style: palette.new(colors: (rgb(217, 48, 29), rgb(0, 176, 240), rgb(210, 246, 138))),
    labels: ([Männlich], [Weiblich], [Divers]), 
    legend: "legend.inner-north-east",
  )
})