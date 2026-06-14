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

#let pyglue(n, c) = {}

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

#section(theorem, subtitle: [Linear Dependent Vectors])[
  Let $S$ be a set of vectors in a vector space $V$. Let $W$ be the *largest subset* of $S$ that is linear independent. Then, every vector in $S$ can be expressed as a linear combination of vectors in $W$.
  #section(proof)[
    Let $W = {w_1, w_2, dots.c, w_n}$, let $s in S$ be an arbitrary vector in $S$ that is not in $W$. Since $W$ is the largest subset of $S$ that is linear independent, we have that $W union {s}$ is linear dependent. Hence, there exist scalars $lambda^1, dots.c, lambda^n, lambda^(n+1) in F$ such that
    $
      sum_(i = 1)^n lambda^i w_i + lambda^(n+1) s = 0.
    $
    If $lambda^(n+1) = 0$, then the equation above reduces to
    $
      sum_(i = 1)^n lambda^i w_i = 0,
    $
    since $W$ is linear independent, we have $lambda^1 = lambda^2 = ... = lambda^n = 0$, which contradicts the assumption that $W union {s}$ is linear dependent. Hence, we have $lambda^(n+1) != 0$. This means that we can rearrange the equation above to express $s$ as a linear combination of vectors in $W$, that is,
    $
      s = - sum_(i = 1)^n lambda^i/lambda^(n+1) w_i.
    $
    #align(right)[$qed$]
  ]
]

#section(definition, subtitle: [Basis])[
  A #concept[basis] of a vector space $V$ is an *set* of vectors $B subset.eq V$ that is both *linearly independent* and *spans* $V$. That is, $B$ is a basis of $V$ if
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

#section(theorem, subtitle: [Intersection of Subspaces])[
  The intersection of any collection of subspaces of a vector space $V$ is also a subspace of $V$.
  #section(proof)[
    Let $S$ be a collection of subspaces of $V$ and let $W = inter.big_(U in S) U$. We need to show that $W$ is a subspace of $V$.\
    Let $u, v in W$ and $a in F$. Since $u, v in W$, we have for all $U in S$, $u, v in U$.\
    Since each $U$ is a subspace of $V$, we have for all $U in S$, $a u + v in U$. Hence, we have for all $U in S$, $a u + v in U$, which implies that $a u + v in W$. This shows that $W$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]<IntersectionSubspace>


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

#section(theorem, subtitle: [Span of a Vector Space])[
  The span of a vector space $V$ is equal to $V$ itself, that is, $"span"(V) = V$.
  #section(proof)[
    Since $V$ is closed under linear combinations. Hence, we have $"span"(V) subset.eq V$. On the other hand, since $V subset.eq V$, we have $V subset.eq "span"(V)$. This shows that $"span"(V) = V$.
    #align(right)[$qed$]
  ]
]

#section(definition, subtitle: [Sum of Subspaces])[
  Let $U$ and $W$ be two subspaces of a vector space $V$. The #concept[sum] of $U$ and $W$, denoted by $U + W$, is defined as the set of all vectors that can be expressed as the sum of a vector in $U$ and a vector in $W$. That is,
  $
    U + W := {u + w: u in U, w in W}.
  $
]

#section(theorem, subtitle: [Sum of Subspaces is a Subspace])[
  Let $U$ and $W$ be two subspaces of a vector space $V$. Then, the sum of $U$ and $W$ is also a subspace of $V$.
  #section(proof)[
    Let $u_1 + w_1, u_2 + w_2 in U + W$ and let $a in F$. Since $u_1, u_2 in U$ and $w_1, w_2 in W$, we have that $a u_1 + u_2 in U$ and $a w_1 + w_2 in W$. Hence, we have
    $
      a (u_1 + w_1) + (u_2 + w_2) = (a u_1 + u_2) + (a w_1 + w_2),
    $
    which is an element in $U + W$. This shows that $U + W$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Sum of Subspaces is the Span of Union])[
  Let $U$ and $W$ be two subspaces of a vector space $V$. Then,
  $
    U + W = "span"(U union W).
  $
  #section(proof)[
    For any $u in U$ and $w in W$, we have $u + w in "span"(U union W)$. Hence, $U + W subset.eq "span"(U union W)$.\
    On the other hand, for any $v in "span"(U union W)$, $v$ must be a linear combination of vectors in $U union W$. Hence, we have
    $
      v = sum_(i = 1)^n lambda^i u_i + sum_(j = 1)^m mu^j w_j,
    $
    where $lambda^i$ and $mu^j$ are scalars in $F$, $u_i in U$ for all $i$, and $w_j in W$ for all $j$. But $sum_(i = 1)^n lambda^i u_i in U$ and $sum_(j = 1)^m mu^j w_j in W$. Hence, $v in U + W$. Therefore, $"span"(U union W) subset.eq U + W$.\
    Thus, $U + W = "span"(U union W)$.
    #align(right)[$qed$]
  ]
]

#section(definition, subtitle: [Direct Sum])[
  The #concept[direct sum] of two subspaces $U$ and $W$ of a vector space $V$, denoted by $U plus.o W$, is defined if and only if $U inter W = {0}$, and in this case, it is defined as the sum of $U$ and $W$, that is,
  $
    U plus.o W = U + W <=> U inter W = {0}.
  $
]

#section(theorem, subtitle: [Span of Subsets is the Smallest Subspace])[
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

#section(corollary, subtitle: [Isomorphism Preserves Linear Independence])[
  Let $V$ and $W$ be two vector spaces over the same field $F$. If there is an isomorphism $T: V mapsto W$ between $V$ and $W$, then for any set of vectors $S subset.eq V$, we have that $S$ is linear independent if and only if $T(S) := {T(s): s in S}$ is linear independent.
]

#section(theorem, subtitle: [Condition of Being Injective])[
  Let $V$ and $W$ be two vector spaces over the same field $F$. A linear transformation $T: V mapsto W$ is injective if and only if *it only maps the zero vector in $V$ to the zero vector in $W$*, that is, $T(v) = 0 <=> v = 0$.
  #section(proof)[
    Let $T$ be an injective linear transformation between $V$ and $W$, if there is a $c != 0$ such that $T(c) = 0$. Then, for any $v in V$, we have
    $
      T(v + c) = T(v) + T(c) = T(v) + 0 = T(v).
    $
    This means that $T$ is not injective, which contradicts the assumption. Hence, if $T$ is injective, we have $T(v) = 0 <=> v = 0$.

    On the other hand, if $T$ is a linear transformation such that $T(v) = 0 <=> v = 0$, if there is a pair of vector $v$ and $w$ such that $T(v) = T(w)$ but $v != w$. Then, we have
    $
      T(v - w) = T(v) - T(w) = 0.
    $
    However, since $T(v) = 0 <=> v = 0$, we have $v - w = 0$, which implies that $v = w$. This contradicts the assumption that $v != w$. Hence, $T$ is injective.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Condition of Being Isomorphism])[
  Let $V$ and $W$ be two vector spaces over the same field $F$. A linear transformation $T: V mapsto W$ is an isomorphism if and only if *it only maps the zero vector in $V$ to the zero vector in $W$* and it is *surjective*. That is,
  + $T(v) = 0 <=> v = 0$.
  + For all $w in W$, there exists a $v in V$ such that $T(v) = w$.
]<ConBeIso>

#section(theorem, subtitle: [The Kernel of a Linear Transformation])[
  Let $T$ be a linear transformation between two vector spaces $V$ and $W$ over the same field $F$. The set of all vectors in $V$ that are mapped to the zero vector in $W$ by $T$, called #concept[kernel] or #concept[null space] of $T$, denoted by $ker(T)$, is a subspace of $V$.
  #section(proof)[
    Let $a in F$ and $u, v in ker(T)$, we shall show that $a u + v in ker(T)$. Since $u, v in ker(T)$, we have $T(u) = T(v) = 0$. Hence, we have
    $
      T(a u + v) = a T(u) + T(v) = a 0 + 0 = 0,
    $
    that is, $a u + v in ker(T)$. This shows that $ker(T)$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [The Image of a Linear Transformation])[
  Let $T$ be a linear transformation between two vector spaces $V$ and $W$ over the same field $F$. The set of all vectors in $W$ that are mapped to by some vector in $V$ by $T$, called #concept[image] or #concept[range] of $T$, denoted by $im(T)$, is a subspace of $W$.
  #section(proof)[
    Let $a in F$ and $u, v in im(T)$, we shall show that $a u + v in im(T)$. Since $u, v in im(T)$, there exist vectors $x, y in V$ such that $T(x) = u$ and $T(y) = v$. Hence, we have
    $
      T(a x + y) = a T(x) + T(y) = a u + v,
    $
    that is, $a u + v in im(T)$. This shows that $im(T)$ is a subspace of $W$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Linear Transformations between Isomorphic Vector Spaces])[
  Let $U$, $V$, and $W$ be two vector spaces over the same field $F$. If there is an isomorphism $I: V mapsto W$ between $V$ and $W$, then for any linear transformation $T_V: V mapsto U$, there is a unique linear transformation $T_W: W mapsto U$ such that for all $v in V$, we have
  $
    T_V (v) = T_W compose I (v).
  $
  #section(proof)[
    Let's define $T_W: W mapsto U$ as follows: for all $w in W$, we have
    $
      T_W (w) := T_V compose I^(-1)(w).
    $
    Hence, for all $v in V$, we have
    $
      T_W compose I(v) = T_V compose I^(-1) compose I(v) = T_V (v).
    $
    We will omit the proof that $T_W$ is a linear transformation, which can be easily verified by directly applying the definition of linear transformation and the fact that $I$ is an isomorphism.\
    Finally, let's show that $T_W$ is unique. Let $T_W^'$ be another linear transformation such that for all $v in V$, we have
    $
      T_V (v) = T_W^' compose I (v).
    $
    Since for all $v in V$, there is a unique $w in W$ such that $I(v) = w$, we have
    $
      T_V (v) = T_V compose I^(-1) (w) = T_W compose I compose I^(-1) (w) = T_W^' (w) = T_W (w).
    $
    Hence, this shows that $T_W$ is unique.
    #align(right)[$qed$]
  ]
]<LinTranIsoVecSpace>



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
  Let $F^n$ be a vector space of n-tuples over a field $F$. Then, the *ordered list* of n-tuples
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

#section(corollary, subtitle: [Alternative Form of Representing Matrices])[
  Let $bold(T)$ be an $n$ by $m$ matrix. We can also represent $bold(T)$ as follows:
  $
    bold(T) = mat(
      |, , |;
      T_1, dots.c, T_m;
      |, , |
    ),
  $
  where $T_1, dots.c, T_m$ are the columns of $bold(T)$. On the other hand, we can also represent $bold(T)$ as follows:
  $
    bold(T) = mat(
      dash.em, T^1, dash.em;
      , dots.v, ;
      dash.em, T^n, dash.em;
    ),
  $
  where $T^1, dots.c, T^n$ are the rows of $bold(T)$.

  We can treat $T_1, dots.c, T_m$ as vectors in $F^n$ and $T^1, dots.c, T^n$ as vectors in $F^m$ or a $n times 1$ and a $m times 1$ matrix respectively depending on the context.
  If we treat them as matrices, then we can rewrite the matrix multiplication of $bold(S)$ and $bold(T)$ as follows:
  $
    bold(S) bold(T) = mat(
      dash.em, S^1, dash.em;
      , dots.v, ;
      dash.em, S^p, dash.em;
    ) mat(
      |, , |;
      T_1, dots.c, T_m;
      |, , |
    ) = mat(
      S^1 T_1, dots.c, S^1 T_m;
      dots.v, dots.down, dots.v;
      S^p T_1, dots.c, S^p T_m;
    ),
  $
  where
  $
    S^i T_j = mat(S^i_1, dots.c, S^i_n) mat(T^1_j; dots.v; T^n_j) = sum_(k = 1)^n S_k^i T_j^k.
  $
  If we treat them as vectors, then we can rewrite the matrix multiplication of $bold(S)$ and $bold(T)$ as follows:
  $
    bold(S) bold(T) = bold(S) mat(
      |, , |;
      T_1, dots.c, T_m;
      |, , |
    ) = mat(
      |, , |;
      bold(S) (T_1), dots.c, bold(S) (T_m);
      |, , |
    ).
  $
]

#section(definition, subtitle: [Identity Matrix])[
  The #concept[identity matrix] of size $n$ is the $n$ by $n$ matrix
  $
    bold(I)_n = mat(
      1, 0, dots.c, 0;
      0, 1, dots.c, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.c, 1
    ).
  $
]

#section(corollary, subtitle: [Identity Matrix as a Linear Transformation])[
  The identity matrix $bold(I)_n$ represents the identity linear transformation $id: F^n mapsto F^n$ defined by $id(v) = v$ for all $v in F^n$. Since
  $
    bold(I)_n v = mat(
      1, 0, dots.c, 0;
      0, 1, dots.c, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots.c, 1
    ) vec(v^1, v^2, dots.v, v^n) = vec(v^1, v^2, dots.v, v^n) = v,
  $
  for all $v in F^n$.
]

#section(definition, subtitle: [Inverse of a Matrix])[
  Let $bold(A)$ be a matrix. If there exists a matrix $bold(B)$ such that
  $
    bold(A) bold(B) = bold(B) bold(A) = bold(I).
  $
  then we say that $bold(B)$ is the #concept[inverse] of $bold(A)$ and we denote it by $bold(A)^(-1)$.
]

#section(corollary, subtitle: [The Shape of an Invertible Matrix])[
  If $bold(T)$ is an invertible matrix, then $bold(T)$ must be a square matrix, that is, the number of rows and the number of columns of $bold(T)$ must be the same.
  #section(proof)[
    Since for $bold(T)$ to be invertible, there must exist a matrix $bold(T)^(-1)$ such that
    $
      bold(T) bold(T)^(-1) = bold(T)^(-1) bold(T) = bold(I),
    $
    the only way for this to hold is that $bold(T)$ and $bold(T)^(-1)$ are both square matrices of the same size. Hence, if $bold(T)$ is an invertible matrix, then $bold(T)$ must be a square matrix.
    #align(right)[$qed$]
  ]
]


#section(corollary, subtitle: [Invertible Matrix is an Isomorphism])[
  Let $bold(T)$ be an invertible matrix. Then, the linear transformation, $T$, represented by $bold(T)$ is an isomorphism.
  #section(proof)[
    Let $T: F^n mapsto F^n$ be the linear transformation represented by $bold(T)$. Since $bold(T)$ is invertible, there exists a matrix $bold(T)^(-1)$ such that
    $
      bold(T) bold(T)^(-1) v = bold(T)^(-1) bold(T) v = bold(I) v.
    $
    This shows that $T$ is a bijective linear transformation, hence an isomorphism.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Columns of an Invertible Matrix Are Independent])[
  Let $bold(T)$ be an invertible matrix. Then, the columns of $bold(T)$ are linearly independent.
  #section(proof)[
    Let $bold(T)$ be an invertible matrix and let $T: F^m mapsto F^n$ be the linear transformation represented by $bold(T)$. Since $bold(T)$ is invertible, $T$ is an isomorphism.\
    Let $T_1, dots.c, T_n$ be the columns of $bold(T)$. If there exist scalars $lambda^1, dots.c, lambda^n in F$, not all zero, such that
    $
      sum_(i = 1)^n lambda^i T_i = 0,
    $
    This means that
    $
      bold(T) vec(lambda^1, dots.v, lambda^n) = T (vec(lambda^1, dots.v, lambda^n)) = 0,
    $
    but this contradicts with the fact that $T$ is an isomorphism, which only maps the zero vector to the zero vector as shown in #sref(corollary.title, <ConBeIso>). Hence, the columns of $bold(T)$ are linearly independent.
    #align(right)[$qed$]
  ]
]<ColInMatrixIn>


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

#section(definition, subtitle: [Solution of Linear Equations])[
  A #concept[solution] of a system of linear equations is a vector $x$ that satisfies the equation $bold(A) x = b$.
]

#section(theorem, subtitle: [Existence of Solutions])[
  Let $bold(A)$ be an $m$ by $n$ matrix and let $b$ be a vector in $F^m$. Then, the system of linear equations $bold(A) x = b$ has a solution if and only if the vector $b$ is in the span of the columns of $bold(A)$.
  #section(proof)[
    Let $A_1, A_2, dots.c, A_n$ be the columns of $bold(A)$. Then, we can write
    $
      bold(A) x = mat(
        A^1_1, dots.c, A^1_n;
        dots.v, dots.down, dots.v;
        A^m_1, dots.c, A^m_n
      ) vec(x^1, dots.v, x^n) & = vec(sum_(i = 1)^n A^1_i x^i, dots.v, sum_(i = 1)^n A^m_i x^i) \
                              & = sum_(i = 1)^n x^i vec(|, A_i, |) \
                              & = sum_(i = 1)^n x^i A_i.
    $
    Therefore, the system of linear equations $bold(A) x = b$ has a solution if and only if there exist scalars $x^1, dots.c, x^n in F$ such that
    $
      sum_(i = 1)^n x^i A_i = b,
    $
    that is, if and only if $b$ is in the span of the columns of $bold(A)$.
    #align(right)[$qed$]
  ]<ColSpan>
]

#section(definition, subtitle: [Column Space])[
  Let $bold(A)$ be an $m$ by $n$ matrix. The #concept[column space] of $bold(A)$, denoted by $"colspace"(bold(A))$, is the span of the columns of $bold(A)$.
]

#section(definition, subtitle: [Homogeneous Linear Equations])[
  A system of linear equations is called #concept[homogeneous] if the vector of constants $b$ is the zero vector, that is, if the system can be written in the form $bold(A) x = 0.$
]

#section(corollary, subtitle: [Trivial Solution of Homogeneous Linear Equations])[
  A homogeneous system of linear equations always has at least one solution, which is the zero vector. This solution is called the #concept[trivial solution] of the homogeneous system.
]

#section(theorem, subtitle: [Nontrivial Solutions of Homogeneous Linear Equations I])[
  Let $bold(A)$ be an $m$ by $n$ matrix. Then, the homogeneous system of linear equations $bold(A) x = 0$ has a nontrivial solution if and only if the columns of $bold(A)$ are linearly dependent.
  #section(proof)[
    Let $A_1, A_2, dots.c, A_n$ be the columns of $bold(A)$. Then, as shown in #sref(proof.title, <ColSpan>) we can write
    $
      bold(A) x = sum_(i = 1)^n x^i A_i.
    $
    Therefore, the homogeneous system of linear equations $bold(A) x = 0$ has a nontrivial solution if and only if there exist scalars $x^1, dots.c, x^n in F$, not all zero, such that
    $
      sum_(i = 1)^n x^i A_i = 0,
    $
    that is, if and only if the columns of $bold(A)$ are linearly dependent.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Nontrivial Solutions of Homogeneous Linear Equations II])[
  Let $bold(A)$ be an $m$ by $n$ matrix. If the homogeneous system of linear equations $bold(A) x = 0$ has a nontrivial solution, then it has infinitely many solutions (suppose that the field $F$ has infinitely many scalars).
  #section(proof)[
    Let $x$ be a nontrivial solution of the homogeneous system of linear equations $bold(A) x = 0$. Then, for any scalar $a in F$, we have
    $
      bold(A) (a x) = a (bold(A) x) = a 0 = 0.
    $
    This shows that for any scalar $a in F$, $a x$ is also a solution of the homogeneous system of linear equations $bold(A) x = 0$. Since there are infinitely many scalars in $F$, we have infinitely many solutions of the homogeneous system of linear equations $bold(A) x = 0$.
    #align(right)[$qed$]
  ]
]<InfSol>
#pagebreak()

== Solving Linear Equations
A natural thought about solving a linear equation $bold(A) x = b$ is to multiply both sides of the equation by the inverse of $bold(A)$, that is,
$
               bold(A) x & = b \
  bold(A)^(-1) bold(A) x & = bold(A)^(-1) b \
               bold(I) x & = bold(A)^(-1) b \
                       x & = bold(A)^(-1) b.
$
However, the reality is that *not all matrices* have inverses. For instance,
$
  bold(A) = mat(
    1, 0;
    0, 0
  )
$
has no inverse, since for any matrix $bold(B) = mat(
  B_1^1, B_2^1;
  B_1^2, B_2^2
)$, we have
$
  bold(A) bold(B) = mat(
    1, 0;
    0, 0
  ) mat(
    B_1^1, B_2^1;
    B_1^2, B_2^2
  ) = mat(
    B_1^1, B_2^1;
    0, 0
  ).
$
It is also important to note that *the solutions of a system of linear equations might not be just numbers* (i.e. the solutions are not unique, as shown in #sref(theorem.title, <InfSol>)). For example, consider
$
  bold(A) x = mat(
    1, 2;
    0, 0;
  ) vec(x^1, x^2) = vec(3, 0).
$
The solution of this system of linear equations is the equation itself:
$
  x^1 + 2 x^2 = 3.
$
It could also be that *the solutions do not exist at all* (i.e. $b in.not "colspan"(A)$). For example, consider
$
  bold(A) x = mat(
    1, 2;
    0, 0;
  ) vec(x^1, x^2) = vec(3, 1).
$
Thus, before we actually tackle the problem of finding the solutions of a system of linear equations, we should first figure out what *a solution looks like*.\

Consider a general system of linear equations $bold(A) x = b$ where $bold(A)$ is an $m$ by $n$ matrix and $b$ is a vector in $F^m$. That is,
$
  bold(A) x = mat(
    A^1_1, dots.c, A^1_n;
    dots.v, dots.down, dots.v;
    A^m_1, dots.c, A^m_n
  ) vec(x^1, dots.v, x^n) = vec(b^1, dots.v, b^m).
$
If one were to imagine the process of solving this system of linear equations, one would intuitively think of attributing an equation to each variable and remove all other variables from that equations. However, in general, *there will be some variables that cannot be attributed with an equation*, as we have shown with examples above.\
Hence, let's split the variables into two groups: let the set $I_c$ contains the indices of the variables that *cannot be attributed with an equation* and let the set $I_r$ contains the indices of the rest of the variables.\
What we should *consider* as a #concept[solution] of the system of linear equations $bold(A) x = b$ is a *$m$ list of equations* of the following form:
$
  x^i = d^i - sum_(j in I_c) c^i_j x^j "or" 0 = 0
$
for $c^i_j, d^i in F$ and $i in I_r$.\
For instance, consider the system of linear equations
$
  bold(A) x = mat(
    1, 0, 3, 5, 0, 0;
    0, 1, 4, 0, 0, 0;
    0, 0, 0, 0, 0, 0;
    0, 0, 0, 0, 0, 1
  ) vec(x^1, x^2, x^3, x^4, x^5, x^6) = vec(6, 7, 0, 8).
$
It should be clear that variable $x^3$, $x^4$, and $x^5$ are the variables that cannot be attributed with an equation, hence we have $I_c = {3, 4, 5}$ and $I_r = {1, 2, 6}$.\
The solution of this system of linear equations is the following list of equations:
$
  cases(
    x^1 & = 6 - (3 x^3 + 5 x^4 + 0 x^5),
    x^2 & = 7 - (4 x^3 + 0 x^4 + 0 x^5),
    0 & = 0,
    x^6 & = 8 - (0 x^3 + 0 x^4 + 0 x^5),
  ).
$
The reason that we consider this list of equations as the solution of the system of linear equations is that we can plug in any values for $x^3$, $x^4$, $x^5$ into the list of equations to get a solution of the system of linear equations. For example, if we let $x^3 = 1$, $x^4 = 2$, and $x^5 = 3$ then we have
$
  x^1 = -7, quad
  x^2 = 3, quad
  x^3 = 1, quad
  x^4 = 2, quad
  x^5 = 3, quad
  x^6 = 8.
$
which is a valid solution of the system of linear equations $bold(A) x = b$. It is also for this reason that we call the variables in $I_c$ #concept[free variables], as they can freely vary without affecting the validity of the solution.\

We shall now translate the list of equations into a matrix form. For any particular $i in I_r$,
$
                             x^i = & d^i - sum_(j in I_c) c^i_j x^j \
  x^i + sum_(j in I_c) c^i_j x^j = & d^i. \
$
Let $k(i)$ be the index of the equation attributed to the variable $x^i$ for $i in I_r$. To group the equations together, we can consider the following vector:
$
  vec(dots.v, x^i + sum_(j in I_c) c^i_j x^j, dots.v) =
  sum_(i in I_r) (x^i + sum_(j in I_c) c^i_j x^j) e_k(i) = sum_(i in I_r) d^i e_k(i) = vec(dots.v, d^i, dots.v),
$
where $e_k(i)$ is the $k(i)$-th vector in the standard basis of $F^m$, since there are $m$ equations in the list of equations. However, notice that
$
  sum_(i in I_r) (x^i + sum_(j in I_c) c^i_j x^j) e_k(i) &= sum_(i in I_r) x^i e_k(i) + sum_(i in I_r) (sum_(j in I_c) c^i_j x^j) e_k(i)\
  &= sum_(i in I_r) x^i e_k(i) + sum_(j in I_c) (sum_(i in I_r) c^i_j e_k(i)) x^j.
$
Let $v_j = sum_(i in I_r) c^i_j e_k(i)$ be vectors in $"span"({e_k(i)}_(i in I_r))$ for $j in I_c$. Then, we have
$
  sum_(i in I_r) (x^i + sum_(j in I_c) c^i_j x^j) e_k(i) = sum_(i in I_r) x^i e_k(i) + sum_(j in I_c) x^j v_j.
$
Notice how this is similar how we represent multiplication of a matrix and a vector as *the linear combination of the columns of the matrix* (as shown in #sref(proof.title, <ColSpan>)). Let $bold(C)$ be the matrix whose columns are the vectors $e_k(i)$ for $i$-th columns where $i in I_r$ and $v_j$ for $j$-th columns where $j in I_c$. Then, we can represent the list of equations as
$
  bold(C) x = d,
$
where $d$ is the vector whose $i$-th component is $d^i$ for $i in I_r$ and $0$ for $i in I_c$.\

#section(definition, subtitle: [The Shape of the Solution])[
  Let $bold(A)$ be an $m$ by $n$ matrix and let $b$ be a vector in $F^m$. Let $I_r$ be a subset of ${1, dots.c, n}$ such that the variables with indices in $I_r$ can be attributed with equations and let $I_c$ be the complement of $I_r$ in ${1, dots.c, n}$. Let $c^i_j, d^i in F$ for $i in I_r$ and $j in I_c$. Then, the #concept[solution] of the system of linear equations $bold(A) x = b$ is represented by the matrix equation
  $
    bold(C) x = d,
  $
  where $bold(C)$ is the matrix whose columns are the vectors $e_k(i)$ for $i$-th columns where $i in I_r$ and $v_j = sum_(i in I_r) c^i_j e_k(i)$ for $j$-th columns where $j in I_c$, and $d$ is the vector whose $i$-th component is $d^i$ for $i in I_r$ and $0$ for $i in I_c$.
]<RdForm>

In other words, solving a system of linear equations is equivalent to find a way to *transform* the equation $bold(A) x = b$ into the equation $bold(C) x = d$ where $bold(C)$ has a particular shape (i.e. the columns of $bold(C)$ are *either standard basis vectors or linear combinations of standard basis vectors appeared in the columns of $bold(C)$*).
For instance, $bold(C)$ can be:
$
  mat(
    1, 0, 0, 5;
    0, 1, 0, 4;
    0, 0, 1, 3;
  )
  "or"
  mat(
    1, 3, 0, 5;
    0, 0, 0, 0;
    0, 2, 1, 4;
  ).
$
One may notice that there are many $bold(C)$ that satisfy the condition, and they all represent the same solution of the system of linear equations $bold(A) x = b$. Hence, mathematicians defined a particular $bold(C)$ called the #concept[row reduced echelon form] of $bold(A)$ to represent the solution of the system of linear equations $bold(A) x = b$ in a particular way, the uniqueness of the row reduced echelon form of a matrix will not be shown here as it does not affect how we solve a system of linear equations.

#section(definition, subtitle: [Row Reduced Echelon Form])[
  Let $bold(A) x = b$ be a valid system of linear equations where $bold(A)$ is an $m$ by $n$ matrix and $b$ is a vector in $F^m$. Let $bold(C)$ be a matrix in the form defined by #sref(definition.title, <RdForm>) that represents the solution of the system of linear equations $bold(A) x = b$. We say that $bold(C)$ is a #concept[row reduced echelon form] of $bold(A)$, denoted by $bold(C) = "RREF"(bold(A))$, if the following condition is satisfied:\
  If the $k$-th column of $bold(C)$, $C_k$, is
  - *a standard basis vector*, then it is the *next available* standard basis vector that has not appeared in the columns of $bold(C)$ before $C_k$. That is, if
    $
      e_1, e_2, dots.c, e_p
    $
    have already appeared in the columns of $bold(C)$ before $C_k$, then $C_k$ must be $e_(p + 1)$.
  - *not a standard basis vector*, then it is the linear combination of the basis vectors that *appeared* in the columns of $bold(C)$ *before* $C_k$. That is, if
    $
      e_1, e_2, dots.c, e_p
    $
    have already appeared in the columns of $bold(C)$ before $C_k$, then $C_k$ must be
    $
      C_k = sum_(i=1)^p c^i_k e_i,
    $
    where $c^i_k in F$ for $i in I_r$ and $i < k$.
]

If we consider the previous example,
$
  mat(
    1, 0, 0, 5;
    0, 1, 0, 4;
    0, 0, 1, 3;
  )
$
is in *row reduced echelon form*, while
$
  mat(
    1, 3, 0, 5;
    0, 0, 0, 0;
    0, 2, 1, 4;
  )
$
is not in *row reduced echelon form* since the second column is not a standard basis vector and it is not the linear combination of the first column (the only column before it).\

With that, we are left with the task of figuring out how to *transform* the equation $bold(A) x = b$ into the equation $bold(C) x = d$ where $bold(C)$ is in row reduced echelon form.

#section(theorem, subtitle: [Invertible Transformation Preserves the Solutions])[
  Let $bold(A)$ be a matrix and $b$ be a vector, if
  $
    bold(A) x = b
  $
  is a valid system of linear equations, then
  $
    bold(T) bold(A) x = bold(T) b
  $
  has the same solution as $bold(A) x = b$ for any invertible matrix $bold(T)$.
  #section(proof)[
    Let $x$ be a solution of the system of linear equations $bold(A) x = b$. Then, we have
    $
      bold(T) bold(A) x = bold(T) b.
    $
    Conversely, let $x$ be a solution of the system of linear equations $bold(T) bold(A) x = bold(T) b$. Since $bold(T)$ is invertible, we have
    $
      bold(A) x = bold(T)^(-1) (bold(T) bold(A) x) = bold(T)^(-1) (bold(T) b) = b.
    $
    This shows that $x$ is also a solution of the system of linear equations $bold(A) x = b$.
    #align(right)[$qed$]
  ]
]<RowOpPreserve>

#section(definition, subtitle: [Elementary Row Operations])[
  Let $bold(A)$ be an $m$ by $n$ matrix. An #concept[elementary row operation] on $bold(A)$ is one of the following operations:
  + *Row swapping*: swap the positions of two rows of $bold(A)$.
  + *Row scaling*: multiply all entries of a row of $bold(A)$ by a nonzero scalar.
  + *Row addition*: add a scalar multiple of one row of $bold(A)$ to another row of $bold(A)$.
]<DefRowOp>

#section(theorem, subtitle: [Row Operations are Linear Transformations])[
  The *elementary row operations* on an $m$ by $n$ matrix defined in #sref(definition.title, <DefRowOp>) can be represented by *left multiplication* of the matrix by an *invertible* $m$ by $m$ matrix.
  #section(proof)[
    Let $bold(A)$ be an $m$ by $n$ matrix. We will show that each of the three types of elementary row operations can be represented by left multiplication of $bold(A)$ by an invertible $m$ by $m$ matrix.
    + *Row swapping*:\
      If $T$ swaps the $i$-th and $j$-th rows of $bold(A)$, we shall define $bold(T)$ as follows:\
      Let ${I^i}_(i in {1, dots.c, m})$ be the $i$-th row of the identity matrix $bold(I)_m$. $bold(T)$ is a matrix whose $k$-th row is $I^k$, except that the $i$-th row is $I^j$ and the $j$-th row is $I^i$. For instance, if $m = 4$, $i = 2$, and $j = 4$, then we have
      $
        bold(T) = mat(
          1, 0, 0, 0;
          0, 0, 0, 1;
          0, 0, 1, 0;
          0, 1, 0, 0
        ).
      $
      The inverse of $bold(T)$ is itself, since swapping the same two rows again will return the original matrix. Hence, we have $bold(T)^(-1) = bold(T)$.

    + *Row Scaling*:\
      If $T$ scales the $i$-th row of $bold(A)$ by a nonzero scalar $a$, we shall define $bold(T)$ as follows:\
      Let ${I^i}_(i in {1, dots.c, m})$ be the $i$-th row of the identity matrix $bold(I)_m$. $bold(T)$ is a matrix whose $k$-th row is $I^k$, except that the $i$-th row is $a I^i$ where $a$ is the nonzero scalar used for scaling. For instance, if $m = 4$, $i = 2$, and $a = 3$, then we have
      $
        bold(T) = mat(
          1, 0, 0, 0;
          0, 3, 0, 0;
          0, 0, 1, 0;
          0, 0, 0, 1
        ).
      $
      The inverse of $bold(T)$ is the matrix whose $k$-th row is $I^k$, except that the $i$-th row is $(1/a) I^i$. Hence, we have
      $
        bold(T)^(-1) = mat(
          1, 0, 0, 0;
          0, 1/3, 0, 0;
          0, 0, 1, 0;
          0, 0, 0, 1
        ).
      $

    + *Row addition*:\
      If $T$ adds $a$ times the $j$-th row of $bold(A)$ to the $i$-th row of $bold(A)$, we shall define $bold(T)$ as follows:\
      Let ${I^i}_(i in {1, dots.c, m})$ be the $i$-th row of the identity matrix $bold(I)_m$. $bold(T)$ is a matrix whose $k$-th row is $I^k$, except that the $i$-th row is $I^i + a I^j$ where $a$ is the scalar used for addition. For instance, if $m = 4$, $i = 2$, $j = 4$, and $a = 3$, then we have
      $
        bold(T) = mat(
          1, 0, 0, 0;
          0, 1, 0, 3;
          0, 0, 1, 0;
          0, 0, 0, 1
        ).
      $
      The inverse of $bold(T)$ is the matrix whose $k$-th row is $I^k$, except that the $i$-th row is $I^i - a I^j$. Hence, we have
      $
        bold(T)^(-1) = mat(
          1, 0, 0, 0;
          0, 1, 0, -3;
          0, 0, 1, 0;
          0, 0, 0, 1
        ).
      $
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Row Operations Preserve the Solution])[
  Let $bold(A)$ be an $m$ by $n$ matrix and let $b$ be a vector in $F^m$. If $bold(T)$ is an invertible matrix that represents an elementary row operation on $bold(A)$, then the system of linear equations $bold(T) bold(A) x = bold(T) b$ has the same solution as the system of linear equations $bold(A) x = b$.
  This is shown in #sref(theorem.title, <RowOpPreserve>).
]

This means we can freely apply any elementary row operation on a system of linear equations in attempt to transform the system of linear equations into a system of linear equations with *a particular shape* (i.e. the *row reduced echelon form*) without worrying about changing the solution of the system of linear equations.\

We shall now develop an *algorithm* to do so. Let $bold(A)$ be an $m$ by $n$ matrix and let $b$ be a vector in $F^m$, consider the system of linear equations $bold(A) x = b$. We shall represent $bold(A)$ as its columns:
$
  bold(A) x = mat(
    |, , |;
    A_1, dots.c, A_n;
    |, , |
  ) x = b.
$
Let's consider $bold(A)$ as *an ordered list of columns*. The idea is simple, since we want to transform $bold(A)$ in row reduced echelon form, we will *process* the columns of $bold(A)$ one by one from left to right. If the current column, $A_k$, is *not a linear combination of previous columns*, then we will use *elementary row operations* to transform the current column into the *next available standard basis vector*.\

However, one may notice that to figure out whether $A_k$ is a linear combination of previous columns, we need to *solve* the system of linear equations
$
  A_k = sum_(i = 1)^(k - 1) c^i_k A_i,
$
where $c^i_k$ are scalars in $F$. This seems to be a *circular* problem since we are trying to solve a system of linear equations in order to solve a system of linear equations.\

The remedy to this problem is actually obvious once one actually tries to process the columns of $bold(A)$ one by one from left to right.\
Let's say that we already found a list of row operations, $bold(T) = bold(T)_1 dots.c bold(T)_p$, that changes all the previous columns of $A_k$ into the appropriate form. That is, some of the $A_i$ for $i < k$ are transformed into standard basis vectors, let's say that $A_(i_1), dots.c, A_(i_r)$ are transformed into $e_1, dots.c, e_r$ respectively, and the rest of the $A_j$ for $j < k$ are transformed into linear combinations of the basis vectors appeared up to $j$.\
Now, since
$
  bold(T) bold(A) = mat(
    |, , |;
    bold(T) A_1, dots.c, bold(T) A_n;
    |, , |;
  ),
$
if $A_k$ is a linear combination of previous columns, then
$
  bold(T) A_k = sum_(i = 1)^(k - 1) c^i_k bold(T) A_i,
$
but any $bold(T) A_i$ for $i < k$ is either a standard basis vector in ${e_1, dots.c, e_r}$ or a linear combination of these vectors. Hence, $bold(T) A_k$ is also a linear combination of the standard basis vectors in ${e_1, dots.c, e_r}$, that is, there exist scalars $a^j_k in F$ for $j in {1, dots.c, r}$ such that
$
  bold(T) A_k = sum_(i = 1)^(k - 1) c^i_k bold(T) A_i = sum_(j = 1)^(r) a^j_k e_j
  = vec(a^1_k, dots.v, a^r_k, 0, dots.v, 0).
$
This means that if $A_k$ *is a linear combination of previous columns*, then *all* components of $bold(T) A_k$ after the $r$-th component are *zero*. On the other hand, if $A_k$ *is not a linear combination of previous columns*, then there exists *at least one* component of $bold(T) A_k$ after the $r$-th component that is *not zero*.

Now, we need to figure out how to use elementary row operations to transform $bold(T) A_k$ into the next available standard basis vector if $A_k$ is not a linear combination of previous columns.\
+ Let's say that the next available standard basis vector is $e_(r + 1)$. Since there exists at least one component of $bold(T) A_k$ after the $r$-th component that is not zero, we can use row swapping, $T_w$ ,to swap the row with a nonzero component with the $(r + 1)$-th row.
+ Then we can use row scaling, $T_c$, to scale the $(r + 1)$-th row such that the $(r + 1)$-th component of $bold(T) A_k$ becomes $1$.
+ Finally, we can use row additions, $T_a_1, dots.c, T_a_q$, to add appropriate multiples of the $(r + 1)$-th row to other rows to make all other components of $bold(T) A_k$ zero.
We should show that these row operations will not change the form of the previous columns. Since $bold(T) A_i$ are either standard basis vectors in ${e_1, dots.c, e_r}$ or linear combinations of these vectors for $i < k$, *all* components of $bold(T) A_i$ after the $r$-th component are *zero* for $i < k$. Hence,
+ $T_w$ does not change the form of $bold(T) A_i$ for $i < k$ since it only swaps rows after the $r$-th row.
+ $T_c$ does not change the form of $bold(T) A_i$ for $i < k$ since it only scales the $(r + 1)$-th row, which is zero for all $bold(T) A_i$ for $i < k$.
+ $T_a_1, dots.c, T_a_q$ do not change the form of $bold(T) A_i$ for $i < k$ since they only add multiples of the $(r + 1)$-th row, which is zero for all $bold(T) A_i$ for $i < k$.

Hence, we can apply $bold(T)_a_q dots.c bold(T)_a_1 bold(T)_c bold(T)_w$ to $bold(T) bold(A)$ in order to transform $A_k$ into the next available standard basis vector without changing the form of previous columns. Continuing this process for all columns of $bold(A)$, we can transform $bold(A)$ into a matrix in *row reduced echelon form*, which represents the solution of the system of linear equations $bold(A) x = b$.\

#section(definition, subtitle: [Gauss-Jordan Elimination])[
  The process of applying elementary row operations to transform a matrix into row reduced echelon form is called #concept[Gauss-Jordan elimination].\
  Let $bold(A)$ be an $m$ by $n$ matrix and let $b$ be a vector in $F^m$. We shall define the *algorithm* as follows:
  - Starting from $A_1$ the first column of $bold(A)$ and proceed column by column from left to right.
    + For each column $A_k$, assuming that $bold(T)_k$ have already transformed the previous columns of $bold(A)$ into the appropriate form and the basis $e_1, dots.c, e_r$ have been used in the previous columns, we will check whether $A_k$ is a linear combination of previous columns by checking whether all components of $bold(T)_k A_k$ after the $r$-th component are zero.
    + If it is, then do nothing and move on to the next column. If it is not, then apply elementary row operations to transform $A_k$ into the next available standard basis vector $e_(r+1)$ and move on to the next column.

  - The elementary row operations to transform $A_k$ into the next available standard basis vector are the follows:
    + $T_w$ that swaps the $r+1$-th row with a row after the $r$-th row that has a nonzero component in $bold(T) A_k$.
    + $T_c$ that scales the $r+1$-th row such that the $r+1$-th component of $bold(T) A_k$ becomes $1$.
    + $T_a_1, dots.c, T_a_q$ that add appropriate multiples of the $r+1$-th row to other rows to make all other components of $bold(T) A_k$ zero.
    #v(-0.5em)
    Then, for $A_(k+1)$, $bold(T)_(k+1) = bold(T)_a_q dots.c bold(T)_a_1 bold(T)_c bold(T)_w bold(T)_k$.
]

#section(theorem, subtitle: [Non-Square Matrix I])[
  Let $bold(A)$ be an $m$ by $n$ matrix and $bold(A) x = b$ be a valid system of linear equations. If $m < n$, then the system of linear equations $bold(A) x = b$ has either *no solution* or *infinitely many solutions* (suppose that the field $F$ has infinitely many scalars).
  #section(proof)[
    Let $bold(C) = "RREF"(bold(A))$ be the row reduced echelon form of $bold(A)$ and let $d$ be the vector such that $bold(C) x = d$ represents the solution of the system of linear equations $bold(A) x = b$. Since $m < n$, there are more columns than rows in $bold(C)$, hence there is at least one column in $bold(C)$ that is not a standard basis vector.\
    If the system of linear equations have a solution, then that column must be associated with a *free variable*. That is, there is at least one variable that can vary freely without affecting the validity of the solution. Hence there must be infinitely many solutions of the system of linear equations $bold(A) x = b$ since there are infinitely many scalars in $F$ that can be assigned to the free variable.
    #align(right)[$qed$]
  ]
]<NonSquareI>

#section(corollary, subtitle: [Non-Square Matrix II])[
  Let $bold(A)$ be an $m$ by $n$ matrix, if $m < n$, then the columns of $bold(A)$ are linearly dependent.
  #section(proof)[
    Since the homogeneous system of linear equations$bold(A) x = 0$ has always at least one solution, if $m < n$, then the homogeneous system of linear equations $bold(A) x = 0$ must have infinitely many solutions by #sref(theorem.title, <NonSquareI>). Hence, the columns of $bold(A)$ are linearly dependent.
    #align(right)[$qed$]
  ]
]<NonSquareII>

#section(theorem, subtitle: [Independent Columns of a Square Matrix])[
  Let $bold(A)$ be an $n$ by $n$ matrix, if the columns of $bold(A)$ are linearly independent, then $bold(A)$ is invertible.
  #section(proof)[
    Since the columns of $bold(A)$ are linearly independent. From the way we defined the row reduced echelon form of a matrix, we can see that the row reduced echelon form of $bold(A)$ must be the identity matrix $bold(I)_n$.\
    Hence, there is a sequence of elementary row operations that transforms $bold(A)$ into $bold(I)_n$, let's represent the sequence of elementary row operations as $bold(T) = bold(T)_1 dots.c bold(T)_p$. Then, we have
    $
      bold(T) bold(A) = bold(I)_n.
    $
    Since $bold(T)$ is invertible, then $bold(A)$ must be the inverse of $bold(T)$, hence $bold(A)$ is invertible.
    #align(right)[$qed$]
  ]
]<IndColSq>

#pagebreak()
== General Vector Spaces
#section(theorem, subtitle: [Set of Linearly Independent Vectors])[
  Let $V = F^m$ be a vector space and let $S = {v_1, dots.c, v_n}$ be a set of vectors in $V$. If $n > m$, then the vectors in $S$ are linearly dependent.
  #section(proof)[
    Consider the $m$ by $n$ matrix $bold(A)$ whose columns are the vectors in $S$. Since $m < n$, by #sref(corollary.title, <NonSquareII>), the columns of $bold(A)$ are linearly dependent. This shows that the vectors in $S$ are linearly dependent.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Maximum Number of Linearly Independent Vectors])[
  Let $V = F^m$ be a vector space, then any set of more than $m$ vectors in $V$ are linearly dependent.
]

#section(corollary, subtitle: [Number of Basis Vectors])[
  Let $V$ be a vector space with a finite basis, then any basis of $V$ has the same number of vectors.
  #section(proof)[
    Let $frak(B)_e = {e_1, dots.c e_n}$ and $frak(B)_f = {f_1, dots.c, f_m}$ be two bases of $V$, with $m < n$. Consider the following system of linear equations:
    $
      sum_(i = 1)^n v^i e_i = 0.
    $
    We can rewrite the system of linear equations as
    $
        sum_(i = 1)^n sum_(j = 1)^m v^i e^j_i f_j = & 0 \
      sum_(j = 1)^m (sum_(i = 1)^n v^i e^j_i) f_j = & 0,
    $
    where $e_i = sum_(j = 1)^m e^j_i f_j$ for $i in {1, dots.c, n}$. Now, since $frak(B)_f$ is a basis of $V$, then the only solution of the system of linear equations is $sum_(i=1)^n v^i e^j_i = 0$ for all $j in {1, dots.c, m}$. Since
    $
      sum_(i = 1)^n v^i e^j_i = v^1 e^j_1 + v^2 e^j_2 + dots.c + v^n e^j_n = 0,
    $
    we can rewrite the system of linear equations as
    $
      bold(E) v =
      mat(
        e^1_1, e^1_2, dots.c, e^1_n;
        e^2_1, e^2_2, dots.c, e^2_n;
        dots.v, dots.v, dots.down, dots.v;
        e^m_1, e^m_2, dots.c, e^m_n
      ) vec(v^1, v^2, dots.v, v^n) = vec(0, 0, dots.v, 0).
    $
    However, since $m < n$, and $bold(E) v = 0$ has at least one solution $v=0$, by #sref(theorem.title, <NonSquareI>), the system of linear equations $bold(E) v = 0$ must have infinitely many solutions, which implies
    $
      sum_(i = 1)^n v^i e_i = 0
    $
    also has infinitely many solutions. Hence, $e_1, dots.c, e_n$ are linearly dependent, which contradicts the fact that $frak(B)_e$ is a basis of $V$.
    Therefore, by contradiction, we have $m >= n$. By a symmetric argument, we can also show that $n >= m$. Hence, we have $m = n$.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Minimum Number of Vectors to Span a Vector Space])[
  Let $V = F^m$ be a vector space, then any set of less than $m$ vectors in $V$ cannot span $V$.
]

#section(definition, subtitle: [Dimension of a Vector Space])[
  Let $V$ be a vector space with a finite basis, then the number of vectors in any basis of $V$ is called the #concept[dimension] of $V$, denoted by $dim(V)$.
]

#section(theorem, subtitle: [General Vector Space to Cartesian])[
  Let $V$ be a vector space with the field $F$ and a finite basis $frak(B) = {v_1, dots.c, v_n}$, then there is an isomorphism between $V$ and $F^n$ that maps $v_i$ to the standard basis $e_i$ for all $i in {1, dots.c, n}$.
  #section(proof)[
    Let $T$ be a function from $V$ to $F^n$ defined as follows:\
    $
      T(sum_(i = 1) u^i v_i) = sum_(i=1) u^i T(v_i) := sum_(i = 1) u^i e_i.
    $
    Since it is clear that $T$ satisfies the properties of a linear transformation, we only need to show that $T$ is bijective.\
    For any vector $u = sum_(i = 1) u^i v_i in V$, it is mapped to $T(u) = sum_(i = 1) u^i e_i$. Hence $T(u) = T(w)$ if and only if $u = w$. Hence, $T$ is injective.\
    Similarly, for any vector $u = sum_(i = 1) u^i e_i in F^n$, it is mapped from $T(sum_(i = 1) u^i v_i) = sum_(i = 1) u^i e_i$. Hence, $T$ is surjective.\
    Therefore, $T$ is bijective, which shows that there is an isomorphism between $V$ and $F^n$ that maps $v_i$ to the standard basis $e_i$ for all $i in {1, dots.c, n}$.
    #align(right)[$qed$]
  ]
]<GenVecToCart>

#section(definition, subtitle: [Ordered Basis])[
  Let $V$ be a vector space with the field $F$ and a finite basis $frak(B) = {v_1, dots.c, v_n}$. The basis $frak(B)$ is called an #concept[ordered basis] of $V$ if the order of the vectors in $frak(B)$ is fixed. That is, $frak(B)$ is an *ordered list* of vectors in $V$.
]

#section(corollary, subtitle: [Subspace Spanned by a Finite Set of Vectors])[
  Let $V$ be a vector space with the field $F$ and let $S = {v_1, dots.c, v_n}$ be a set of vectors in $V$. Then, the subspace spanned by $S$ is isomorphic to $F^m$ where $m$ is the number of linearly independent vectors in $S$.
  #section(proof)[
    Let $frak(B) = {v_(i_1), dots.c, v_(i_m)}$ be the set of linearly independent vectors in $S$. Since any vector in the subspace spanned by $S$ can be written as a linear combination of the vectors in $frak(B)$, we have
    $
      "span"(S) = "span"(frak(B)).
    $
    Since $frak(B)$ is a set of linearly independent vectors, it is a basis of $"span"(frak(B))$. Hence, the dimension of $"span"(frak(B))$ is $m$ and it is isomorphic to $F^m$.
    #align(right)[$qed$]
  ]
]
#section(definition, subtitle: [Coordinate])[
  Let $V$ be a vector space with the field $F$ and a finite ordered basis $frak(B) = {v_1, dots.c, v_n}$ and $I_frak(B): V mapsto F^n$ be the isomorphism defined in #sref(theorem.title, <GenVecToCart>). Then, for any vector $v in V$ defined as
  $
    v = sum_(i = 1) u^i v_i,
  $
  the *n-tuple*
  $
    bold(v) = vec(u^1, u^2, dots.v, u^n) = I_frak(B)(v)
  $
  is called the #concept[coordinate] of $v$ with respect to the basis $frak(B)$.
]

Note that $v != bold(v)$ in general, since $v$ and $bold(v)$ are not necessarily the same mathematical object. Moreover, $bold(v)$ depends *entirely* on the choice of the basis $frak(B)$. That is $bold(v)$ might change if we change the basis $frak(B)$, even if $v$ is fixed. Hence, we should always specify the basis when we talk about the coordinate of a vector.

#section(convention, subtitle: [Coordinate Representation of a Vector])[
  In order to distinguish the coordinates of a vector $v in V$ with respect to different bases, we will denote the coordinate of $v$ with respect a particular basis $frak(B)$ as
  $
    vec(u^1, u^2, dots.v, u^n)_frak(B)
  $
  or as $[bold(v)]_frak(B)$.
]

#section(theorem, subtitle: [Basis Change])[
  Let $cal(P)$ and $cal(Q)$ be two finite ordered bases of a vector space $V$ with the field $F$. Then, there is an invertible matrix $bold(T)$ such that for any $v in V$,
  $
    [bold(v)]_cal(P) = bold(T) [bold(v)]_cal(Q).
  $
  #section(proof)[
    Let $cal(Q) = {q_1, q_2, dots.c, q_n}$. Let's define the matrix $bold(T)$ as follows:
    $
      bold(T) = mat(
        |, , |;
        [bold(q)_1]_cal(P), dots.c, [bold(q)_n]_cal(P);
        |, , |
      ).
    $
    Since $cal(Q)$ is a basis of $V$, $[bold(q)_1]_cal(P), dots.c, [bold(q)_n]_cal(P)$ are linearly independent in $F^n$. Hence, the matrix $bold(T)$ is invertible.\
    For any $v in V$ where
    $
      [bold(v)]_cal(Q) = vec(v_q^1, dots.v, v_q^n)_cal(Q),
    $
    we have
    $
      bold(T) [bold(v)]_cal(Q) = sum_(i = 1)^n v_q^i [bold(q)_i]_cal(P).
    $
    Let $[bold(u)]_cal(P) = sum_(i = 1)^n v_q^i [bold(q)_i]_cal(P)$, we need show that $[bold(u)]_cal(P) = [bold(v)]_cal(P)$. Consider
    $
      I^(-1) ([bold(u)]_cal(P)) = sum_(i = 1)^n v_q^i I^(-1) ([bold(q)_i]_cal(P)) = sum_(i = 1)^n v_q^i q_i = v.
    $
    Hence, we have $[bold(u)]_cal(P) = [bold(v)]_cal(P)$.
    #align(right)[$qed$]
  ]
]


#section(theorem, subtitle: [Matrix Form of Linear Transformations in General Vector Spaces])[
  Let $V$ and $W$ be two vector spaces with the field $F$ and finite ordered bases $frak(B)_V = {v_1, dots.c, v_n}$ and $frak(B)_W = {w_1, dots.c, w_m}$ respectively. Let $T$ be a linear transformation from $V$ to $W$. Then, there is an $m$ by $n$ matrix $bold(T)$ such that for any vector $v in V$, if $T(v) = w$, then we have
  $
    bold(T) [bold(v)]_(frak(B)_V) = [bold(w)]_(frak(B)_W).
  $
  #section(proof)[
    From #sref(theorem.title, <LinTranIsoVecSpace>), we know that there is a unique linear transformation $S$ from $F^n mapsto W$ such that for any vector $v in V$, if $T(v) = w$, then we have
    $
      S ([bold(v)]_(frak(B)_V)) = w.
    $
    Now, let's consider the linear transformation
    $
      I_frak(B)_W compose S : F^n mapsto F^m.
    $
    As it maps from a Cartesian vector space to a Cartesian vector space, there is a unique $m$ by $n$ matrix $bold(T)$ such that
    $
      bold(T) [bold(v)]_(frak(B)_V) = I_frak(B)_W compose S ([bold(v)]_(frak(B)_V)) = I_frak(B)_W (w) = [bold(w)]_(frak(B)_W).
    $
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Change of Basis for Linear Transformations])[
  Let $T: V mapsto V$ be a linear operator on the vectors space $V$ with the field $F$.\
  If $[bold(T)]_(cal(V)_1)$ is the matrix representation of $T$ with respect to the bases $cal(V)_1$, and $cal(V)_2$ is another ordered basis of $V$, then there is an invertible matrix $bold(P)$ such that
  $
    [bold(T)]_(cal(V)_2) = bold(P) [bold(T)]_(cal(V)_1) bold(P)^(-1),
  $
  where $bold(P)$ is precisely the matrix that changes the basis from $cal(V)_1$ to $cal(V)_2$.

  #section(proof)[
    Let $bold(P)$ be the matrix that changes the basis from $cal(V)_1$ to $cal(V)_2$. Then, for any vector $v in V$, we have
    $
      bold(P) [bold(T)]_(cal(V)_1) [bold(v)]_(cal(V)_1) = I_(cal(V)_2) compose T (v) = [bold(T)]_(cal(V)_2) [bold(v)]_(cal(V)_2).
    $
    Now, since $bold(P)$ is invertible, we have
    $
      [bold(v)]_(cal(V)_1) = bold(P)^(-1) [bold(v)]_(cal(V)_2).
    $
    Thus,
    $
      bold(P) [bold(T)]_(cal(V)_1) bold(P)^(-1) [bold(v)]_(cal(V)_2) = bold(P) [bold(T)]_(cal(V)_1) [bold(v)]_(cal(V)_1) = [bold(T)]_(cal(V)_2) [bold(v)]_(cal(V)_2).
    $
    Therefore, we have
    $
      bold(P) [bold(T)]_(cal(V)_1) bold(P)^(-1) = [bold(T)]_(cal(V)_2).
    $
    #align(right)[$qed$]
  ]
]

#section(definition, subtitle: [Nullity and Rank of a Linear Transformation])[
  Let $T$ be a linear transformation from a vector space $V$ to a vector space $W$ with dimensions. The #concept[nullity] of $T$ is the dimension of $ker(T)$ The #concept[rank] of $T$ is the dimension of $im(T)$, denoted by $"rank"(T)$.
]

#section(theorem, subtitle: [How a Set of Independent Vectors Span a Vector Space])[
  Let $V$ be a vector space with the field $F$ with $dim V = n$. If $S={s_1, dots.c, s_n}$ is a set of linearly independent vectors in $V$, then
  $
    "span"(S) = V.
  $
  #section(proof)[
    Since $S subset.eq V$, any linear combination of the vectors in $S$ is also a linear combination of the vectors in $V$. Hence, we have $"span"(S) subset.eq V$.\
    Let $frak(B)$ be an ordered basis of $V$. Let $bold(S)$ be the following matrix:
    $
      bold(S) = mat(
        |, , |;
        [bold(s)_1]_frak(B), dots.c, [bold(s)_n]_frak(B);
        |, , |
      )
    $
    which defines a linear transformation from $F^n$ to $F^n$. Since $F^n$ and $V$ are isomorphic, we will define a linear transformation $S$ from $V$ to $V$ by $bold(S)$. Now, as isomorphisms preserve linear independence, $[bold(s)_1]_frak(B), dots.c, [bold(s)_n]_frak(B)$ are linearly independent in $F^n$. Hence, the matrix $bold(S)$ is invertible, so does $S$.\
    Therefore, for any vector $v in V$, if $u = S^(-1) (v)$, there is
    $
      I_frak(B) compose S^(-1) (v) =
      bold(S)^(-1) [bold(v)]_frak(B) = [bold(u)]_frak(B) = vec(u^1, u^2, dots.v, u^n)_frak(B).
    $
    The claim is that the coordinates of $u$ gives the coefficients of a linear combination of the vectors in $S$ that equals to $v$. To show this, consider
    $
      I_frak(B)^(-1) (bold(S) [bold(u)]_frak(B)) = sum_(i = 1)^n u^i s_i.
    $
    However, we also have
    $
      I_frak(B)^(-1) (bold(S) [bold(u)]_frak(B)) = I_frak(B)^(-1) (bold(S) bold(S)^(-1) [bold(v)]_frak(B)) = I_frak(B)^(-1) ([bold(v)]_frak(B)) = v.
    $
    Hence,
    $
      sum_(i = 1)^n u^i s_i = v.
    $
    Since this holds for any vector $v in V$, we have $V subset.eq "span"(S)$.
    Therefore, we have $"span"(S) = V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [How a Set of Vectors Spanning a Vector Space Can Be Independent])[
  Let $V$ be a vector space with the field $F$ with $dim V = n$. If $S={s_1, dots.c, s_n}$ is a set of vectors in $V$ such that $"span"(S) = V$, then $S$ is a basis of $V$.
  #section(proof)[
    If $S$ is linearly dependent, then there must be a vector $s_i$ in $S$ such that
    $
      s_i = sum_(j != i) c^j s_j,
    $
    for some scalars $c^j in F$. Hence,
    $ "span"(S \\ {s_i}) = "span"(S) = V, $ but that contradicts the fact that any set of less than $n$ vectors in $V$ cannot span $V$. Thus, it must be that $S$ is linearly independent, which shows that $S$ is a basis of $V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Dimension of Two Subspaces])[
  Let $V$ be a vector space with the field $F$ and let $W_1$ and $W_2$ be two subspaces of $V$. Then
  $
    dim W_1 + dim W_2 = dim (W_1 + W_2) + dim (W_1 inter W_2).
  $
  #section(proof)[
    $W_1 inter W_2$ is a subspace of $V$ by #sref(theorem.title, <IntersectionSubspace>).
    Let $frak(B)_(W_1 inter W_2) = {alpha_i}_(i in I)$ be a basis of $W_1 inter W_2$. Let's construct $frak(B)_W_1 = {alpha_i}_(i in I) union {beta_j}_(j in J)$ and $frak(B)_W_2 = {alpha_i}_(i in I) union {gamma_k}_(k in K)$ by finding linear independent vectors, so that they are bases of $W_1$ and $W_2$ respectively.\
    We shall show that $frak(B)_(W_1 + W_2) = {alpha_i}_(i in I) union {beta_j}_(j in J) union {gamma_k}_(k in K)$ is a basis of $W_1 + W_2$.\
    + $frak(B)_(W_1 + W_2)$ is a spanning set of $W_1 + W_2$:\
      Since $W_1 + W_2$ is defined as the span of $W_1 + W_2$, any vector in $W_1 + W_2$ is a linear combination of vectors in $W_1$ and $W_2$, which are linear combinations of vectors in $frak(B)_W_1$ and $frak(B)_W_2$ respectively. Hence, any vector in $W_1 + W_2$ is a linear combination of vectors in $frak(B)_(W_1 + W_2)$.

    + $frak(B)_(W_1 + W_2)$ is a linearly independent set:\
      Consider the linear combination
      $
        sum_(i in I) a^i alpha_i + sum_(j in J) b^j beta_j + sum_(k in K) c^k gamma_k = 0.
      $
      If they are linearly dependent, then
      $
        sum_(i in I) a^i alpha_i + sum_(j in J) b^j beta_j = - sum_(k in K) c^k gamma_k.
      $
      Let $gamma = sum_(k in K) c^k gamma_k$, the above holds means that $gamma in W_1$. However, we also have $gamma in W_2$. Then $gamma in W_1 inter W_2$. But that contradicts the fact that ${alpha_i}_(i in I) union {gamma_k}_(k in K)$ is independent.
      Hence, $frak(B)_(W_1 + W_2)$ is a linearly independent set.
    This shows that $frak(B)_(W_1 + W_2)$ is a basis of $W_1 + W_2$ and $dim (W_1 + W_2) = abs(frak(B)_(W_1 + W_2))$. Now, since
    $
      abs(frak(B)_W_1) + abs(frak(B)_W_2) = abs(frak(B)_(W_1 + W_2)) + abs(frak(B)_(W_1 inter W_2)),
    $
    we have
    $
      dim W_1 + dim W_2 = dim (W_1 + W_2) + dim (W_1 inter W_2).
    $
    #align(right)[$qed$]
  ]
]<DimTwoSubspaces>

#section(theorem, subtitle: [Dimension of the Image and Kernel of a Linear Transformation])[
  Let $T$ be a linear transformation from a vector space $V$ to a vector space $W$ with dimensions. Then
  $
    dim V = "rank"(T) + "nullity"(T).
  $
  #section(proof)[
    Let ${e_i}_(i in I)$ be the basis of $ker(T)$. Let's construct $frak(B)_V = {e_i}_(i in I) union {f_j}_(j in J)$ by finding linear independent vectors, so that it is a basis of $V$.\
    + Finding $"rank"(T)$.\
      We shall first show that $T$ is *injective* for $v in "span"({f_j}_(j in J))$:\
      Consider any vector $v, u in "span"({f_j}_(j in J))$, if
      $
        T(v) = T(u),
      $
      then $T(v - u) = T(0)$. That means that $v - u in ker(T)$. If $v - u != 0$, then there must be a list of scalars ${alpha^i}_(i in I)$ and a list of scalars ${beta^j}_(j in J)$ such that
      $
        sum_(i in I) alpha^i e_i = v - u = sum_(j in J) beta^j f_j.
      $
      This contradicts the fact that $frak(B)_V$ is a basis of $V$. Hence, we must have $v - u = 0$, which shows that $T$ is injective for $v in "span"({f_j}_(j in J))$.\
      Now, let's show that $T: "span"({f_j}_(j in J)) mapsto im(T)$ is *surjective*:\
      This is automatically true by the very definition of $im(T)$.
      This means that $T: "span"({f_j}_(j in J)) mapsto im(T)$ is a bijection and thus, an isomorphism. Hence, we have
      $
        dim "span"({f_j}_(j in J)) = dim im(T) = "rank"(T) = |J|.
      $
    + Finding $"nullity"(T)$.\
      Since ${e_i}_(i in I)$ is a basis of $ker(T)$, we have
      $
        dim ker(T) = "nullity"(T) = |I|.
      $
    Thus,
    $
      dim V = |I| + |J| = "nullity"(T) + "rank"(T).
    $
    #align(right)[$qed$]
  ]
]<DimImgKerLinTran>

#section(theorem, subtitle: [Main Basis Theorem])[
  Let $e_1, dots.c, e_n$ be vectors in $V$, then the following statements are equivalent:
  + $e_1, dots.c, e_n$ span $V$ and are linearly independent.
  + $e_1, dots.c, e_n$ span $V$ and no set of vectors in $V$ with less than $n$ vectors can span $V$.
  + $e_1, dots.c, e_n$ are linearly independent and no set of vectors in $V$ with more than $n$ vectors can be linearly independent.
  + For any vector $v in V$, there are unique scalars $u^1, dots.c, u^n$ such that
    $
      v = sum_(i = 1)^n u^i e_i.
    $
  #section(proof)[
    + From 1. to 2., to 3., and vice-versa are evident.\
      Let's show that 1. implies 4.:
      If $e_1, dots.c, e_n$ is a basis of $V$ and a vector $v in V$ has two *different* representations as a linear combination of $e_1, dots.c, e_n$, say
      $
        v = sum_(i = 1)^n u^i e_i = sum_(i = 1)^n w^i e_i.
      $
      Then, we have
      $
        0 = v - v = sum_(i = 1)^n (u^i - w^i) e_i.
      $
      If $u_i$ and $w_i$ are different, then this means that there is a nontrivial linear combination of $e_1, dots.c, e_n$ that equals to $0$, which contradicts the fact that $e_1, dots.c, e_n$ are linearly independent. Hence, we must have $u^i = w^i$ for all $i in {1, dots.c, n}$, which shows that the representation of $v$ as a linear combination of $e_1, dots.c, e_n$ is unique.\
      One can also easily show that 4. implies 1.: First, if any vector $v in V$ can be written as a linear combination of $e_1, dots.c, e_n$, then $e_1, dots.c, e_n$ span $V$. Second, consider $0 in V$, let $a^1, dots.c, a^n$ be scalars such that
      $
        0 = sum_(i = 1)^n a^i e_i,
      $
      if any one of the $a_i$ is nonzero, then any nonzero scaler $c$ can be multiplied to the above equation to get
      $
        0 = sum_(i = 1)^n (c a^i) e_i.
      $
      Since at least one of the $c a^i$ is nonzero, this means that there is a second way to write $0$ as a linear combination of $e_1, dots.c, e_n$, which contradicts the uniqueness of the representation of $v$ as a linear combination of $e_1, dots.c, e_n$. Hence, we must have $a^i = 0$ for all $i in {1, dots.c, n}$, which shows that $e_1, dots.c, e_n$ are linearly independent. Therefore, $e_1, dots.c, e_n$ is a basis of $V$.
    + The equivalence of other arguments can be mediated by 1.
      #align(right)[$qed$]
  ]
]

#pagebreak()
== Polynomials
Let's consider the vector space of polynomials with coefficients in a field $F$, denoted by $P_oo$. The vectors in $P_oo$ are *finite* polynomials, and the operations of vector addition and scalar multiplication are defined as follows:
#section(definition, subtitle: [Vector Addition and Scalar Multiplication in $F[X]$])[
  Let $p(X) = sum_(i = 0)^n a_i X^i$ and $q(X) = sum_(i = 0)^m b_i X^i$ be two polynomials in $P_oo$ and let $c$ be a scalar in $F$. Then,
  - The vector addition of $p(X)$ and $q(X)$ is defined as
    $
      p(X) + q(X) = sum_(i = 0)^(max(n, m)) (a_i + b_i) X^i,
    $
    where we define $a_i = 0$ for all $i > n$ and $b_i = 0$ for all $i > m$.
  - The scalar multiplication of $c$ and $p(X)$ is defined as
    $
      c p(X) = sum_(i = 0)^n (c a_i) X^i.
    $
]

#section(definition, subtitle: [Zero Vector and Additive Inverse in $P_oo$])[
  The zero vector in $P_oo$ is the zero polynomial $0(X) = 0$. The additive inverse of a polynomial $p(X) = sum_(i = 0)^n a_i X^i$ is defined as
  $
    -p(X) = sum_(i = 0)^n (-a_i) X^i.
  $
]

#section(definition, subtitle: [Degree of a Polynomial])[
  Let $p(X) = sum_(i = 0)^n a_i X^i$ be a polynomial in $P_oo$ where $a_n != 0$. Then, the degree of $p(X)$ is defined as $n$, denoted by $deg(p(X))$.
]

#section(definition, subtitle: [Finite-Degree Polynomials Vector Spaces])[
  Let $n$ be a non-negative integer. The set of all polynomials in $P_oo$ with degree less than or equal to $n$ is denoted by $P_n (F)$, which is a subspace of $P_oo$.
]

#section(corollary, subtitle: [Standard Basis])[
  The standard basis of $P_oo$ is the set of polynomials $cal(F) = {1, X, X^2, dots.c}$, since any subset of $cal(F)$ is linearly independent and any polynomial in $P_oo$ can be written as a linear combination of the polynomials in $cal(F)$.\
  The standard basis of $P_n$ is the set of polynomials $cal(F)_n = {1, X, X^2, dots.c, X^n}$, since any subset of $cal(F)_n$ is linearly independent and any polynomial in $P_n$ can be written as a linear combination of the polynomials in $cal(F)_n$. Thus, $dim P_n = n + 1$.
]

#section(corollary, subtitle: [Other Form of Basis])[
  Consider the set ${1, X - a, (X - a)^2, dots.c}$, it is a basis of $P_oo$. For any vector $v in P_oo$,
  $
    v = sum_(i = 0)^n a_i X^i = sum_(i = 0)^n a_i ((X - a) + a)^i = sum_(i = 0)^n (sum_(j = 0)^i a_i binom(i, j) a^(i - j) (X - a)^j).
  $
  One can also use *Taylor expansion* to show find the coefficients of the linear combination of $1, X - a, (X - a)^2, dots.c$ that equals to $v$,
  $
    v = sum_(n = 0)^m (v^((n)) (a)) / n! (X - a)^n.
  $
]

#pagebreak()

= Linear Transformations
== Special Linear Transformations
#section(definition, subtitle: [Linear Operators])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear transformation, then $T$ is called a #concept[linear operator] on $V$.
]

#section(corollary, subtitle: [Injective, Surjective, and Bijective Linear Operators])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear operator on $V$. Then,
  $
    T "is injective" <=> "T is surjective" <=> "T is bijective".
  $
  #section(proof)[
    If $T$ is injective, then $ker(T) = {0}$, which means that $dim ker(T) = 0$. Hence, by #sref(theorem.title, <DimImgKerLinTran>), we have $"rank"(T) = dim V$. Therefore, $T$ is surjective.\
    If $T$ is surjective, then $im(T) = V$, which means that $dim im(T) = dim V$. Hence, by #sref(theorem.title, <DimImgKerLinTran>), we have $"nullity"(T) = 0$. Therefore, $T$ is injective.\
  ]
]

#section(definition, subtitle: [Scaling Transformations])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear operator on $V$. If there exists a basis ${e_1, dots.c, e_n}$ such that for all $i in {1, dots.c, n}$,
  $
    T(e_i) = lambda^i e_i,
  $
  where $lambda^i$ is a scalar for all $i in {1, dots.c, n}$. Then $T$ is called a #concept[scaling transformation] on $V$.
]

#section(theorem, subtitle: [Direct Sum Decomposition I])[
  Let $V = U plus.o W$ be a vector space and $frak(B)_U$ and $frak(B)_W$ be bases of $U$ and $W$ respectively. Then, $frak(B) = frak(B)_U union frak(B)_W$ is a basis of $V$.
  #section(proof)[
    This is a special case of #sref(theorem.title, <DimTwoSubspaces>), since $U inter W = {0}$, we have
    $
      frak(B)_(U + W) = frak(B)_U union frak(B)_W,
    $
    where $frak(B)_(U + W)$ is a basis of $U + W = V$.
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Direct Sum Decomposition])[
  Let $V = U plus.o W$ be a vector space, then for any vector $v in V$, there exists a unique vector $u in U$ and a unique vector $w in W$ such that
  $
    v = u + w.
  $
  #section(proof)[
    Let $frak(B)_U = {u_1, dots.c, u_n}$ and $frak(B)_W = {w_1, dots.c, w_m}$ be bases of $U$ and $W$ respectively.
    From the theorem above, we know that there is a basis $frak(B) = frak(B)_U union frak(B)_W$ of $V$. Since $frak(B)$ is a basis of $V$, any vector $v in V$ can be written as a linear combination of the vectors in $frak(B)$, say
    $
      v = sum_(i = 1)^n a^i u_i + sum_(j = 1)^m b^j w_j.
    $
    From the main basis theorem, we know that the representation of $v$ as a linear combination of the vectors in $frak(B)$ is unique. Moreover,
    $
      sum_(i = 1)^n a^i u_i in U, sum_(j = 1)^m b^j w_j in W,
    $
    where they correspond to a unique vector $u in U$ and a unique vector $w in W$ respectively. Hence, we have
    $
      v = u + w,
    $
    where $u$ and $w$ are unique.
    #align(right)[$qed$]
  ]
]

#section(definition, subtitle: [Projection Transformations])[
  Let $V = U plus.o W$ be a vector space. From the theorem above, we know that for any vector $v in V$, there is a unique vector $u in U$ and a unique vector $w in W$ such that $ v = u + w. $
  The linear transformation $P_U: V mapsto V$ defined by
  $
    P_U (v) = u = v - w,
  $
  is called the #concept[projection transformation] of $V$ onto $U$ along $W$.\
  #section(proof)[
    We shall show that $P_U$ is a linear transformation:\
    Consider any vectors $v_1, v_2 in V$ and any scalar $c in F$, we have
    $
      v_1 = u_1 + w_1, v_2 = u_2 + w_2.
    $
    Applying $P_U$ on $c v_1 + v_2$ we have
    $
      P_U (c v_1 + v_2) = P_U (c u_1 + c w_1 + u_2 + w_2).
    $
    Now, since $c u_1 + u_2 in U$, $c w_1 + w_2 in W$, and $c v_1 + v_2 in V$, we have
    $
      P_U (c v_1 + v_2) = c u_1 + u_2 = c P_U (v_1) + P_U (v_2).
    $
    #align(right)[$qed$]
  ]
]

#pyglue("Vectors", ```python

```)

#section(definition, subtitle: [Reflection Transformations])[
  Let $V = U plus.o W$ be a vector space. From the theorem above, we know that for any vector $v in V$, there is a unique vector $u in U$ and a unique vector $w in W$ such that $ v = u + w. $
  The linear transformation $R_U: V mapsto V$ defined by
  $
    R_U (v) = u - w,
  $
  is called the #concept[reflection transformation] of $V$ about $U$ along $W$.
  #section(proof)[
    A similar argument as the one for projection transformation can be used to show that $R_U$ is a linear transformation.
  ]
]

#pagebreak()
== Eigenvalues, Eigenvectors, and Eigenspaces
#section(definition, subtitle: [Eigenvalues and Eigenvectors])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear transformation. A scalar $lambda$ is an #concept[eigenvalue] of $T$ if there is a nonzero vector $v in V$ such that
  $
    T(v) = lambda v.
  $
  A such nonzero vector $v$ is called an #concept[eigenvector] of $T$ corresponding to the eigenvalue $lambda$.
]

#section(definition, subtitle: [Eigenspace])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear transformation. For any scalar $lambda$, the set of all eigenvectors of $T$ corresponding to $lambda$ together with the zero vector is called the #concept[eigenspace] of $T$ corresponding to $lambda$, denoted by $E_lambda$.
]

#section(theorem, subtitle: [Eigenspace is a Subspace])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear transformation. For any scalar $lambda$, the eigenspace $E_lambda$ of $T$ corresponding to $lambda$ is a subspace of $V$.
  #section(proof)[
    Since $E_lambda$ contains the zero vector, it is nonempty.\
    For any vectors $v, w in E_lambda$ and $a in F$, we have
    $
      T(a v + w) = a T(v) + T(w) = lambda a v + lambda w = lambda (a v + w).
    $
    Hence, $a v + w in E_lambda$.\
    Therefore, $E_lambda$ is a subspace of $V$.
    #align(right)[$qed$]
  ]
]

#section(corollary, subtitle: [Eigenspaces of Different Scalars])[
  Let $lambda_1 != lambda_2$ be two scalars and $E_(lambda_1)$ and $E_(lambda_2)$ be the eigenspaces of a linear transformation $T: V mapsto V$ corresponding to $lambda_1$ and $lambda_2$ respectively. Then, we have
  $
    E_(lambda_1) inter E_(lambda_2) = {0}.
  $
  #section(proof)[
    Let $v in V$ and $v in E_(lambda_1) inter E_(lambda_2)$, then we have
    $
      T(v) = lambda_1 v = lambda_2 v.
    $
    This only holds if $v = 0$. Hence, we have
    $
      E_(lambda_1) inter E_(lambda_2) = {0}.
    $
  ]
]

#section(convention, subtitle: [Eigenspaces Containing Zero Only])[
  Let $E_lambda$ be the eigenspace of a linear transformation $T: V mapsto V$ corresponding to a scalar $lambda$. If $E_lambda$ contains only the zero vector, then we shall exclude $lambda$ from the set of eigenvalues of $T$ and exclude $E_lambda$ from the set of eigenspaces of $T$.
]

#section(theorem, subtitle: [Eigenspaces of a Scaling])[
  Let $T: V mapsto V$ be a linear transformation, it is a scaling transformation if and only if there is $Lambda = {lambda^1, dots.c, lambda^m} subset.eq F$ such that
  $
    V = plus.o.big_(lambda^i in Lambda) E_(lambda^i).
  $
  #section(proof)[
    Let $T$ be scaling transformation, then there is a basis ${e_1, dots.c, e_n}$ such that for all $i in {1, dots.c, n}$,
    $
      T(e_i) = lambda^i e_i.
    $
    For any vector $v in V$, we have
    $
      v = sum_(i = 1)^n u^i e_i.
    $
    But for all $i in {1, dots.c, n}$, we have
    $
      e_i in E_(lambda^i).
    $
    This means that $v in plus.o.big_(lambda^i in Lambda) E_(lambda^i)$, which shows that
    $
      V subset.eq plus.o.big_(lambda^i in Lambda) E_(lambda^i).
    $
    Since $E_(lambda^i) subset.eq V$ for all $i in {1, dots.c, n}$, we have
    $
      V = plus.o.big_(lambda^i in Lambda) E_(lambda^i).
    $
    Now let's show that if there is $Lambda = {lambda^1, dots.c, lambda^m} in F$ such that
    $
      V = plus.o.big_(lambda^i in Lambda) E_(lambda^i),
    $
    then $T$ is a scaling transformation:\
    Let $frak(B)_(lambda^i)$ be the basis of $E_(lambda^i)$ for all $i in {1, dots.c, n}$. From the theorem above, we know that
    $
      frak(B) = union.big_(lambda^i in Lambda) frak(B)_(lambda^i) = {e_1, dots.c, e_n},
    $
    is a basis of $V$. However, from the way that we construct $frak(B)$, we have
    $
      T(e_i) = lambda^i e_i,
    $
    hence, $T$ is a scaling transformation.
  ]
]

#section(corollary, subtitle: [Projection's Eigenspaces])[
  Let $P_U$ be a projection transformation of $V = U plus.o W$, then $E_1 = U$, $E_0 = W$, and $V = E_1 plus.o E_0$.
]

#section(definition, subtitle: [Diagonalization])[
  Let $T$ be a linear operator on a vector space $V$ and $frak(B)$ be a basis of $V$. Then $T$ is called #concept[diagonalizable] if the matrix $[bold(T)]_frak(B)$ associated with $T$ can be expressed as
  $
    [bold(T)]_frak(B) = bold(Q) bold(D) bold(Q)^(-1),
  $
  where $bold(D)$ is a diagonal matrix and $bold(Q)$ is an invertible matrix.
]

#section(theorem, subtitle: [Scaling and Diagonalization])[
  Let $T$ be a linear operator on a vector space $V$. If $T$ is a scaling transformation, then $T$ is diagonalizable.
  #section(proof)[
    Let $frak(B)$ be a basis of $V$, and $cal(V) = {e_1, dots.c, e_n}$ be the basis of $V$ such that for all $i in {1, dots.c, n}$,
    $
      T(e_i) = lambda^i e_i.
    $
    If we express $T$ with respect to the basis $cal(V)$, then we have
    $
      [bold(T)]_cal(V) = bold(D),
    $
    where $bold(D)$ is a diagonal matrix with the diagonal entries being $lambda^1, dots.c, lambda^n$. Consider the basis changing matrix $bold(Q)$ from $cal(V)$ to $frak(B)$, then we have
    $
      [bold(T)]_frak(B) = bold(Q) [bold(T)]_cal(V) bold(Q)^(-1) = bold(Q) bold(D) bold(Q)^(-1).
    $

  ]
]

It is important to note that *invertible* and *diagonalizable* are two different properties of linear transformations. Whether a linear transformation is *invertible* depends on whether it brings *non-zero vectors* to *zero*, while *diagonalizability* depends on whether the linear transformation *can be described as purely scaling, even if it may scale a basis to zero*. Hence, a linear transformation can be diagonalizable but not invertible, and vice versa.\
For instance, let's consider the linear transformation $T$ defined by the matrix
$
  [bold(T)]_cal(V) = mat(
    1, 0;
    0, 0
  )
$
It is clear that $T$ is not invertible. However, $T$ is diagonalizable, since $[bold(T)]_cal(V)$ is already a diagonal matrix. It can be decomposed as
$
  I_cal(V) [bold(T)]_cal(V) I_cal(V)^(-1) = [bold(T)]_cal(V).
$
On the other hand, the *shear transformation* defined by the matrix
$
  [bold(S)]_cal(V) = mat(
    1, 1;
    0, 1
  )
$
is invertible. However, $S$ is not diagonalizable. If we where to consider the equation
$
  [bold(S)]_cal(V) vec(x, y)_cal(V) = vec(x + y, y)_cal(V) = lambda vec(x, y)_cal(V),
$
we can see that $lambda$ can only takes $1$ as eigenvalue, so that $y = lambda y$ makes sense. Then, the respective eigenspaces are
$
  E_1 = {vec(x, 0)_cal(V) : x in F}.
$
$E_1$ does not equal to $V$. Hence, $S$ is not diagonalizable. This means that $S$ performed some transformation that can not be explained by purely scaling, even though it is invertible.\

#section(theorem, subtitle: [Triangular Matrix])[
  Let $bold(T)$ be a upper triangular matrix. Then, $bold(T)$'s eigenvalues are the entries on the diagonal of $bold(T)$.
]
