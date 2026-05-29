#import "cover.typ": cover
#import "tools.typ": concept, section, sref
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

#let definition = (title: "Definition", color: rgb("#bb3333"))
#let convention = (title: "Convention", color: rgb("#dd8855"))
#let theorem = (title: "Theorem", color: rgb("#229922"))
#let proof = (title: "Proof", color: rgb("#335533"))
#let corollary = (title: "Corollary", color: rgb("#3355bb"))
#let lemma = (title: "Lemma", color: rgb("#8822aa"))

// Start of the document
= Complex Numbers
== Structure of Complex Numbers
#section(definition, subtitle: [Complex Numbers])[
  The set of #concept[complex numbers], denoted by $CC$, is the Cartesian product of the real numbers with itself. That is
  $
    CC := RR times RR.
  $
]
A typical element $z in CC$ can be expressed as an ordered pair of real numbers $(x, y)$. The set of complex numbers as for now is just a set of ordered pairs. Thus, we shall define some operations on $CC$ to give it more structure.
#section(definition, subtitle: [Operations Within Complex Numbers])[
  The #concept[addition] of two complex numbers $z_1 = (x_1, y_1)$ and $z_2 = (x_2, y_2)$ is defined as
  $
    z_1 + z_2 := (x_1 + x_2, y_1 + y_2).
  $
  The #concept[multiplication] of two complex numbers $z_1 = (x_1, y_1)$ and $z_2 = (x_2, y_2)$ is defined as
  $
    z_1 z_2 := (x_1 x_2 - y_1 y_2, x_1 y_2 + x_2 y_1).
  $
]<complexops>
#section(theorem, subtitle: [Complex Field])[
  The set of complex numbers $CC$ with the operations of addition and multiplication defined in #sref(definition.title, <complexops>) are _well-defined_ and _satisfy the properties that we except them to have_.
]<complexfield>
#section(definition, subtitle: [Imaginary Unit])[
  The #concept[imaginary unit] $i$ is defined as the complex number $(0, 1)$.
]
The imaginary unit $i$ has a very interesting property, which is that
$
  i^2 = (0,1) (0,1) = (-1, 0).
$

#section(corollary, subtitle: [Decomposition of Complex])[
  A complex number $z = (x, y)$ can be written as $z = (x, 0) + i (y, 0).$
  #section(proof)[
    Consider a complex number $z = (x, 0) + i (y, 0)$. We have
    $
      z = (x, 0) + (0, 1) (y, 0) = (x, 0) + (0, y) = (x, y).
    $
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Embedding of Real in Complex])[
  Let $R$ be the set of all complex numbers of the form $(x, 0)$, where $x in RR$. That is
  $
    R = {(x, 0): x in RR}.
  $
  Then, $R$ is a subset of $CC$ and $R$ is _structurally equivalent_ to $RR$.
  #section(proof)[
    As we need to properly define the word _equivalent_ before we can prove the theorem, we shall only first do an informal demonstration of the theorem here.\

    To show that $R$ is _structurally equivalent_ to $RR$, let's first show that $R$ is _itself equivalent_ to $RR$. Consider an element $(x, 0) in R$, we can associate it to *a unique* element $x in RR$ and *vice versa*. This is called a #concept[bijection], which somewhat means that $R$ and $RR$ have the same number of elements.\

    Furthermore, we claim that the *addition* and *multiplication* of two elements in $R$ are _equivalent_ to the addition and multiplication of the corresponding elements in $RR$. To show this, consider two elements $(x_1, 0), (x_2, 0) in R$, we have
    $
      (x_1, 0) + (x_2, 0) = (x_1 + x_2, 0),
    $
    which corresponds to the sum of $x_1$ and $x_2$ in $RR$. Similarly, we have
    $
      (x_1, 0) (x_2, 0) = (x_1 x_2, 0),
    $
    which also corresponds to the product of $x_1$ and $x_2$ in $RR$.\

    Since the *addition* and *multiplication* on these two sets are _equivalent_, any other operations derived from these two operations (such as subtraction, division, exponential) are also _equivalent_. Hence, we can conclude that $R$ and $RR$ are _structurally equivalent_.
  ]
]

#section(convention)[
  Now, due to this _structural equivalence_, we will denote any complex number of the form $(x,0)$ directly by $x$ and *call* this number a #concept[real number].\
  Moreover, we will borrow any function $f: RR mapsto RR$ to $R$, by defining a function $f_R: R mapsto R$ as
  $
    f_R ((x, 0)) := (f(x), 0).
  $
]<BRCal>

#section(corollary, subtitle: [Alternative Notation])[
  A complex number $z = (x,y)$ can be written as
  $
    z = (x,y) = (x,0) + i (y,0) = x + i y.
  $
]
For a complex number $z = x + i y$, we call $x$ the #concept[real part] of $z$ and denote it by $Re(z)$ or $"Re"(z)$, and we call $y$ the #concept[imaginary part] of $z$ and denote it by $Im(z)$ or $"Im"(z)$.

#section(definition, subtitle: [Complex Conjugate])[
  The #concept[complex conjugate] of a complex number $z = x + i y$ is defined as
  $
    dash(z) := x - i y.
  $
]
One can immediately verify that the complex conjugate has the following property:
$
  z dash(z) = (x + i y) (x - i y) = x^2 + y^2.
$
Due to #sref(convention.title, <BRCal>), we treat $x^2 + y^2$ as real number. Since $z dash(z) = x^2 + y^2$ is a *non-negative real number*, we can take the square root of it.
#section(definition, subtitle: [Modulus])[
  The #concept[modulus] of a complex number $z = x + i y$ is defined as
  $
    |z| := sqrt(z dash(z)) = sqrt(x^2 + y^2).
  $
]
#section(corollary, subtitle: [Modulus and Conjugate])[
  The modulus of a complex number $z$ is always a non-negative real number, that is,
  $
    |z| >= 0.
  $
]
#section(corollary, subtitle: [Inverse of a Complex Number])[
  A complex number $z = x + i y != 0$ has a multiplicative inverse, which is given by
  $
    1/z = 1/z dash(z)/dash(z) = dash(z)/abs(z)^2 = x/abs(z) - i y/abs(z)
  $
]

== Polynomials and Complex Roots
#section(theorem, subtitle: [Fundamental Theorem of Algebra])[
  Every non-constant polynomial with complex coefficients has at least one complex root.
]

#section(theorem, subtitle: [Factorization of Polynomials])[
  If $f$ is a degree $n$ polynomial with complex coefficients, then $f$ can be factored into $n$ #concept[linear factors].
  $
    f = a (X - z_1) (X - z_2) ... (X - z_n),
  $
  where $z_1, z_2, ..., z_n$ are the complex roots of $f$ and $a$ is the leading coefficient of $f$.
]

== Geometric Interpretation of Complex Numbers
#section(lemma, subtitle: [Euler's Formula])[
  Let $theta in RR$. Then, we have
  $
    e^(i theta) = cos(theta) + i sin(theta).
  $
]
#section(corollary, subtitle: [Modulus of Exponential])[
  One can immediately verify that the modulus of $e^(i theta)$ is always 1, that is,
  $
    abs(e^(i theta)) = sqrt(cos^2(theta) + sin^2(theta)) = 1.
  $
]
#section(corollary, subtitle: [Polar Form])[
  One can also verify that any complex number $z$ can be written in the form
  $
    z = r e^(i theta),
  $
  where $r = abs(z) in RR$ and $arg(z) := theta$ is called the #concept[argument] of $z$.
]


#pagebreak()
= Algebraic Structures
== Groups, Rings, and Fields
#section(definition, subtitle: [Groups])[
  A #concept[group] is a set $G$ together with a binary operation $dot$ that satisfies the following properties:
  + *Closure*: For all $a, b in G$, we have $a dot b in G$.
  + *Associativity*: For all $a, b, c in G$, we have $(a dot b) dot c = a dot (b dot c)$.
  + *Identity*: There exists an element $e in G$ such that for all $a in G$, we have $e dot a = a dot e = a$.
  + *Inverse*: For each element $a in G$, there exists an element $b in G$ such that $a dot b = b dot a = e$.
]

#section(definition, subtitle: [Monoids and Semigroups])[
  A #concept[monoid] is a set $S$ together with a binary operation $dot$ that satisfies the following properties:
  + *Closure*
  + *Associativity*
  + *Identity*

  A #concept[semigroup] is a set $S$ together with a binary operation $dot$ that satisfies the following properties:
  + *Closure*
  + *Associativity*
]

#section(corollary, subtitle: [Uniqueness of Identity and Inverse])[
  The *identity element* and the *inverse of each element* in a group are unique.
  #section(proof)[
    Let $G$ be a group and let $e$ and $e'$ be two identity elements in $G$. Then, we have
    $
      e = e dot e' = e'.
    $
    Hence, the identity element is unique.\

    Let $a in G$ and let $b$ and $b'$ be two inverses of $a$. Then, we have
    $
      b = b dot e = b dot (a dot b') = (b dot a) dot b' = e dot b' = b'.
    $
    Hence, the inverse of each element is unique.
  ]
]


#section(definition, subtitle: [Abeliang Groups])[
  A group $G$ is called an #concept[Abelian group] if the binary operation $dot$ is *commutative*, that is, for all $a, b in G$, we have $a dot b = b dot a$.
]

#section(definition, subtitle: [Rings])[
  A #concept[ring] is a set $R$ together with two binary operations $+$, called *addition*, and $dot$, called *multiplication*, such that:
  + $(R, +)$ is an *Abelian group*.
  + $(R, dot)$ is a *monoid*.
  + *Distributive Laws*: For all $a, b, c in R$, we have
    - $a dot (b + c) = a dot b + a dot c$
    - $(a + b) dot c = a dot c + b dot c$
]

#pagebreak()

#section(definition, subtitle: [Commutative Rings])[
  A #concept[commutative ring] is a ring $R(+,dot)$ such that the *multiplication is commutative*, that is, for all $a, b in R$, we have $a dot b = b dot a$.
]

#section(definition, subtitle: [Fields])[
  A #concept[field] is a set $F$ together with two binary operations $+$ and $dot$, with its *additive identity* denoted by $0$, such that:
  + $F(+,dot)$ is a *commutative ring*.
  + Every element $f in F$ such that $f != 0$ has a *multiplicative inverse* in $F$.
]

#section(theorem, subtitle: [Real Field])[
  The set of real numbers $RR$ with the usual addition and multiplication forms a #concept[field].
  #section(proof)[
    Let's start by showing that $RR(+)$ is an Abelian group.
    + *Closure*: For all $a, b in RR$, we have $a + b in RR$.
    + *Associativity*: For all $a, b, c in RR$, we have $(a + b) + c = a + (b + c)$.
    + *Identity*: The additive identity is $0$, since for all $a in RR$, we have $0 + a = a + 0 = a$.
    + *Inverse*: For each element $a in RR$, the additive inverse is $-a$, since we have $a + (-a) = (-a) + a = 0$.
    + *Commutativity*: For all $a, b in RR$, we have $a + b = b + a$.

    Now, let's show that $RR(dot)$ is a monoid.
    + *Closure*: For all $a, b in RR$, we have $a dot b in RR$.
    + *Associativity*: For all $a, b, c in RR$, we have $(a dot b) dot c = a dot (b dot c)$.
    + *Identity*: The multiplicative identity is $1$, since for all $a in RR$, we have $1 dot a = a dot 1 = a$.

    Due to the *distributive laws* of real numbers, we can conclude that $RR$ is a *ring*. Moreover, it is a *commutative ring* since the multiplication of real numbers is commutative. Finally, *every non-zero real number has a multiplicative inverse*, which is also a real number. Hence, we can conclude that $RR$ is a *field*.
  ]
]<realfield>

#section(theorem, subtitle: [Complex Field])[
  Now, we can formally restate #sref(theorem.title, <complexfield>) as follows: The set of complex numbers $CC$ with the operations of addition and multiplication defined in #sref(definition.title, <complexops>) forms a #concept[field].
]
The proof of this theorem follows the same idea as the proof for #sref(theorem.title, <realfield>).
