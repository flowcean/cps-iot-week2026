#import "@preview/cetz:0.4.2"

#set text(font: "Libertinus Sans")

#cetz.canvas({
  import cetz.draw: *
  let text_box(position, name, fill: blue.lighten(60%), x, size: (9em, 2.8em)) = {
    rect(
      (
        rel: (-size.at(0) / 2, -size.at(1) / 2),
        to: position,
      ),
      (rel: size),
      radius: 0.2,
      name: name,
      fill: fill,
    )
    content(position, align(center + horizon, x))
  }
  set-style(mark: (end: ">"))

  text_box(
    (0, 0),
    fill: blue.lighten(60%),
    "flow",
    [Identification of \ Flow Functions],
  )
  content((rel: (2, 0.2)), [#sym.triangle.r.filled])
  content((rel: (0, -0.4)), [#sym.triangle.l.filled])

  text_box((4, 0), "segments", [Detection of \ Segments])
  content((rel: (2, 0)), [#sym.triangle.r.filled])

  text_box((8, 0), "guards", [Identification of \ Guard Conditions])
  content((rel: (2, 0)), [#sym.triangle.r.filled])

  text_box((12, 0), "model", [Model \ Construction])
})