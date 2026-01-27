import Why3.Base
open Classical
open Lean4Why3
namespace strassen_InfMatrix_setqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom tzero : t
axiom infix_pl : t -> t -> t
axiom prefix_mn : t -> t
axiom infix_as : t -> t -> t
axiom Assoc (x : t) (y : t) (z : t) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : t) : infix_pl tzero x = x
axiom Unit_def_r (x : t) : infix_pl x tzero = x
axiom Inv_def_l (x : t) : infix_pl (prefix_mn x) x = tzero
axiom Inv_def_r (x : t) : infix_pl x (prefix_mn x) = tzero
axiom Comm (x : t) (y : t) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : t) (y : t) (z : t) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : t) (y : t) (z : t) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : t) (z : t) (x : t) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : t) (y : t) : infix_as x y = infix_as y x
axiom one : t
axiom Unitary (x : t) : infix_as one x = x
axiom NonTrivialRing : ¬tzero = one
axiom mat : Type
axiom inhabited_axiom_mat : Inhabited mat
attribute [instance] inhabited_axiom_mat
axiom get : mat -> ℤ -> ℤ -> t
axiom row_zeros : mat -> ℤ -> ℤ
axiom col_zeros : mat -> ℤ -> ℤ
axiom create : (ℤ -> ℤ) -> (ℤ -> ℤ) -> (ℤ -> ℤ -> t) -> mat
axiom create_rowz (i : ℤ) (rz : ℤ -> ℤ) (cz : ℤ -> ℤ) (f : ℤ -> ℤ -> t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ rz i) : row_zeros (create rz cz f) i = rz i
axiom create_colz (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> t) (fact0 : (0 : ℤ) ≤ j) (fact1 : (0 : ℤ) ≤ cz j) : col_zeros (create rz cz f) j = cz j
axiom create_get_ib (i : ℤ) (cz : ℤ -> ℤ) (j : ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> t) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < cz j) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < rz i) : get (create rz cz f) i j = f i j
axiom create_get_oob (i : ℤ) (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : cz j ≤ i ∨ rz i ≤ j) : get (create rz cz f) i j = tzero
axiom o1 : mat -> ℤ -> ℤ -> t -> ℤ -> ℤ -> t
axiom o2 : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom o3 : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom o'def (m : mat) (i : ℤ) (j : ℤ) (v : t) (i1 : ℤ) (j1 : ℤ) : o1 m i j v i1 j1 = (if i1 = i ∧ j1 = j then v else get m i1 j1)
axiom o'def1 (m : mat) (i : ℤ) (j : ℤ) (j1 : ℤ) : o2 m i j j1 = (if j1 = j then max (i + (1 : ℤ)) (col_zeros m j) else col_zeros m j1)
axiom o'def2 (m : mat) (i : ℤ) (j : ℤ) (i1 : ℤ) : o3 m i j i1 = (if i1 = i then max (j + (1 : ℤ)) (row_zeros m i) else row_zeros m i1)
theorem set'vc : True
  := sorry
end strassen_InfMatrix_setqtvc
