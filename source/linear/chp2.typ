#import "env.typ": concept, convention, corollary, definition, lemma, proof, pyglue, section, sref, theorem
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
