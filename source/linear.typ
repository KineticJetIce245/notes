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
  ]<pEoRiC>
]<EoRiC>

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

== Properties of Complex Numbers
#section(definition, subtitle: [Purely Imaginary Numbers])[
  A complex number $z$ is called a #concept[purely imaginary number] if its real part is zero, that is, $ Re(z) = 0. $
]

#section(corollary, subtitle: [Re and Im Function])[
  The real part and the imaginary part of a complex number $z$ can be expressed in terms of $z$ and its complex conjugate as follows:
  $
    Re(z) = (z + dash(z))/2 "and" Im(z) = (z - dash(z))/(2 i).
  $
]

#section(corollary, subtitle: [Conjugate, Real, Purely Imaginary])[
  If a complex number $z$ has the following property:
  $
    z = -dash(z),
  $
  then it is a purely imaginary number.\
  If a complex number $z$ has the following property:
  $
    z = dash(z),
  $
  then it is a real number.
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
    #align(right)[$qed$]
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
    #align(right)[$qed$]
  ]
]<realfield>

#section(theorem, subtitle: [Complex Field])[
  Now, we can formally restate #sref(theorem.title, <complexfield>) as follows: The set of complex numbers $CC$ with the operations of addition and multiplication defined in #sref(definition.title, <complexops>) forms a #concept[field].
]
The proof of this theorem follows the same idea as the proof for #sref(theorem.title, <realfield>).

#pagebreak()
== Isomorphisms
Two sets composed of very different mathematical objects might be _structurally similar_ to each other to a point that an theorem proven in one can be directly applied to the other. Identifying this _similarity_ is particularly useful, as it allows us to freely switch different perspectives and apply the tools we have in one to another. This is the motivation behind the concept of #concept[isomorphism].

#section(definition, subtitle: [Isomorphisms])[
  An #concept[isomorphism] is a *structure-preserving bijection* between two *structures*. If such an isomorphism exists between two structures, we say that these two structures are #concept[isomorphic] to each other.\
]

#section(definition, subtitle: [Isomorphism between Algebraic Structures])[
  Let $A$ and $B$ be two algebraic structures of the same type (for example, two groups, or two rings). An *isomorphism* between $A$ and $B$ is a bijection $f: A mapsto B$ such that for all elements $a_1, a_2 in A$ and for all binary operation $dot_A$ defined on $A$, we have
  $
    f(a_1 dot_A a_2) = f(a_1) dot_B f(a_2),
  $
  where $dot_B$ is the corresponding binary operation defined on $B$.
]

#section(theorem, subtitle: [Isomorphism between $RR$ and $R$])[
  Now we can formally define the meaning of _structural equivalence_ in #sref(theorem.title, <EoRiC>) as follows: The *field* of real numbers $RR$ is isomorphic to the *field* form by complex numbers of the form $(x, 0)$, where $x in RR$.
  #section(proof)[
    The proof is surprisingly simple and is already outlined in #sref(proof.title, <pEoRiC>). One only needs to formally reformulate the proof in #sref(proof.title, <pEoRiC>) using the definition of isomorphism between algebraic structures.\
    Hence, we can conclude that $RR$ and $R$ are isomorphic to each other.
  ]
]

#pagebreak()
= Vector Spaces
== Structure of Vector Spaces
#section(definition, subtitle: [Vector Spaces])[
  A #concept[vector space] over a field $F$ is a set $V$ together with two operations, called *vector addition* and *scalar multiplication*, such that:
  + $V$ and $+$, the *vector addition*, together form an *Abelian group*, with the *additive identity* denoted by $0$.
  + The *scalar multiplication* is a function $F times V mapsto V$ that takes a scalar $a in F$ and a vector $v in V$ and produces a new vector $a v in V$ that satisfies the following properties:
    - *Closure*: For all $a in F$ and $v in V$, we have $a v in V$.
    - *Associativity*: For all $a, b in F$ and $v in V$, we have $(a b) v = a (b v)$.
    - *Identity*: For all $v in V$, we have $1 v = v$, where $1$ is the *multiplicative identity* in $F$.
    - *Distributive Laws*: For all $a, b in F$ and $u, v in V$, we have
      + $a (u + v) = a u + a v$
      + $(a + b) v = a v + b v$
]

#section(definition, subtitle: [Linear Combination])[
  A #concept[linear combination] of a set of vectors $S subset.eq V$ is a vector that can be expressed as *a finite sum* of scalar multiples of vectors in $S$. That is, a vector $v in V$ is a linear combination of $S$ if there exist scalars $lambda^1, dots.c, lambda^n in F$ and vectors $s_1, dots.c , s_n in S$ such that
  $
    v = sum_(i = 1)^n lambda^i s_i.
  $
]

#section(definition, subtitle: [Span])[
  The #concept[span] of a set of vectors $S subset.eq V$ is the set of all linear combinations of $S$. That is, the span of $S$ is defined as
  $
    "span"_F (S) := {sum_(i = 1)^n lambda^i s_i: n in NN, lambda^1, dots.c, lambda^n in F, s_1, dots.c , s_n in S}.
  $
]

#section(corollary)[
  The span of a set of vectors $S$ always contains the zero vector.
]

#section(definition, subtitle: [Linear Independence])[
  A set of vectors $S subset.eq V$ is said to be #concept[linear independent] if the only linear combination of $S$ that equals the zero vector is the *trivial linear combination*, that is, the linear combination where all scalars are zero. Formally, $S$ is linear independent if for any scalars $lambda^1, dots.c, lambda^n in F$ and vectors $s_1, dots.c , s_n in S$, we have
  $
    sum_(i = 1)^n lambda^i s_i = 0 <=> lambda^1 = lambda^2 = ... = lambda^n = 0.
  $
]

#pagebreak()

#section(definition, subtitle: [Basis])[
  A #concept[basis] of a vector space $V$ is an *ordered list* of vectors $B subset.eq V$ that is both *linearly independent* and *spans* $V$. That is, $B$ is a basis of $V$ if
  + $B$ is linear independent.
  + $"span"(B)$ = V.
]

#section(definition, subtitle: [Subspace])[
  A #concept[subspace] of a vector space $V$ is a subset $W subset.eq V$ that is itself a vector space with the same field under the same operations of vector addition and scalar multiplication defined on $V$.
]

#section(theorem, subtitle: [Subspace Test])[
  A subset $W subset.eq V$ is a subspace of a vector space $V$ if and only if for all $u, v in W$ and $a in F$, we have
  $
    a u + v in W.
  $
  #section(proof)[
    Let's first show that $(W,+)$ is an Abelian group.
    + *Closure*: Let $a = 1$, this means that for all $u, v in W$, $u + w in W$. This implies that $W$ is closed under vector addition.
    + *Associativity*: Since $W subset.eq V$ and $(V,+)$ is an Abelian group, we have for all $u, v, w in W$, $(u + v) + w = u + (v + w)$.
    + *Identity*: Let $a = -1$ and $u in W$. Since $-1 u + u = 0 in W$, $W$ contains the additive identity.
    + *Inverse*: Let $a = -1$ and $v = 0$. Since $-1 u + 0 = -u in W$, $W$ contains the additive inverse of each of its elements.
    + *Commutativity*: Since $W subset.eq V$ and $(V,+)$ is an Abelian group, we have for all $u, v in W$, $u + v = v + u$.
    Then, let's show that the scalar multiplication on $W$ satisfies the properties of scalar multiplication on a vector space.
    + *Closure*: Let $v = 0$, then for all $a in F$ and $u in W$, we have $a u + 0 = a u in W$. This implies that $W$ is closed under scalar multiplication.
    + *Associativity*, *Identity*, and *Distributive Laws*: Since $W subset.eq V$ and the scalar multiplication on $V$ satisfies these properties, we have for all $a, b in F$ and $u, v in W$, $(a b) u = a (b u)$, $1 u = u$, $a (u + v) = a u + a v$, and $(a + b) v = a v + b v$.

    This shows that if for all $u, v in W$ and $a in F$, we have $a u + v in W$, then $W$ is a subspace of $V$.

    Now, let's show the converse. If $W$ is a subspace of $V$, then $W$ is closed under vector addition and scalar multiplication. Hence, for all $u, v in W$ and $a in F$, we have $a u + v in W$.
    #align(right)[$qed$]
  ]
]

#pagebreak()

#section(theorem, subtitle: [Intersection of Subspaces])[
  The intersection of any collection of subspaces of a vector space $V$ is also a subspace of $V$.
  #section(proof)[
    Let $S$ be a collection of subspaces of $V$ and let $W = inter.big_(U in S) U$. We need to show that $W$ is a subspace of $V$.\
    Let $u, v in W$ and $a in F$. Since $u, v in W$, we have for all $U in S$, $u, v in U$.\
    Since each $U$ is a subspace of $V$, we have for all $U in S$, $a u + v in U$. Hence, we have for all $U in S$, $a u + v in U$, which implies that $a u + v in W$. This shows that $W$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Span is a Subspace])[
  Let $W$ be a subset of a vector space $V$. Then, the span of $W$ is a subspace of $V$.
  #section(proof)[
    Let $u, v in "span"(W)$ and $a in F$. Since $u, v in "span"(W)$, we have that there exist scalars $lambda^1, dots.c, lambda^n in F$ and vectors $s_1, dots.c , s_n in W$ such that
    $
      u = sum_(i = 1)^n lambda^i s_i.
    $
    Similarly, there exist scalars $mu^1, dots.c, mu^m in F$ and vectors $t_1, dots.c , t_m in W$ such that
    $
      v = sum_(j = 1)^m mu^j t_j.
    $
    Hence, we have
    $
      a u + v = a sum_(i = 1)^n lambda^i s_i + sum_(j = 1)^m mu^j t_j = sum_(i = 1)^n (a lambda^i) s_i + sum_(j = 1)^m mu^j t_j,
    $
    which is a linear combination of vectors in $W$. This shows that $a u + v in "span"(W)$, which implies that $"span"(W)$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Span of a Subspace])[
  The span of a subspace $W$ of a vector space $V$ is equal to $W$ itself, that is, $"span"(W) = W$.
  #section(proof)[
    Since $W$ is a subspace of $V$, it is closed under linear combinations. Hence, we have $"span"(W) subset.eq W$. On the other hand, since $W subset.eq W$, we have $W subset.eq "span"(W)$. This shows that $"span"(W) = W$.
    #align(right)[$qed$]
  ]
]

#pagebreak()

#section(theorem, subtitle: [Span of Subsets])[
  Let $W$ be a subset of a vector space $V$. Then, the span of $W$ is the smallest subspace of $V$ that contains $W$. In other words, let $S$ be the collection of all subspaces of $V$ that contain $W$, then
  $
    "span"(W) = inter.big_(U in S) U.
  $
  #section(proof)[
    Let's start by first showing that for any $U in S$,
    $
      "span"(W) subset.eq U.
    $
    Since $W subset.eq U$, we have that any linear combination of vectors in $W$ is also a linear combination of vectors in $U$. Hence, we have $"span"(W) subset.eq "span"(U)$, but since $U$ is a subspace of $V$, we have $"span"(U) = U$. This shows that $"span"(W) subset.eq U$ for any $U in S$. Therefore,
    $ "span"(W) subset.eq inter.big_(U in S) U. $

    However, since $"span"(W)$ is a subspace of $V$ that contains $W$, we have $"span"(W) in S$. Hence, we have
    $
      inter.big_(U in S) U subset.eq "span"(W).
    $

    Thus, this shows that $"span"(W) = inter.big_(U in S) U$.
  ]
]

#section(definition, subtitle: [Linear Transformations])[
  Let $V$ and $W$ be vector spaces over a field $F$. A function $T: V mapsto W$ is called a #concept[linear transformation] if for all $u, v in V$ and $a in F$, we have
  $
    T(a u + v) = a T(u) + T(v).
  $
]

#section(definition, subtitle: [Isomorphism between Vector Spaces])[
  Let $V$ and $W$ be two vector spaces over the same field $F$. An *isomorphism* between $V$ and $W$ is a *bijective linear transformation* $T: V mapsto W$. If such an isomorphism exists, we say that $V$ and $W$ are #concept[isomorphic] to each other.
]


#pagebreak()
== Cartesian Space
#section(definition, subtitle: [n-tuples])[
  An #concept[n-tuple] is an ordered list of $n$ elements, where $n$ is a positive integer. An n-tuple, $x$ can be denoted by
  $
    x = vec(x^1, dots.v, x^n),
  $
  where $x^1, x^2, ..., x^n$ are the elements of the n-tuple.
]
#section(definition, subtitle: [Cartesian Spaces: n-tuples Vector Spaces])[
  Let $F$ be a field and let $n$ be a positive integer. The set of all n-tuples of elements in $F$, denoted by $F^n$, forms a vector space over $F$ with *addition* and *scalar multiplication* defined as follows:
  + *Addition*:\
    Let $x = vec(x^1, dots.v, x^n)$ and $y = vec(y^1, dots.v, y^n)$ be two n-tuples in $F^n$. Then, the sum of $x$ and $y$ is defined as
    $ x + y = vec(x^1, dots.v, x^n) + vec(y^1, dots.v, y^n) := vec(x^1 + y^1, dots.v, x^n + y^n). $
  + *Scalar Multiplication*:\
    Let $x = vec(x^1, dots.v, x^n)$ be an n-tuple in $F^n$ and let $lambda in F$ be a scalar. Then, the scalar multiplication of $a$ and $x$ is defined as
    $
      lambda x = lambda vec(x^1, dots.v, x^n) := vec(lambda x^1, dots.v, lambda x^n).
    $
  The zero vector in $F^n$ is the n-tuple where all components are zero, that is, $vec(0, dots.v, 0)$.
  #section(proof)[
    Since we are defining the addition and scalar multiplication component-wise, we can verify that the vector space axioms are satisfied by directly applying the corresponding properties of the field $F$ to each component of the n-tuples. Hence, we can conclude that $F^n$ is a vector space over $F$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Standard Basis])[
  Let $F^n$ be a vector space of n-tuples over a field $F$. Then, the set of n-tuples
  $
    frak(B) = {e_1 = vec(1, 0, dots.v, 0), e_2 = vec(0, 1, dots.v, 0), dots.c, e_n = vec(0, 0, dots.v, 1)}
  $
  is a basis of $F^n$, which is called the #concept[standard basis] of $F^n$.
  #section(proof)[
    Let's first show that $frak(B)$ is linear independent. Consider a linear combination of $frak(B)$ that equals the zero vector, that is,
    $
      sum_(i = 1)^n lambda^i e_i = 0.
    $
    But
    $
      sum_(i = 1)^n lambda^i e_i = vec(lambda^1, lambda^2, dots.v, lambda^n).
    $
    Hence, the only way for this linear combination to equal the zero vector is that $lambda^1 = lambda^2 = ... = lambda^n = 0$. This shows that $frak(B)$ is linear independent.

    Now, let's show that $frak(B)$ spans $F^n$. Consider an arbitrary n-tuple $x = vec(x^1, dots.v, x^n) in F^n$. We can write $x$ as a linear combination of the vectors in $frak(B)$ as follows:
    $
      x = sum_(i = 1)^n x^i e_i.
    $
    That is $F^n subset.eq "span"(frak(B))$. On the other hand, since $F^n$ is a vector space, it is closed under linear combinations. Hence, we have $"span"(frak(B)) subset.eq F^n$. This shows that $"span"(frak(B)) = F^n$.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Decomposition of Linear Transformations])[
  Let $V$ and $W$ be two Cartesian spaces over the same field $F$, that is, $V = F^m$ and $W = F^n$ for some positive integers $m$ and $n$, with standard basis ${cal(v)_1, dots.c, cal(v)_m}$ and ${cal(w)_1, dots.c, cal(w)_n}$ respectively. Consider a linear transformation $T: V mapsto W$, we have
  $
    T(v) = T(sum_(i = 1)^m v^i cal(v)_i) = sum_(i = 1)^m v^i T(cal(v)_i),
  $
  where $v^i in F$ is the $i$-th components of $v$ with respect to the standard basis of $V$. Now, since $T(cal(v)_i)$ is a vector in $W$, we can write it as a linear combination of the standard basis of $W$ as follows:
  $
    T(cal(v)_i) = sum_(j = 1)^n T_i^j cal(w)_j,
  $
  where $T_i^j in F$ is the $j$-th component of $T(cal(v)_i)$ with respect to the standard basis of $W$. Hence, we have
  $
    T(v) = sum_(i = 1)^m v^i (sum_(j = 1)^n T_i^j cal(w)_j) = sum_(j = 1)^n sum_(i = 1)^m T_i^j v^i cal(w)_j.
  $
  This means that *any linear transformation* between Cartesian spaces *can define and be defined by a set of scalars* $T_i^j in F$ for $i = 1, dots.c, m$ and $j = 1, dots.c, n$.
]<matrixrep>

#section(convention, subtitle: [Matrix Representation of Linear Transformations])[
  In order to conveniently represent a linear transformation between Cartesian spaces, we can arrange the scalars $T_i^j$ into a table like object called #concept[matrix] as follows:
  $
    bold(T) = mat(
      T_1^1, T_2^1, dots.c, T_m^1;
      T_1^2, T_2^2, dots.c, T_m^2;
      dots.v, dots.v, dots.down, dots.v;
      T_1^n, T_2^n, dots.c, T_m^n
    )
  $
  Applying the linear transformation $T$ to a vector $v in V$ is represented as follows:
  $
    T(v) = bold(T) v = mat(
      T_1^1, T_2^1, dots.c, T_m^1;
      T_1^2, T_2^2, dots.c, T_m^2;
      dots.v, dots.v, dots.down, dots.v;
      T_1^n, T_2^n, dots.c, T_m^n
    ) vec(v^1, v^2, dots.v, v^m) = vec(sum_(i = 1)^m T_i^1 v^i, sum_(i = 1)^m T_i^2 v^i, dots.v, sum_(i = 1)^m T_i^n v^i)
    = sum_(j = 1)^n sum_(i = 1)^m T_i^j v^i cal(w)_j.
  $
  In particular, if the matrix $bold(T)$ has $n$ rows and $m$ columns, we say that $bold(T)$ is an *n by m matrix* or *$n times m$ matrix*.
]<matrixconv>

The operation of applying a linear transformation involves putting a matrix and a vector side by side and performing a series of multiplications and additions to produce a new vector. This operation is called #concept[matrix multiplication]. We shall formally define this operation.

#section(definition, subtitle: [Matrix Multiplication I])[
  Let $T: F^m mapsto F^n$ be a linear transformation represented by the matrix
  $
    bold(T) = mat(
      T_1^1, T_2^1, dots.c, T_m^1;
      T_1^2, T_2^2, dots.c, T_m^2;
      dots.v, dots.v, dots.down, dots.v;
      T_1^n, T_2^n, dots.c, T_m^n
    )
  $
  and let $v in F^m$ be a vector represented by the n-tuple
  $
    v = vec(v^1, v^2, dots.v, v^m).
  $
  Then, the #concept[matrix multiplication] of $T$ and $v$ is defined as
  $
    bold(T) v := vec(sum_(i = 1)^m T_i^1 v^i, sum_(i = 1)^m T_i^2 v^i, dots.v, sum_(i = 1)^m T_i^n v^i).
  $
]

#section(theorem, subtitle: [Matrices and Linear Transformations])[
  Let $cal(T)$ be the set of all linear transformations from $F^m$ to $F^n$ and let $M_(n times m)(F)$ represents all linear transformations from $F^m$ to $F^n$ defined by $n$ by $m$ matrices with entries in $F$. Then, there is
  $
    cal(T) = M_(n times m)(F).
  $
  #section(proof)[
    Let $T: F^m mapsto F^n$ be a linear transformation. Then, we can represent $T$ by a matrix $bold(T)$ as shown in #sref(corollary.title, <matrixrep>) and #sref(convention.title, <matrixconv>). Hence, we have $T in M_(n times m)(F)$, which implies that $cal(T) subset.eq M_(n times m)(F)$.

    Now, let $bold(T)$ be an arbitrary $n$ by $m$ matrix with entries in $F$. Again, as shown in #sref(corollary.title, <matrixrep>) and #sref(convention.title, <matrixconv>) we can define a linear transformation $T: F^m mapsto F^n$ by
    $
      T(v) = bold(T) v
    $
    for all $v in F^m$. This shows that for any matrix in $M_(n times m)(F)$, there is a corresponding linear transformation in $cal(T)$. Hence, we have $M_(n times m)(F) subset.eq cal(T)$.

    Therefore, we can conclude that $cal(T) = M_(n times m)(F)$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Matrices are Vectors])[
  Let $M_(n times m)(F)$ be the set of all $n$ by $m$ matrices with entries in a field $F$. Then, $M_(n times m)(F)$ is a vector space over $F$ with *addition* and *scalar multiplication* defined as follows:
  $
    bold(A) + bold(B) = mat(
      A_1^1, A_2^1, dots.c, A_m^1;
      A_1^2, A_2^2, dots.c, A_m^2;
      dots.v, dots.v, dots.down, dots.v;
      A_1^n, A_2^n, dots.c, A_m^n
    ) + mat(
      B_1^1, B_2^1, dots.c, B_m^1;
      B_1^2, B_2^2, dots.c, B_m^2;
      dots.v, dots.v, dots.down, dots.v;
      B_1^n, B_2^n, dots.c, B_m^n
    )
    := mat(
      A_1^1 + B_1^1, A_2^1 + B_2^1, dots.c, A_m^1 + B_m^1;
      A_1^2 + B_1^2, A_2^2 + B_2^2, dots.c, A_m^2 + B_m^2;
      dots.v, dots.v, dots.down, dots.v;
      A_1^n + B_1^n, A_2^n + B_2^n, dots.c, A_m^n + B_m^n
    ),
  $
  $
    a bold(A) = a mat(
      A_1^1, A_2^1, dots.c, A_m^1;
      A_1^2, A_2^2, dots.c, A_m^2;
      dots.v, dots.v, dots.down, dots.v;
      A_1^n, A_2^n, dots.c, A_m^n
    ) := mat(
      a A_1^1, a A_2^1, dots.c, a A_m^1;
      a A_1^2, a A_2^2, dots.c, a A_m^2;
      dots.v, dots.v, dots.down, dots.v;
      a A_1^n, a A_2^n, dots.c, a A_m^n
    ).
  $
  #section(proof)[
    It is straightforward to verify that the vector space axioms are satisfied by directly applying the corresponding properties of the field $F$ to each component of the matrices. Hence, we can conclude that $M_(n times m)(F)$ is a vector space over $F$.
    #align(right)[$qed$]
  ]
]

In some cases, we need to perform multiple linear transformations in a sequence. For example, let $T: F^m mapsto F^n$ and $S: F^n mapsto F^p$ be two linear transformations, we might want to apply $T$ to a vector $v in F^m$ first and then apply $S$ to the result, that is,
$
  S(T(v)) = S(vec(sum_(i = 1)^m T_i^1 v^i, sum_(i = 1)^m T_i^2 v^i, dots.v, sum_(i = 1)^m T_i^n v^i))
  = vec(sum_(j = 1)^n sum_(i = 1)^m S_j^1 T_i^j v^i, sum_(j = 1)^n sum_(i = 1)^m S_j^2 T_i^j v^i, dots.v, sum_(j = 1)^n sum_(i = 1)^m S_j^p T_i^j v^i)
$
Notice how we can first compute the sum for the index $j$, that is
$
  S(T(v)) = vec(sum_(i = 1)^m (sum_(j = 1)^n S_j^1 T_i^j) v^i, sum_(i = 1)^m (sum_(j = 1)^n S_j^2 T_i^j) v^i, dots.v, sum_(i = 1)^m (sum_(j = 1)^n S_j^p T_i^j) v^i).
$
Since the result of the sum for the index $j$ is a scalar, $S(T(v))$ uniquely defines a linear transformation $R: F^m mapsto F^p$ by the matrix $bold(R)$:
$
  bold(R) = mat(
    sum_(j = 1)^n S_j^1 T_1^j, sum_(j = 1)^n S_j^1 T_2^j, dots.c, sum_(j = 1)^n S_j^1 T_m^j;
    sum_(j = 1)^n S_j^2 T_1^j, sum_(j = 1)^n S_j^2 T_2^j, dots.c, sum_(j = 1)^n S_j^2 T_m^j;
    dots.v, dots.v, dots.down, dots.v;
    sum_(j = 1)^n S_j^p T_1^j, sum_(j = 1)^n S_j^p T_2^j, dots.c, sum_(j = 1)^n S_j^p T_m^j
  ).
$
This is particularly convenient, as now we have
$
  S(T(v)) = bold(S) (bold(T) v) = bold(R) v.
$
Hence, for simplicity, we will denote the matrix $bold(R)$ as a *product* of the matrices $bold(S)$ and $bold(T)$ to mimic the associativity. That is,
$
  bold(R) = bold(S) bold(T).
$
In other words,
$
  bold(S) (bold(T) v) = (bold(S) bold(T)) v = bold(R) v.
$
#section(definition, subtitle: [Matrix Multiplication II])[
  Let $bold(S)$ be an $p$ by $n$ matrix and let $bold(T)$ be an $n$ by $m$ matrix. Then, the #concept[matrix multiplication] of $bold(S)$ and $bold(T)$ is defined as the $p$ by $m$ matrix
  $
    bold(S) bold(T) = mat(
      S_1^1, dots.c, S_n^1;
      dots.v, dots.down, dots.v;
      S_1^p, dots.c, S_n^p
    ) mat(
      T_1^1, dots.c, T_m^1;
      dots.v, dots.down, dots.v;
      T_1^n, dots.c, T_m^n
    ) :=
    mat(
      sum_(j = 1)^n S_j^1 T_1^j, dots.c, sum_(j = 1)^n S_j^1 T_m^j;
      dots.v, dots.down, dots.v;
      sum_(j = 1)^n S_j^p T_1^j, dots.c, sum_(j = 1)^n S_j^p T_m^j
    ).
  $
]

#section(corollary, subtitle: [Associativity of Matrix Multiplication])[
  Let $bold(R)$, $bold(S)$, and $bold(T)$ be matrices such that the products $bold(R) bold(S)$ and $bold(S) bold(T)$ are defined. Then, we have
  $
    bold(R) (bold(S) bold(T)) = (bold(R) bold(S)) bold(T).
  $
  #section(proof)[
    Applying $bold(R) (bold(S) bold(T))$ on an arbitrary vector $v$, since $(bold(S) bold(T)) v = bold(S) (bold(T) v)$ we have
    $
      bold(R) (bold(S) bold(T)) v = bold(R) (bold(S) (bold(T) v)),
    $
    but $bold(T) v$ is just a vector, hence we have
    $
      bold(R) (bold(S) (bold(T) v)) = (bold(R) bold(S)) (bold(T) v) = (bold(R) bold(S)) bold(T) v.
    $
    This shows that $bold(R) (bold(S) bold(T)) = (bold(R) bold(S)) bold(T)$.
    #align(right)[$qed$]
  ]
]

#pagebreak()
== Linear Equations
#section(definition, subtitle: [Linear Equations])[
  A #concept[linear equation] is an equation of the form
  $
    a_1 x_1 + a_2 x_2 + dots.c + a_n x_n = b,
  $
  where $a_1, a_2, dots.c, a_n$ and $b$ are constants and $x_1, x_2, dots.c, x_n$ are variables.
]

#section(corollary, subtitle: [Matrix Form of Linear Equations])[
  A system of linear equations can be represented in matrix form as follows:
  $
    bold(A) x = bold(A) vec(x^1, x^2, dots.v, x^n) = vec(b^1, b^2, dots.v, b^m) = b.
  $
  where $bold(A)$ is an $m$ by $n$ matrix of coefficients, $x$ is a vector of variables, and $b$ is a vector of constants.
]

