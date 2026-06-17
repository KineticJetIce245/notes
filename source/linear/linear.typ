#import "env.typ": concept, convention, corollary, definition, lemma, proof, pyglue, section, sref, theorem
#import "../cover.typ": cover
#set page(paper: "us-letter")
#set par(justify: true)
#set document(
  title: [Notes on MATH 223],
)

// Cover page
#show: cover
#pagebreak()

// Menu
#outline()
#pagebreak()

// Modifications on Global Settings
#set heading(numbering: "1.")
#show heading.where(level: 1): set align(center)
#show heading.where(level: 1): it => {
  context { counter("section").update(0) }
  block[
    #counter(heading).display((..nums) => "Chapter " + nums.pos().map(str).join(".") + ". ")
    #it.body
  ]
}

#show heading.where(level: 2): it => {
  context { counter("section").update(0) }
  block[
    #counter(heading).display((..nums) => [#nums.pos().last()] + ". ")
    #it.body
  ]
}

// Start of the document
#include "chp1.typ"
#pagebreak()

#include "chp2.typ"
#pagebreak()

#include "chp3.typ"
#pagebreak()

#include "chp4.typ"
