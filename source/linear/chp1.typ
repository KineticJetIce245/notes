#import "env.typ": concept, convention, corollary, definition, lemma, proof, pyglue, section, sref, theorem
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
