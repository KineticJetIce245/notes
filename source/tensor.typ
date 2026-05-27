#set page(height: auto)
#set par(justify: true)
#set math.mat(delim: "[")
= What is a Tensor
== Free Space and Tensor Product
We are allowed to perform additions and multiplications on vectors. A natural question is whether we can perform a multiplication of two vectors. It is, however, unintuitive to imagine the result of such multiplication. Therefore, we would first define the *free vector space*, by just _stapling_ two vectors together as the result of the multiplications. Then, we will see how to make sense of the result.
=== Free Space
Let $V$ and $W$ be two vector spaces with the field $F$. The *free vector space* arising from the *Cartesian product* of $V$ and $W$ is a vector space taking *every distinct pair of vectors* from $V$ and $W$ as the basis. It is denoted by $F(V times W)$.\
A typical element of the free vector space has the following form:
$
  bold(T) = sum_(i=1)^n t_i (v_i, w_i),
$
given that $t_i in F$, $v_i in V$, and $w_i in W$ for all $i$ and that the pairs $(v_i, w_i)$ are distinct.\
Although the free vector space successfully defines the multiplication: the product of two vectors $v in V$ and $w in W$ is just the pair $(v, w)$, it does not have any nice properties, such as
$
  (a v, w) = a (v, w),
$
for $a in F$, $v in V$, and $w in W$.
But in the free vector space, if $a v != v$, then $a (v, w)$ is not the same as $(a v, w)$.\
=== Bilinearity
Let's list out the desirable properties of the multiplication of two vectors:
+ Some sort of distributivity:
  + $(v_1 + v_2, w) = (v_1, w) + (v_2, w)$
  + $(v, w_1 + w_2) = (v, w_1) + (v, w_2)$
+ Property of scalar multiplication:
  + $(a v, w) = a (v, w)$
  + $(v, a w) = a (v, w)$
Together, these properties are called *bilinearity*. In order to make these equalities hold, we take the *quotient space* of the free vector space by setting some elements to be $0$.
=== Quotient Space and Subspace
To understand what is a *quotient space*, let's first start with a general vector space $V$ and it's subset $N$. The quotient space of $V$ by $N$, denoted by $V \/ N$, instead of containing the elements of $V$, contains the *cosets*.
The coset of $v in V$ is the set of all the elements of $V$ that can be obtained by adding an element of $N$ to $v$, denoted by $v + N$. In other words, the coset of $v$ is the set
$
  v + N = {v + n | n in N}.
$
That is, $V \/ N$ is the set of all $v + N$ for $v in V$.\
We also need to define the *equivalence relation* on $V \/ N$ as follows: for $v_1 + N, v_2 + N in V \/ N$, we say that $v_1 + N$ is equivalent to $v_2 + N$ if $v_1 - v_2 in N$. In other words,
$
  v_1 + N = v_2 + N "if and only if" v_1 - v_2 in N.
$
Now, one can show that if $N$ is a *subspace* of $V$, then $V \/ N$ is a vector space. To do so, we can define the addition and scalar multiplication of the quotient space as follows:
$
  (v_1 + N) + (v_2 + N) = (v_1 + v_2) + N "and" a(v + N) = (a v) + N.
$
+ *Well-definedness of addition and scalar multiplication*:\
  Since we *redefined* the *equivalence relation* on $V \/ N$, we need to show that the addition and scalar multiplication of the quotient space are *well-defined*, that is, if $v_1 + N, v_2 + N, v_1^' + N, v_2^' + N in V \/ N$ and $a in F$ such that $v_1 + N = v_1^' + N$ and $v_2 + N = v_2^' + N$, then
  $ (v_1 + v_2) + N = (v_1^' + v_2^') + N $ and $ (a v) + N = (a v') + N. $
  To show this, consider
  $
    (v_1 + v_2) - (v_1^' + v_2^') = (v_1 - v_1^') + (v_2 - v_2^').
  $
  Since $N$ is a subspace, we have $v_1 - v_1^' in N$ and $v_2 - v_2^' in N$, which implies that $(v_1 + v_2) - (v_1^' + v_2^') in N$. This shows that $ (v_1 + v_2) + N = (v_1^' + v_2^') + N. $
  Similarly, consider
  $
    a v - a v' = a (v - v').
  $
  Since $N$ is a subspace, we have $v - v' in N$, which implies that $a (v - v') in N$. This shows that $ (a v) + N = (a v') + N. $
  Hence, the addition and scalar multiplication of the quotient space are well-defined.

+ *Closure of addition and scalar multiplication*:\
  We have to show that if $v_1 + N, v_2 + N in V \/ N$ and $a in F$, then
  $ (v_1 + v_2) + N in V \/ N $ and $ (a v) + N in V \/ N. $
  This is true because $v_1 + v_2 in V$ and $a v in V$.
+ *Associativity of addition*:\
  We have to show that if $v_1 + N, v_2 + N, v_3 + N in V \/ N$, then
  $ v_1 + N + (v_2 + N + v_3 + N) = (v_1 + N + v_2 + N) + v_3 + N. $
  We can show that both sides are equal to $(v_1 + v_2 + v_3) + N$.
  $
    v_1 + N + (v_2 + N + v_3 + N) = v_1 + N + (v_2 + v_3) + N = (v_1 + v_2 + v_3) + N,
  $
  and
  $
    (V_1 + N + v_2 + N) + v_3 + N = (v_1 + v_2) + N + v_3 + N = (v_1 + v_2 + v_3) + N.
  $
  This shows that the addition of the quotient space is associative.
+ *Commutativity of addition*:\
  We have to show that if $v_1 + N, v_2 + N in V \/ N$, then
  $ v_1 + N + v_2 + N = v_2 + N + v_1 + N. $
  We can show that both sides are equal to $(v_1 + v_2) + N$.
  $
    v_1 + N + v_2 + N = (v_1 + v_2) + N,
  $
  and
  $
    v_2 + N + v_1 + N = (v_2 + v_1) + N = (v_1 + v_2) + N.
  $
  This shows that the addition of the quotient space is commutative.
+ *Existence of additive identity*:\
  We have to show that there exists an element $0_(V \/ N) in V \/ N$ such that for any $v + N in V \/ N$, we have
  $ v + N + 0_(V \/ N) = v + N. $
  This is true because $0 + N$ is a coset in $V \/ N$ and
  $
    v + N + 0 + N = (v + 0) + N = v + N.
  $
+ *Existence of additive inverse*:\
  We have to show that for any $v + N in V \/ N$, there exists an element $-(v + N) in V \/ N$ such that
  $ v + N + (-(v + N)) = 0_(V \/ N). $
  This is true because $-v + N$ is a coset in $V \/ N$ and
  $
    v + N + (-v) + N = (v - v) + N = 0 + N.
  $
+ *Compatibility of scalar multiplication with field multiplication*:\
  We have to show that if $a, b in F$ and $v + N in V \/ N$, then
  $ a(b(v + N)) = (a b)(v + N). $
  This is true because
  $
    a(b(v + N)) = a((b v) + N) = (a b v) + N = (a b)(v + N).
  $
+ *Distributivity of scalar multiplication with respect to vector addition*:\
  We have to show that if $a in F$ and $v_1 + N, v_2 + N in V \/ N$, then
  $ a((v_1 + N) + (v_2 + N)) = a(v_1 + N) + a(v_2 + N). $
  This is true because
  $
    & a((v_1 + N) + (v_2 + N)) = a((v_1 + v_2) + N) \
    & = (a(v_1 + v_2)) + N = (a v_1 + a v_2) + N = a(v_1 + N) + a(v_2 + N).
  $
+ *Distributivity of scalar multiplication with respect to field addition*:\
  We have to show that if $a, b in F$ and $v + N in V \/ N$, then
  $ (a + b)(v + N) = a(v + N) + b(v + N). $
  This is true because
  $
    (a + b)(v + N) = ((a + b) v) + N = (a v + b v) + N = a(v + N) + b(v + N).
  $

=== Tensor Product
Now, let's return to the free vector space $F(V times W)$. We want to make the bilinearity properties hold. To do so, let's consider the set all the elements of the free vector space in the following forms:
+ $(v_1 + v_2, w) - (v_1, w) - (v_2, w)$
+ $(v, w_1 + w_2) - (v, w_1) - (v, w_2)$
+ $(a v, w) - a (v, w)$
+ $(v, a w) - a (v, w)$
#v(-0.5em)
and *their linear combinations*, with $v, v_1, v_2 in V$, $w, w_1, w_2 in W$, and $a in F$. This set is a subspace of the free vector space, denoted by $N$. Then, we can take the quotient space of the free vector space by $N$, denoted by $F(V times W) \/ N$.\
We showed that the quotient space of a vector space by it's subspace is a vector space. Therefore, $F(V times W) \/ N$ is a vector space, denoted by $V times.o W$, called the *tensor product* of $V$ and $W$. Instead of writing $(v,w)$, we write $v times.o w$ to denote the product of $v in V$ and $w in W$.\

== Properties of Tensor Product
=== Decomposition of Tensors
Let $V$ and $W$ be two vector spaces with the field $F$. Let ${v_i}_(i in I)$ and ${w_j}_(j in J)$ be two bases of $V$ and $W$, respectively. Then, the set ${v_i times.o w_j}_(i in I, j in J)$ is a basis of the tensor product $V times.o W$.\
To show this, consider an element $t in F(V times W) \/ N$, from the definition of the quotient space,
$
  t = t' + N
$
for some $t' in F(V times W)$. Thus, we can decompose $t'$ as follows:
$
  t' = sum_(i=1)^n t^'_i (cal(v)_i, cal(w)_i),
$
where $t^'_i in F$, $cal(v)_i in V$, and $cal(w)_i in W$ for all $i$ and that the pairs $(cal(v)_i, cal(w)_i)$ are distinct. Therefore,
$
  t = sum_(i=1)^n t^'_i (cal(v)_i, cal(w)_i) + N
$
From the definition of vector addition in the quotient space, we have
$
  t = sum_(i=1)^n t^'_i ((cal(v)_i, cal(w)_i) + N).
$
Then, since $cal(v)_i$ and $cal(w)_i$ can be decomposed as linear combinations of the basis vectors, we have
$
  t = sum_(i=1)^n t^'_i ((sum_(k in I) a_(i, k) v_k, sum_(l in J) b_(i, l) w_l) + N),
$
From the bilinearity properties, we have
$
  t = & sum_(i=1)^n t^'_i (sum_(k in I) sum_(l in J) a_(i, k) b_(i, l) (v_k, w_l) + N) \
    = & sum_(i=1)^n sum_(k in I) sum_(l in J) t^'_i a_(i, k) b_(i, l) ((v_k, w_l) + N) \
$
but since $v_k times.o w_l$ is just $(v_k, w_l) + N$, we have
$
  t = sum_(i=1)^n sum_(k in I) sum_(l in J) t^'_i a_(i, k) b_(i, l) v_k times.o w_l.
$
This shows that any element of the tensor product can be decomposed as a linear combination of the basis vectors in ${v_i times.o w_j}_(i in I, j in J)$.\
In general, an element of the tensor product is written in the following form:
$
  t = sum_(i in I) sum_(j in J) T^(i j) (v_i times.o w_j).
$

=== Concrete Example of Tensor Product
Consider the vector space $RR^2$ with the standard basis $e_1 = (1, 0)$ and $e_2 = (0, 1)$. Then, the tensor product $RR^2 times.o RR^2$ has the following basis:
$
  e_1 times.o e_1, e_1 times.o e_2, e_2 times.o e_1, e_2 times.o e_2.
$
One can show that $RR^2 times.o RR^2$ is isomorphic to $RR^4$ or a vector space of $2 times 2$ real matrices.\

=== Chained Tensor Products
Now, we have defined tensor as the product of two vectors, what about the product between a tensor and a vector or the product between two tensors?\
Consider three vector spaces $U$, $V$, and $W$ with the field $F$ and the tensor product
$
  (U times.o V) times.o W "and" U times.o (V times.o W).
$
If ${u_i}_(i in I)$, ${v_j}_(j in J)$, and ${w_k}_(k in K)$ are bases of $U$, $V$, and $W$, respectively, then the set ${u_i times.o v_j}_(i in I, j in J)$ are the basis of $U times.o V$. Therefore, a typical element of $(U times.o V) times.o W$ has the following form:
$
  t = sum_(i in I) sum_(j in J) sum_(k in K) T^(i j k) ((u_i times.o v_j) times.o w_k).
$
Similarly, we can define the tensor product $U times.o (V times.o W)$ and a typical element of it has the following form:
$
  s = sum_(i in I) sum_(j in J) sum_(k in K) S^(i j k) (u_i times.o (v_j times.o w_k)).
$
Consider the tensor product of $u$, $v$, and $w$, where $u in U$, $v in V$, and $w in W$. We have
$
  (u times.o v) times.o w = (sum_(i in I) a_i u_i times.o sum_(j in J) b_j v_j) times.o sum_(k in K) c_k w_k = sum_(i in I) sum_(j in J) sum_(k in K) a_i b_j c_k ((u_i times.o v_j) times.o w_k)
$
and
$
  u times.o (v times.o w) = sum_(i in I) a_i u_i times.o (sum_(j in J) b_j v_j times.o sum_(k in K) c_k w_k) = sum_(i in I) sum_(j in J) sum_(k in K) a_i b_j c_k (u_i times.o (v_j times.o w_k)).
$
This shows that these tensor products are *canonically isomorphic*, that is, there is a *natural* isomorphism between $(U times.o V) times.o W$ and $U times.o (V times.o W)$ such that the tensor product of $u$, $v$, and $w$ is the same in both spaces. Therefore,
$
  (U times.o V) times.o W tilde.equiv U times.o (V times.o W).
$

=== Mulitlinearity
Since $(U times.o V) times.o W$ is isomorphic to $U times.o (V times.o W)$, the intuition is that we can somehow remove the parentheses and write the tensor product as $U times.o V times.o W$. However, notice that as $(U times.o V) times.o W$ and $U times.o (V times.o W)$ produce different mathematical objects, $U times.o V times.o W$ does not have a well-defined meaning. Therefore, we cannot just write $U times.o V times.o W$ without any clarification. We need a proper definition for multiple tensor products.\

Consider the vector spaces $V_1, dots.c, V_n$ with the field $F$. We can define the *free vector space* arising from the Cartesian product of $V_1, dots.c, V_n$, denoted by $F(V_1 times dots.c times V_n)$, as the vector space taking every distinct $n$-tuple of vectors from $V_1, dots.c, V_n$ as the basis.\
Again we are interested in the following properties of the multiplication of $n$ vectors:
+ $(v_1, dots.c, x + y, dots.c, v_n) = (v_1, dots.c, x, dots.c, v_n) + (v_1, dots.c, y, dots.c, v_n)$
+ $(v_1, dots.c, k x, dots.c, v_n) = k (v_1, dots.c, x, dots.c, v_n)$
#v(-0.5em)
where $v_i in V_i$ for all $i$; $x, y in V_j$ for some $j$, and $k in F$. The above properties are called *multilinearity*.\
With the same idea as the tensor product of two vector spaces, we can take the quotient space of the free vector space by the subspace $N$ generated by all the elements in the above forms and their linear combinations. The resulting quotient space is called the *tensor product* of $V_1, dots.c, V_n$, denoted by $V_1 times.o dots.c times.o V_n$ or
$
  times.o.big_(i=1)^n V_i.
$
Since $F(V_1 times dots.c times V_n) \/ N$ is a quotient space of a vector space by its subspace, it is a vector space.\

In the same way as the tensor product of two vector spaces, we can show that a typical element of the tensor product of $n$ vector spaces has the following form:
$
  t = sum_(i_1 in I_1) sum_(i_2 in I_2) dots.c sum_(i_n in I_n) T^(i_1 i_2 dots.c i_n) (v_(i_1)^1 times.o v_(i_2)^2 dots.c times.o v_(i_n)^n),
$
where ${v_i^j}_(i in I_j)$ is a basis of $V_j$ for all $j$. That is, the set
$
  {v_(i_1)^1 times.o v_(i_2)^2 dots.c times.o v_(i_n)^n}_(i_1 in I_1, i_2 in I_2, dots.c, i_n in I_n)
$
is a basis of the tensor product of $n$ vector spaces.\

Now, consider $u times.o v times.o w$, where $u in U$, $v in V$, and $w in W$. We have
$
  u times.o v times.o w = sum_(i in I) a_i u_i times.o sum_(j in J) b_j v_j times.o sum_(k in K) c_k w_k = sum_(i in I) sum_(j in J) sum_(k in K) a_i b_j c_k (u_i times.o v_j times.o w_k).
$
This shows that all three different tensor products, $(U times.o V) times.o W$, $U times.o (V times.o W)$, and $U times.o V times.o W$ are all *canonically isomorphic*, that is,
$
  U times.o V times.o W tilde.equiv (U times.o V) times.o W tilde.equiv U times.o (V times.o W).
$
Moreover, as the result of the tensor product of $u$, $v$, and $w$ generates the same coordinates for corresponding basis vectors in all three spaces, the *particular result* of the tensor product of $u$, $v$, and $w$ is the same in all three spaces. Therefore, we can write
$
  u times.o v times.o w tilde.equiv (u times.o v) times.o w tilde.equiv u times.o (v times.o w).
$
Thus, any operations performed between different tensor products of $u$, $v$, and $w$ can be performed by first transforming the tensors through the isomorphic mapping into the same space and then performing the operations.\
For instance, if we want to add elements between $(U times.o V) times.o W$ and $U times.o (V times.o W)$, we can first transform the elements in $(U times.o V) times.o W$ into $U times.o (V times.o W)$ through the isomorphic mapping and then perform the addition.\

=== Simple Tensors
Consider the tensor product of $n$ vector spaces $V_1, dots.c, V_n$ with the field $F$. A *simple tensor* is an element of the form $v_1 times.o v_2 dots.c times.o v_n$ where $v_i in V_i$ for all $i$.\

One can find *a sets of simple tensors* that spans the tensor product of $n$ vector spaces. For instance, if ${v_i^j}_(i in I_j)$ is a basis of $V_j$ for all $j$, then the set

=== Universal Property of Tensor Product
The *universal property* of the tensor product states that for any vector space $X$ and any *multilinear map* $f : V_1 times dots.c times V_n mapsto X$, there exists a *unique linear map* $g : V_1 times.o dots.c times.o V_n mapsto X$ such that
$
  f = g compose phi,
$
where $phi : V_1 times dots.c times V_n mapsto V_1 times.o dots.c times.o V_n$ defined by $phi(v_1, dots.c, v_n) = v_1 times.o dots.c times.o v_n$ for all $v_i in V_i$ for all $i$.\
To prove this, consider the free vector space $F(V_1 times dots.c times V_n)$. Since $f$ is a multilinear map, we can extend $f$ to a linear map $tilde(f) : F(V_1 times dots.c times V_n) mapsto X$ by defining it as follows:
$
  tilde(f) (sum_(i = 1)^k t_k (v_k^1, v_k^2 dots.c, v_k^n)) = sum_(i = 1)^k t_k f(v_k^1, v_k^2 dots.c, v_k^n),
$
where $v_k^j in V_j$ for all $j$ and $t_k in F$ for all $k$.\
+ Let's first show that if $n in N$, the subspace generated in the process of building the tensor product, then $ tilde(f)(n) = 0. $ From the definition of $N$, we know that $n$ is a linear combination of the following elements:
  + $(v_1, dots.c, x + y, dots.c, v_n) - (v_1, dots.c, x, dots.c, v_n) - (v_1, dots.c, y, dots.c, v_n)$
  + $(v_1, dots.c, k x, dots.c, v_n) - k (v_1, dots.c, x, dots.c, v_n)$
  #v(-0.5em)
  where $v_i in V_i$ for all $i$; $x, y in V_j$ for some $j$, and $k in F$. Let's represent those elements as $e_i$, then $n$ can be written as
  $
    n = sum_(i=1)^m n_i e_i.
  $
  Hence, we have
  $
    tilde(f)(n) = tilde(f)(sum_(i=1)^m n_i e_i) = sum_(i=1)^m n_i tilde(f)(e_i).
  $
  However, for any particular $e_i$, we have
  $
    tilde(f)(e_i) = f((v_1, dots.c, x + y, dots.c, v_n)) - f((v_1, dots.c, x, dots.c, v_n)) - f((v_1, dots.c, y, dots.c, v_n)) = 0,
  $
  or
  $
    tilde(f)(e_i) = f((v_1, dots.c, k x, dots.c, v_n)) - k f((v_1, dots.c, x, dots.c, v_n)) = 0
  $
  because $f$ is a multilinear map. Therefore, we have $tilde(f)(n) = 0$.
+ Now we claim that the desire $g$ is then given by
  $
    g(t + N) = tilde(f)(t),
  $
  where $t in F(V_1 times dots.c times V_n)$.\
  Again, as we *altered* the *equivalence relation* on $F(V_1 times dots.c times V_n) \/ N = times.o.big_(i=1)^n V_i$,we have to check whether $g$ is well-defined. To do so, consider $ t_1 + N, t_2 + N in times.o.big_(i=1)^n V_i $ such that $t_1 + N = t_2 + N$. Then, we have $t_1 - t_2 in N$.
  $
    g(t_1 + N) & = g(t_2 + (t_1 - t_2) + N) \
               & = tilde(f)(t_2 + (t_1 - t_2)) \
               & = tilde(f)(t_2) + tilde(f)(t_1 - t_2) \
  $
  But $t_1 - t_2 in N$, so $tilde(f)(t_1 - t_2) = 0$. Therefore, we have
  $
    g(t_1 + N) = tilde(f)(t_2) = g(t_2 + N).
  $
  This shows that $g$ is well-defined.\
+ Let's show that $g$ satisfies the desired property, that is, for any $v_i in V_i$ for all $i$, we have
  $
    g compose phi(v_1, dots.c, v_n) = f(v_1, dots.c, v_n).
  $
  From the definition of $phi$ and that $g$ is well-defined, we have
  $
    g compose phi(v_1, dots.c, v_n) = g(v_1 times.o dots.c times.o v_n) = g((v_1, dots.c, v_n) + N) = tilde(f)(v_1, dots.c, v_n) = f(v_1, dots.c, v_n).
  $
  This shows that $g compose phi = f$.
+ Let's show that $g$ is a linear map. Consider $t_1 + N, t_2 + N in times.o.big_(i=1)^n V_i$ and $a in F$. Then, we have
  $
    g((t_1 + N) + (t_2 + N)) & = g((t_1 + t_2) + N) = tilde(f)(t_1 + t_2) = tilde(f)(t_1) + tilde(f)(t_2) \
                             & = g(t_1 + N) + g(t_2 + N),
  $
  and
  $
    g(a(t + N)) & = g((a t) + N) = tilde(f)(a t) = a tilde(f)(t) = a g(t + N).
  $
  This shows that $g$ is a linear map.\
+ Let's show that $g$ is the unique linear map such that $g compose phi = f$. Suppose that there exists another linear map $g^' : times.o.big_(i=1)^n V_i mapsto X$ such that $g^' compose phi = f$.
  Consider a *particular basis vector* of $times.o.big_(i=1)^n V_i$, say
  $
    v_1 times.o v_2 dots.c times.o v_n in {v_(i_1)^1 times.o v_(i_2)^2 dots.c times.o v_(i_n)^n}_(i_1 in I_1, i_2 in I_2, dots.c, i_n in I_n),
  $
  where ${v_i^j}_(i in I_j)$ is a basis of $V_j$ for all $j$.
  Then, we have
  $
    g compose phi(v_1, dots.c, v_n) = g(v_1 times.o dots.c times.o v_n) = f(v_1, dots.c, v_n) = g^' compose phi(v_1, dots.c, v_n) = g^' (v_1 times.o dots.c times.o v_n).
  $
  Since this holds for any basis vector of $times.o.big_(i=1)^n V_i$ and both $g$ and $g^'$ are linear maps, $g$ must be the same as $g^'$. Therefore, $g$ is the unique linear map such that $g compose phi = f$.

== Dual Space
=== Dual Space of a Vector Space
The *dual space* of a vector space $V$ with the field $F$, denoted by $V^*$, is the vector space of all linear maps from $V$ to $F$.
To show that $V^*$ is a vector space, we can define the addition and scalar multiplication of $V^*$ as follows: for $f, g in V^*$ and $a in F$,
$
  (f + g)(v) = f(v) + g(v) "and" (a f)(v) = a (f(v)).
$
The axiom of vector spaces are automatically satisfied by $V^*$ because the addition and scalar multiplication of $V^*$ are defined in terms of the addition and scalar multiplication of $F$.\

The *basis* of $V^*$ is called the *dual basis* of the basis of $V$. To find a such basis, consider
$
  v^* (v) = v^* (sum_(i in I) v_i e_i) = sum_(i in I) v_i v^* (e_i),
$
where $v in V$, $v_i in F$ for all $i$, and ${e_i}_(i in I)$ is a basis of $V$ and $v^* in V^*$. Consider a linear combination of $v^*$, say
$
  v^* = sum_(j in J) v^*_j f_j,
$
where $v^*_j in F$ and $f_j in V^*$ for all $j$. Then, we have
$
  v^* (v) = sum_(j in J) v^*_j f_j (sum_(i in I) v_i e_i) = sum_(j in J) sum_(i in I) v^*_j v_i f_j (e_i).
$
Now the claim is that if we define $f_j$ as follows:
$
  f_j (e_i) = cases(1", if" i = j, 0", if" i != j),
$
then the set ${f_j}_(j in I)$ is a basis of $V^*$. To show this, we need to show that ${f_j}_(j in I)$ is linearly independent and spans $V^*$.\
+ ${f_j}_(j in I)$ spans $V^*$:\
  Since $v^* (e_j)$ are just scalars for all $j$, we define $v^*_j = v^* (e_j)$. Then, we have
  $
    v^* (v) = sum_(i in I) v_i v^* (e_i) =sum_(i in I) sum_(j in I) v_i v^*_j f_j (e_i) = sum_(j in I) v^*_j f_j (sum_(i in I) v_i e_i) = sum_(j in I) v^*_j f_j (v).
  $
  This shows that ${f_j}_(j in I)$ spans $V^*$.
+ Independence of ${f_j}_(j in I)$:\
  First, let's show that the zero vector of $V^*$ is the zero map, that is, the map that sends every vector in $V$ to $0$. For any $v^* in V^*$ and $v in V$, we have
  $
    v^* (v) = (v^* + 0) (v) = v^* (v) + 0 (v) = v^* (v) + 0
  $
  This is enough to show that $0 (v) = 0$ for all $v in V$.\
  Now, consider a linear combination of ${f_j}_(j in I)$, say
  $
    sum_(j in I) v^*_j f_j = 0,
  $
  where $v^*_j in F$ for all $j$. Then, the only possible way for the above linear combination to be the zero map is that $v^*_j = 0$ for all $j$. If some particular $v^*_k != 0$, then we have
  $
    sum_(j in I) v^*_j f_j (e_k) = v^*_k f_k (e_k) = v^*_k != 0.
  $
  This shows that ${f_j}_(j in I)$ is linearly independent.
As ${f_j}_(j in I)$ contains the same number of vectors as the basis of $V$, the dimension of $V^*$ is the same as the dimension of $V$ (the above proof is based on the assumption that $V$ is finite-dimensional). Therefore, the dual space of $V$ is isomorphic to $V$ itself, that is, $V^* tilde.equiv V$.

=== Dual Space of a Dual Space
One can also define the dual space of the dual space of $V$, denoted by $V^(**)$. The elements of $V^(**)$ are linear maps from $V^*$ to $F$. One can show that $V^(**)$ is *canonically isomorphic* to $V$ itself, for this reason, we will practically treat $V$ as the dual of $V^*$.

== Contracting Tensors
Although we defined previously tensor products between two arbitrary vector spaces, we are particularly interested in the tensor product between a vector space and its dual space, that is, $V times.o V^*$. This is useful because it allows us to define the *contraction* of a tensor.\

Let's start with a concrete example, consider $RR^2 times.o (RR^2)^*$. This particular tensor product is called *rank(1,1) tensor*, in general, a tensor product
$
  T^m_n (V) = underbrace(V times.o dots.c times.o V, m) times.o underbrace(V^* times.o dots.c times.o V^*, n)
$
is called *rank(m,n) tensor*.\
Let $e_1, e_2$ be the standard basis of $RR^2$ and $e^1, e^2$ be the dual basis of $e_1, e_2$, that is
$
  e^i (e_j) = cases(1", if" i = j, 0", if" i != j),
$
condensed notation for the above is $e^i (e_j) = delta^i_j$, called the *Kronecker delta*.\
Then, the set
$
  {e_i times.o e^j}_(i, j = 1, 2)
$
are the basis of $RR^2 times.o (RR^2)^*$. Thus, a typical element of $RR^2 times.o (RR^2)^*$ has the following form:
$
  T = sum_(i=1)^2 sum_(j=1)^2 T^(i)_j (e_i times.o e^j),
$
or, in *Einstein summation convention*, we can write
$
  T = T^i_j (e_i times.o e^j).
$
Here, the *Einstein summation convention* is a notation that we will sum over any index appeared both as upper and lower indices. For instance, $v_i e^i = sum_(i=1)^n v_i e^i.$\
We know that $RR^2 times.o (RR^2)^*$ is isomorphic to the vector space of $2 times 2$ real matrices. Hence, we can represent $T$ as a $2 times 2$ matrix as follows:
$
  T = T^i_j (e_i times.o e^j) tilde.equiv mat(
    T^1_1, T^1_2;
    T^2_1, T^2_2
  ) = bold(T).
$
The *contraction* of $T$ evaluates the tensor product by the duality between $RR^2$ and $(RR^2)^*$. In particular, the contraction of $T = T^i_j (e_i times.o e^j)$ is defined as follows:
$
  C(T) = C(T^i_j (e_i times.o e^j)) = T^i_j C(e_i times.o e^j) = T^i_j e^j (e_i).
$
Since $e^j (e_i) = delta^j_i$, the only terms that survive in the above summation are those with $i = j$. Therefore, we have
$
  C(T) = T^i_i = sum_(i=1)^2 T^i_i = "tr"(bold(T)).
$
The contraction of $T$ is just the *trace of the matrix* representation of $T$.
=== Contraction of Tensors
The *contraction operator* $C^k_l$ acts on a rank(m,n) *simple tensor*
$
  v = (v^1 times.o dots.c times.o v^m times.o v_1 times.o dots.c times.o v_j)
$
by evaluating the $k$-th upper index and the $l$-th lower index. In particular, we have
$
  C^k_l (v) = v^k (v_l) (v^1 times.o dots.c times.o hat(v^k, size: #150%) times.o dots.c times.o v^m times.o v_1 times.o dots.c times.o hat(v_l, size: #150%) times.o dots.c times.o v_j),
$
where $hat(v^k, size: #150%)$ and $hat(v_l, size: #150%)$ means that $v^k$ and $v_l$ are removed from the tensor product.\
=== Multiplication of Matrix
