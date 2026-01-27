import Why3.Base
open Classical
open Lean4Why3
namespace strassen_InfMatrix_set_def_changed
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
axiom result : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result1 : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result2 : mat -> ℤ -> ℤ -> t -> ℤ -> ℤ -> t
axiom result'def (m : mat) (i : ℤ) (j : ℤ) (i1 : ℤ) : result m i j i1 = (if i1 = i then max (j + (1 : ℤ)) (row_zeros m i) else row_zeros m i1)
axiom result'def1 (m : mat) (i : ℤ) (j : ℤ) (j1 : ℤ) : result1 m i j j1 = (if j1 = j then max (i + (1 : ℤ)) (col_zeros m j) else col_zeros m j1)
axiom result'def2 (m : mat) (i : ℤ) (j : ℤ) (v : t) (i1 : ℤ) (j1 : ℤ) : result2 m i j v i1 j1 = (if i1 = i ∧ j1 = j then v else get m i1 j1)
noncomputable def set (m : mat) (i : ℤ) (j : ℤ) (v : t) := if (0 : ℤ) ≤ i ∧ (0 : ℤ) ≤ j then create (result m i j) (result1 m i j) (result2 m i j v) else m
axiom zero : t
axiom infix_pl' : t -> t -> t
axiom prefix_mn' : t -> t
axiom infix_as' : t -> t -> t
axiom Assoc2 (x : t) (y : t) (z : t) : infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z)
axiom Unit_def_l1 (x : t) : infix_pl' zero x = x
axiom Unit_def_r1 (x : t) : infix_pl' x zero = x
axiom Inv_def_l1 (x : t) : infix_pl' (prefix_mn' x) x = zero
axiom Inv_def_r1 (x : t) : infix_pl' x (prefix_mn' x) = zero
axiom Comm2 (x : t) (y : t) : infix_pl' x y = infix_pl' y x
axiom Assoc3 (x : t) (y : t) (z : t) : infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z)
axiom Mul_distr_l1 (x : t) (y : t) (z : t) : infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z)
axiom Mul_distr_r1 (y : t) (z : t) (x : t) : infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x)
axiom Comm3 (x : t) (y : t) : infix_as' x y = infix_as' y x
axiom one1 : t
axiom Unitary1 (x : t) : infix_as' one1 x = x
axiom NonTrivialRing1 : ¬zero = one1
axiom row_zeros_def (i : ℤ) (m : mat) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : row_zeros m i ≤ j) : get m i j = zero
axiom col_zeros_def (j : ℤ) (m : mat) (i : ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : col_zeros m j ≤ i) : get m i j = zero
axiom row_zeros_nonneg (i : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ i) : (0 : ℤ) ≤ row_zeros m i
axiom col_zeros_nonneg (j : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ j) : (0 : ℤ) ≤ col_zeros m j
theorem set_def_changed (i : ℤ) (j : ℤ) (m : mat) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : get (set m i j v) i j = v
  := sorry
end strassen_InfMatrix_set_def_changed
