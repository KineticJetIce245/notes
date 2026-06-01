#let concept(body) = {
  text(fill: maroon)[*#body*]
}

#let section-counter = counter("section")

#let section(meta, subtitle: [], body) = {
  let inset = (top: 0.5em, right: 1.5em, left: 1.5em, bottom: 0.5em)
  if meta.title != "Proof" {
    section-counter.step()
  } else {
    inset.left = 0.5em
    inset.right = 0.5em
  }

  let title = meta.title + " " + context { counter(heading).display() + section-counter.display() }
  if subtitle != [] {
    title += " (" + subtitle + "):"
  } else {
    title += ":"
  }
  block(sticky: true, above: 1em, width: 100%)[
    #text(fill: meta.color)[*#title*]\
  ]
  block(inset: inset, above: 0em, width: 100%)[
    #body
  ]
}

#let sref(title, label) = {
  context {
    let matches = query(label)
    if matches.len() == 0 {
      text(fill: red, weight: "bold")[?Label?]
    } else {
      let target-loc = matches.last().location()
      let sc = section-counter.at(target-loc).last()
      if title != "Proof" {
        sc += 1
      }
      let num = [
        #counter(heading).at(target-loc).map(str).join(".")\.#sc]
      link(target-loc)[*#title #num*]
    }
  }
}
