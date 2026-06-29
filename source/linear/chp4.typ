#import "env.typ": concept, convention, corollary, definition, lemma, proof, pyglue, section, sref, theorem
= Linear Transformations
== Special Linear Transformations
#section(definition, subtitle: [Linear Operators])[
  Let $V$ be a vector space and $T: V mapsto V$ be a linear transformation, then $T$ is called a #concept[linear operator] on $V$.
]

#section(corollary, subtitle: [Injective, Surjective, and Bijective Linear Operators])[
  Let $V$ be a vector space and $T$ be a linear operator on $V$. Then,
  $
    T "is injective" <=> "T is surjective" <=> "T is bijective".
  $
  #section(proof)[
    If $T$ is injective, then $ker(T) = {0}$, which means that $dim ker(T) = 0$. Hence, by #sref(theorem.title, <DimImgKerLinTran>), we have $"rank"(T) = dim V$. Therefore, $T$ is surjective.\
    If $T$ is surjective, then $im(T) = V$, which means that $dim im(T) = dim V$. Hence, by #sref(theorem.title, <DimImgKerLinTran>), we have $"nullity"(T) = 0$. Therefore, $T$ is injective.\
  ]
]

#section(definition, subtitle: [Scaling Transformations])[
  Let $V$ be a vector space and $T$ be a linear operator on $V$. If there exists a basis ${e_1, dots.c, e_n}$ such that for all $i in {1, dots.c, n}$,
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

#section(theorem, subtitle: [Direct Sum Decomposition II])[
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

#pyglue("projection", ```python
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['mathtext.fontset'] = 'cm'

thickness = 1
fig1, ax1 = plt.subplots(figsize=(4, 4))

ax1.text(-3, -0.5, r'$U$', fontsize=15, ha="center", va="center")
ux = np.array([-5, 0, 5])
uy = ux * 0.3
ax1.plot(ux, uy, linewidth=thickness, color='black')

origin = [0,0]
vA = (2,4)
ax1.text(0.5, 2.4, r'$v$', fontsize=15)
ax1.annotate('',
             (0,0),
             xytext=vA,
             arrowprops=dict(arrowstyle="<|-", lw=thickness, shrinkA=0, shrinkB=0))
ax1.scatter(vA[0], vA[1], alpha=0)

r = 0.7 * (2*1+4*0.3) / (1**2+0.3**2)
vB = (r * 1, r * 0.3)
ax1.text(vB[0]+0.3, vB[1]-1.2, r'$P_U(v)$', fontsize=15, ha="center", va="bottom")
ax1.annotate('',
             (0,0),
             xytext=vB,
             arrowprops=dict(arrowstyle="<|-", lw=thickness, shrinkA=0, shrinkB=0))

ax1.text(2.5, 2.5, r'$w$', fontsize=15, ha="center", va="top")
ax1.annotate('',
             vB,
             xytext=vA,
             arrowprops=dict(arrowstyle="<|-", lw=thickness, shrinkA=0, shrinkB=0))
vC = tuple(np.array(vA) - np.array(vB))
ax1.text(vC[0]+0.5, vC[1]+0.5, r'$W$', fontsize=15, ha="center", va="bottom")
wx = np.array([-0.08, 0.08])
wy = wx * vC[1] / vC[0]
ax1.plot(wx, wy, linewidth=thickness, color='black')


ax1.axis('equal')
ax1.axis('off')
fig1.savefig('source/linear/figures/projection.svg', format='svg', bbox_inches='tight')
plt.show()
```)

#figure(scale(60%, reflow: true)[#image("./figures/projection.svg")], caption: [Projection Transformation])

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

#pyglue("reflection", ```python
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['mathtext.fontset'] = 'cm'

thickness = 1
fig1, ax1 = plt.subplots(figsize=(4, 4))

ax1.text(-3, -0.5, r'$U$', fontsize=15, ha="center", va="center")
ux = np.array([-5, 0, 5])
uy = ux * 0.3
ax1.plot(ux, uy, linewidth=thickness, color='black')

v = np.array([2.0, 4.0])
u_dir = np.array([1.0, 0.3])

p = (np.dot(v, u_dir) / np.dot(u_dir, u_dir)) * u_dir
v_ref = 2 * p - v

ax1.text(0.5, 2.4, r'$v$', fontsize=15)
ax1.annotate('',
             xy=(0,0),
             xytext=tuple(v),
             arrowprops=dict(arrowstyle="<|-", lw=thickness, shrinkA=0, shrinkB=0))

ax1.text(v_ref[0] + 0.3, v_ref[1] - 1, r'$R_U(v)$', fontsize=15, ha="center", va="bottom")
ax1.annotate('',
             xy=(0,0),
             xytext=tuple(v_ref),
             arrowprops=dict(arrowstyle="<|-", lw=thickness, shrinkA=0, shrinkB=0))

ax1.plot([v[0], v_ref[0]], [v[1], v_ref[1]], 'k--', lw=thickness, alpha=0.5)

ax1.scatter(p[0], p[1], color='black', s=15, zorder=3)
ax1.text(p[0] + 1, p[1] - 0.1, r'$P_U(v)$', fontsize=12, alpha=0.7, ha="center", va="top")

ax1.axis('equal')
ax1.axis('off')

fig1.savefig('source/linear/figures/reflection.svg', format='svg', bbox_inches='tight')
plt.show()
```)

#figure(scale(60%, reflow: true)[#image("./figures/reflection.svg")], caption: [Reflection Transformation])

#pagebreak()
== Eigenvalues, Eigenvectors, and Eigenspaces
#section(definition, subtitle: [Eigenvalues and Eigenvectors])[
  Let $V$ be a vector space and $T$ be a linear operator on $V$. A scalar $lambda$ is an #concept[eigenvalue] of $T$ if there is a *nonzero* vector $v in V$ such that
  $
    T(v) = lambda v.
  $
  A such nonzero vector $v$ is called an #concept[eigenvector] of $T$ corresponding to the eigenvalue $lambda$.
]

#section(definition, subtitle: [Eigenspace])[
  Let $V$ be a vector space and $T$ be a linear operator on $V$. For any scalar $lambda$, the set of all eigenvectors of $T$ corresponding to $lambda$ together with the zero vector is called the #concept[eigenspace] of $T$ corresponding to $lambda$, denoted by $E_lambda$.
]

#section(theorem, subtitle: [Eigenspace is a Subspace])[
  Let $V$ be a vector space and $T$ be a linear operator on $V$. For any scalar $lambda$, the eigenspace $E_lambda$ of $T$ corresponding to $lambda$ is a subspace of $V$.
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
  Let $lambda_1 != lambda_2$ be two scalars and $E_(lambda_1)$ and $E_(lambda_2)$ be the eigenspaces of a linear operator $T$ on the vector space $V$ corresponding to $lambda_1$ and $lambda_2$ respectively. Then, we have
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
  Let $E_lambda$ be the eigenspace of a linear operator $T$ on the vector space $V$ corresponding to a scalar $lambda$. If $E_lambda$ contains only the zero vector, then by definition, $lambda$ is *not* a eigenvalue. Hence, we shall exclude $E_lambda$ from the set of eigenspaces of $T$.
]

#section(theorem, subtitle: [Eigenspaces of a Scaling])[
  Let $T$ be a linear operator on the vector space $V$, it is a scaling transformation if and only if there is $Lambda = {lambda^1, dots.c, lambda^m} subset.eq F$ such that
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
    $\

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
  Let $T$ be a linear operator on a vector space $V$. $T$ is a scaling transformation if and only if $T$ is diagonalizable.
  #section(proof)[
    Let's first show that if $T$ is a scaling transformation, then $T$ is diagonalizable:\
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
    This shows that if $T$ is a scaling transformation, then $T$ is diagonalizable.\

    Now, let's show that if $T$ is diagonalizable, then $T$ is a scaling transformation:\
    Let $frak(B)$ be a basis of $V$, if $T$ is diagonalizable, then there is an invertible matrix $bold(Q)$ and a diagonal matrix $bold(D)$ such that
    $
      [bold(T)]_frak(B) = bold(Q) bold(D) bold(Q)^(-1).
    $
    Since $bold(Q)$ is invertible, there is a basis $cal(V)={e_1, dots.c, e_n}$ of $V$ such that $bold(Q)$ is the basis changing matrix from $cal(V)$ to $frak(B)$. Hence, we have
    $
      [bold(T)]_cal(V) = bold(D) = bold(Q)^(-1) [bold(T)]_frak(B) bold(Q).
    $
    Since $bold(D)$ is a diagonal matrix, if its diagonal entries are $lambda^1, dots.c, lambda^n$, then for all $i in {1, dots.c, n}$,
    $
      T(e_i) = lambda^i e_i.
    $
    This shows that if $T$ is diagonalizable, then $T$ is a scaling transformation.
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

#section(theorem, subtitle: [Triangular Matrix and Eigenvalues])[
  Let $T$ be a linear operator on a vector space $V$ with the basis $frak(B)$. If the matrix $[bold(T)]_frak(B)$ associated with $T$ is an upper triangular matrix, then the diagonal entries of $[bold(T)]_frak(B)$ are the eigenvalues of $T$.
  #section(proof)[
    Let $T$ be such a linear operator and $v in V$, consider the equation
    $
      [bold(T)]_frak(B) [bold(v)]_frak(B) = lambda [bold(v)]_frak(B).
    $
    One can rearrange the equation as
    $
      [bold(T)]_frak(B) [bold(v)]_frak(B) - lambda [bold(v)]_frak(B) = ( [bold(T)]_frak(B) - lambda bold(I) ) [bold(v)]_frak(B) = 0,
    $
    where $bold(I)$ is the identity matrix. Since $[bold(T)]_frak(B)$ is an upper triangular matrix, it can be represented as follows:
    $
      [bold(T)]_frak(B) = mat(
        T_1^1, T_2^1, dots.c, T_n^1;
        0, T_2^2, dots.c, T_n^2;
        dots.v, dots.v, dots.down, dots.v;
        0, 0, dots.c, T_n^n
      ),
    $
    and $[bold(T)]_frak(B) - lambda bold(I)$ can be represented as
    $
      [bold(T)]_frak(B) - lambda bold(I) = mat(
        T_1^1 - lambda, T_2^1, dots.c, T_n^1;
        0, T_2^2 - lambda, dots.c, T_n^2;
        dots.v, dots.v, dots.down, dots.v;
        0, 0, dots.c, T_n^n - lambda
      ).
    $
    As we are trying to find the eigenvalues and eigenvectors of $T$, we wish to find a *non-trivial* solution $[bold(v)]_frak(B)$ to the equation
    $
      ([bold(T)]_frak(B) - lambda bold(I)) [bold(v)]_frak(B) = 0
    $
    so that $T(v) = lambda v$ holds.
    That is, we want to set the value of $lambda$ in a such way so that $[bold(T)]_frak(B) - lambda bold(I)$ represents a system of linear equations that has free variables.\
    From #sref(theorem.title, <InvUpTri>), we know that an upper triangular matrix is invertible if and only if all of its diagonal entries are nonzero. Hence, if $lambda$ is not equal to any of the diagonal entries of $[bold(T)]_frak(B)$, then $[bold(T)]_frak(B) - lambda bold(I)$ is invertible, which means that the equation has only the trivial solution.\
    On the other hand, if $lambda$ is equal to one of the diagonal entries of $[bold(T)]_frak(B)$, then $[bold(T)]_frak(B) - lambda bold(I)$ is not invertible (the columns are linearly dependent). Since our equation is homogeneous, from #sref(theorem.title, <NonTrivSoluHomLinEqI>), we know it means that the equation has at least one non-trivial solution. Hence, the diagonal entries of $[bold(T)]_frak(B)$ are the eigenvalues of $T$.
    #align(right)[$qed$]
  ]
]<TriMatrixAndEigenvalues>

#section(definition, subtitle: [Geometric Multiplicity])[
  Let $T$ be a linear operator on a vector space $V$ and $lambda$ be an eigenvalue of $T$. The dimension of the eigenspace $E_lambda$ is called the #concept[geometric multiplicity] of the eigenvalue $lambda$.
]

#pagebreak()
== Determinants
#section(definition, subtitle: [Multilinear Map])[
  Let $T: V^n mapsto W$, where $V$ and $W$ are vector spaces, be a map that takes $n$ vectors in $V$ as input and outputs a vector in $W$. We say that $T$ is a #concept[multilinear map] if for each $i in {1, dots.c, n}$, there is
  $
    T(v_1, dots.c, a v_i + v_i^', dots.c, v_n) = a T(v_1, dots.c, v_i, dots.c, v_n) + T(v_1, dots.c, v_i^', dots.c, v_n),
  $
  where $v_1, dots.c, v_n$ are vectors in $V$, $a$ is a scalar, and $v_i^'$ is a vector in $V$ for all $i in {1, dots.c, n}$.
]

#section(definition, subtitle: [Alternating Multilinear Map])[
  Let $T: V^n mapsto W$ be a multilinear map, we say that $T$ is an #concept[alternating multilinear map] if for any vectors $v_1, dots.c, v_n in V$ and any $i, j in {1, dots.c, n}$ with $i != j$, we have
  $
    T(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n) = 0.
  $
]

#section(definition, subtitle: [Determinant])[
  Let $V$ be a vector space of dimension $n$ with a basis $frak(B) = {e_1, dots.c, e_n}$. The #concept[determinant] is an *alternating multilinear map* that takes $n$ vectors in $V$ as input and outputs a scalar, denoted by $det: V^n mapsto F$, such that
  $
    det(e_1, dots.c, e_n) = 1.
  $
  For a linear operator $T$ on $V$, the determinant of $T$ is defined as
  $
    det(T) = det(T(e_1), dots.c, T(e_n)).
  $
  Notice that
  $
    T(e_i) = T_i,
  $
  where $T_i$ is the $i$-th column of the matrix $[bold(T)]_frak(B)$ associated with $T$. Hence, we can also express the determinant of $T$ as
  $
    det(T) = det(T_1, dots.c, T_n).
  $
]

Note that determinant only acts on $n$ vectors in $V$, where $n$ is the dimension of $V$. In order words, it only applies to linear operators on $V$, which are represented by *square matrices*.

#section(theorem, subtitle: [Antisymmetric Property of Determinant])[
  Let $v_1, dots.c, v_n in V$, then we have
  $
    det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n) = - det(v_1, dots.c, v_j, dots.c, v_i, dots.c, v_n)
  $
  for any $i, j in {1, dots.c, n}$ with $i != j$.\
  #section(proof)[
    Since $det$ is an alternating multilinear map, we have
    $
      det(v_1, dots.c, v_i + v_j, dots.c, v_i + v_j, dots.c, v_n) = 0.
    $
    Expanding the left-hand side of the equation above, we have
    $
      det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n) + det(v_1, dots.c, v_j, dots.c, v_i, dots.c, v_n) = 0.
    $
    Hence,
    $
      det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n) = - det(v_1, dots.c, v_j, dots.c, v_i, dots.c, v_n).
    $
    #align(right)[$qed$]
  ]
]

#section(theorem, subtitle: [Determinant Unchanged for Adding a Multiple of One Vector to Another])[
  Let $v_1, dots.c, v_n in V$, then we have
  $
    det(v_1, dots.c, v_i + a v_j, dots.c, v_j, dots.c, v_n) = det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n)
  $
  for any $i, j in {1, dots.c, n}$ with $i != j$ and any scalar $a$.
  #section(proof)[
    $
      & det(v_1, dots.c, v_i + a v_j, dots.c, v_j, dots.c, v_n) \
      & = det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n) + a det(v_1, dots.c, v_j, dots.c, v_j, dots.c, v_n) \
      & = det(v_1, dots.c, v_i, dots.c, v_j, dots.c, v_n).
    $
    #align(right)[$qed$]
  ]
]

Consider the matrix
$
  bold(A) = mat(
    A_1^1, A_2^1, dots.c, A_n^1;
    A_1^2, A_2^2, dots.c, A_n^2;
    dots.v, dots.v, dots.down, dots.v;
    A_1^n, A_2^n, dots.c, A_n^n
  ),
$
the determinant of $bold(A)$ is given by
$
  det(bold(A)) = det(A_1, dots.c, A_n) = det(sum_(i = 1)^n A_1^i e_i, dots.c, sum_(i = 1)^n A_n^i e_i).
$
Since each of the summations above is independent of each other, we shall index the summations with different variables:
$
  det(bold(A)) = det(sum_(i_1 = 1)^n A_1^(i_1) e_(i_1), dots.c, sum_(i_n = 1)^n A_n^(i_n) e_(i_n)).
$
Now, we can expand the determinant of $bold(A)$ as follows:
$
  det(bold(A)) = sum_(i_1 = 1)^n dots.c sum_(i_n = 1)^n A_1^(i_1) dots.c A_n^(i_n) det(e_(i_1), dots.c, e_(i_n)).
$
Consider the term $det(e_(i_1), dots.c, e_(i_n))$ in the equation above, if there are two indices $i_j$ and $i_k$ with $j != k$ such that $i_j = i_k$, then we have
$
  det(e_(i_1), dots.c, e_(i_n)) = 0.
$
For instance, when $n = 3$, the term
$
  A^1_1 A^2_2 A^2_3 det(e_1, e_2, e_2) = 0
$
because $i_2 = i_3 = 2$. Hence, the term $A^1_1 A^2_2 A^2_3 det(e_1, e_2, e_2)$ does not contribute to the value of $det(bold(A))$.\
This means that we only need to consider the terms in the expansion of $det(bold(A))$ such that $i_1, dots.c, i_n$ are all different, or in other words, all the different ways of attributing the indices $1, dots.c, n$ to $i_1, dots.c, i_n$.\

To *efficiently* express the expansion of $det(bold(A))$, we can use the concept of *permutation*. A #concept[permutation] of the set ${1, dots.c, n}$ is a bijective function $sigma: {1, dots.c, n} mapsto {1, dots.c, n}$. For instance, when $n = 3$, the function $sigma$ defined by
$
  sigma(1) = 2, sigma(2) = 3, sigma(3) = 1
$
is a permutation of the set ${1, 2, 3}$. The set of all permutations of the set ${1, dots.c, n}$ is denoted by $S_n$.\

Attributing the indices $1, dots.c, n$ to $i_1, dots.c, i_n$ can be represented by a permutations of the set ${1, dots.c, n}$. For instance, when $n = 3$, we can use the permutation $sigma$ defined by
$
  sigma(1) = 2, sigma(2) = 3, sigma(3) = 1
$
to attribute the indices $1, 2, 3$ to $i_1, i_2, i_3$ as follows:
$
  i_1 = sigma(1) = 2, i_2 = sigma(2) = 3, i_3 = sigma(3) = 1.
$
Since *different permutations attribute the indices in different ways*, to sum over all the different ways of attributing the indices, we can sum over all the different permutations. Hence, we can express the determinant of $bold(A)$ as
$
  sum_(i_1 = 1)^n dots.c sum_(i_n = 1)^n A_1^(i_1) dots.c A_n^(i_n) det(e_(i_1), dots.c, e_(i_n)) = sum_(sigma in S_n) A_1^(sigma(1)) dots.c A_n^(sigma(n)) det(e_(sigma(1)), dots.c, e_(sigma(n))),
$
where $S_n$ is the set of all permutations of the set ${1, dots.c, n}$.\

In order to further simplify the expression of $det(bold(A))$, we can use the antisymmetric property of determinant. We are allowed to swap the basis vectors in the term $det(e_(sigma(1)), dots.c, e_(sigma(n)))$ to get $det(e_1, dots.c, e_n)$, which is equal to $1$. However, the sign changes for each swap. Depending on the number of swaps we need to perform, the sign of the term can be either positive or negative.\

Let $"sgn"(sigma)$ be a function that takes a permutation $sigma$ as input and outputs $1$ if the number of swaps we need to perform is even, and outputs $-1$ if the number of swaps we need to perform is odd.
We can then express the determinant of $bold(A)$ as
$
  det(bold(A)) = sum_(sigma in S_n) "sgn"(sigma) A_1^(sigma(1)) dots.c A_n^(sigma(n))
  = sum_(sigma in S_n) "sgn"(sigma) product_(i = 1)^n A_i^(sigma(i)).
$
This is called the #concept[Leibniz formula] for the determinant of a matrix.

#section(theorem, subtitle: [Leibniz Formula])[
  Let $bold(A)$ be a matrix, then the determinant of $bold(A)$ is given by
  $
    det(bold(A)) = sum_(sigma in S_n) "sgn"(sigma) product_(i = 1)^n A_i^(sigma(i)),
  $
  where $S_n$ is the set of all permutations of the set ${1, dots.c, n}$ and $"sgn"(sigma)$ is a function that takes a permutation $sigma$ as input and outputs $1$ if the number of swaps we need to perform is even, and outputs $-1$ if the number of swaps we need to perform is odd.
]

#section(theorem, subtitle: [Determinant of a Transpose])[
  Let $bold(A)$ be a squared matrix. The #concept[transpose] of $bold(A)$, denoted by $bold(A)^top$, is the matrix obtained by swapping the rows and columns of $bold(A)$:
  $
    bold(A)^top = mat(
      dash.em, A_1, dash.em;
      , dots.v, ;
      dash.em, A_n, dash.em
    ).
  $
  We have
  $
    det(bold(A)^top) = det(bold(A)).
  $
  #section(proof)[
    From the Leibniz formula, we have
    $
      det(bold(A)^top) = sum_(sigma in S_n) "sgn"(sigma) product_(i = 1)^n A_(sigma(i))^i
    $
    and
    $
      det(bold(A)) = sum_(tau in S_n) "sgn"(tau) product_(i = 1)^n A_i^(tau(i)).
    $
    The idea is simple, if we can find a $tau$ for each $sigma$ such that
    $
      "sgn"(sigma) product_(i = 1)^n A_(sigma(i))^i = "sgn"(tau) product_(j = 1)^n A_j^(tau(j)),
    $
    and vice versa, it means that the two summations are summing the same terms, which shows that $det(bold(A)^top) = det(bold(A))$.\
    To do so, let's rewrite the product in the equation above as follows:
    $
      "sgn"(tau) product_(j = 1)^n A_j^(tau(j)) = "sgn"(tau) product_(j in {1, dots.c, n}) A_j^(tau(j)).
    $
    Since $sigma$ is a permutation of the set ${1, dots.c, n}$, we can rewrite the product in the equation above using $sigma(i)$ to replace $j$ as follows:
    $
      "sgn"(tau) product_(j in {1, dots.c, n}) A_j^(tau(j)) = "sgn"(tau) product_(i in {1, dots.c, n}) A_(sigma(i))^(tau(sigma(i))).
    $
    Now, it is clear that if we let $tau$ be the inverse of $sigma$, that is $tau = sigma^(-1)$, we have
    $
      "sgn"(tau) product_(i in {1, dots.c, n}) A_(sigma(i))^(tau(sigma(i))) = "sgn"(tau) product_(i = 1) A_(sigma(i))^i.
    $
    We are only left to show that $"sgn"(tau) = "sgn"(sigma)$. To do so, let's consider the following list:
    $
      (1,sigma(1)), (2, sigma(2)), dots.c, (n, sigma(n)).
    $
    Since $tau = sigma^(-1)$, swapping $sigma$ to the right order is equivalent to swapping the list above to the following order:
    $
      (tau(1), 1), (tau(2), 2), dots.c, (tau(n), n).
    $
    If it takes $m$ steps to swap
    $
      (1, sigma(1)), (2, sigma(2)), dots.c, (n, sigma(n)) "to" (tau(1), 1), (tau(2), 2), dots.c, (tau(n), n),
    $
    then it also takes $m$ steps to swap
    $
      (tau(1), 1), (tau(2), 2), dots.c, (tau(n), n) "to" (1, sigma(1)), (2, sigma(2)), dots.c, (n, sigma(n)).
    $
    Hence, $"sgn"(tau) = "sgn"(sigma)$.\
    Therefore, we showed that for each $sigma$, there is a $tau$ such that
    $
      "sgn"(sigma) product_(i = 1)^n A_(sigma(i))^i = "sgn"(tau) product_(j = 1)^n A_j^(tau(j)).
    $
    For the same argument, we can also show that for each $tau$, there is a $sigma$ such that
    $
      "sgn"(tau) product_(j = 1)^n A_j^(tau(j)) = "sgn"(sigma) product_(i = 1)^n A_(sigma(i))^i.
    $
    Hence, the two summations in the equations above are summing the same terms, which shows that $det(bold(A)^top) = det(bold(A))$.
    #align(right)[$qed$]
  ]
]
