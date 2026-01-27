import Why3.Base
import Why3.int.Sum
open Classical
open Lean4Why3
namespace strassen_InfIntMatrix_subqtvc
axiom infix_pl : ℤ -> ℤ -> ℤ
axiom prefix_mn : ℤ -> ℤ
axiom infix_as : ℤ -> ℤ -> ℤ
axiom Assoc (x : ℤ) (y : ℤ) (z : ℤ) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : ℤ) : infix_pl (0 : ℤ) x = x
axiom Unit_def_r (x : ℤ) : infix_pl x (0 : ℤ) = x
axiom Inv_def_l (x : ℤ) : infix_pl (prefix_mn x) x = (0 : ℤ)
axiom Inv_def_r (x : ℤ) : infix_pl x (prefix_mn x) = (0 : ℤ)
axiom Comm (x : ℤ) (y : ℤ) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : ℤ) (y : ℤ) (z : ℤ) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : ℤ) (z : ℤ) (x : ℤ) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : ℤ) (y : ℤ) : infix_as x y = infix_as y x
axiom one : ℤ
axiom Unitary (x : ℤ) : infix_as one x = x
axiom NonTrivialRing : ¬(0 : ℤ) = one
axiom mat : Type
axiom inhabited_axiom_mat : Inhabited mat
attribute [instance] inhabited_axiom_mat
axiom get : mat -> ℤ -> ℤ -> ℤ
axiom row_zeros : mat -> ℤ -> ℤ
axiom col_zeros : mat -> ℤ -> ℤ
axiom create : (ℤ -> ℤ) -> (ℤ -> ℤ) -> (ℤ -> ℤ -> ℤ) -> mat
axiom create_rowz (i : ℤ) (rz : ℤ -> ℤ) (cz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ rz i) : row_zeros (create rz cz f) i = rz i
axiom create_colz (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : (0 : ℤ) ≤ cz j) : col_zeros (create rz cz f) j = cz j
axiom create_get_ib (i : ℤ) (cz : ℤ -> ℤ) (j : ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < cz j) (fact2 : (0 : ℤ) ≤ j) (fact3 : j < rz i) : get (create rz cz f) i j = f i j
axiom create_get_oob (i : ℤ) (j : ℤ) (cz : ℤ -> ℤ) (rz : ℤ -> ℤ) (f : ℤ -> ℤ -> ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : cz j ≤ i ∨ rz i ≤ j) : get (create rz cz f) i j = (0 : ℤ)
axiom result : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result1 : mat -> ℤ -> ℤ -> ℤ -> ℤ
axiom result2 : mat -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ -> ℤ
axiom result'def (m : mat) (i : ℤ) (j : ℤ) (i1 : ℤ) : result m i j i1 = (if i1 = i then max (j + (1 : ℤ)) (row_zeros m i) else row_zeros m i1)
axiom result'def1 (m : mat) (i : ℤ) (j : ℤ) (j1 : ℤ) : result1 m i j j1 = (if j1 = j then max (i + (1 : ℤ)) (col_zeros m j) else col_zeros m j1)
axiom result'def2 (m : mat) (i : ℤ) (j : ℤ) (v : ℤ) (i1 : ℤ) (j1 : ℤ) : result2 m i j v i1 j1 = (if i1 = i ∧ j1 = j then v else get m i1 j1)
noncomputable def set (m : mat) (i : ℤ) (j : ℤ) (v : ℤ) := if (0 : ℤ) ≤ i ∧ (0 : ℤ) ≤ j then create (result m i j) (result1 m i j) (result2 m i j v) else m
axiom zero : ℤ
axiom infix_pl' : ℤ -> ℤ -> ℤ
axiom prefix_mn' : ℤ -> ℤ
axiom infix_as' : ℤ -> ℤ -> ℤ
axiom Assoc2 (x : ℤ) (y : ℤ) (z : ℤ) : infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z)
axiom Unit_def_l1 (x : ℤ) : infix_pl' zero x = x
axiom Unit_def_r1 (x : ℤ) : infix_pl' x zero = x
axiom Inv_def_l1 (x : ℤ) : infix_pl' (prefix_mn' x) x = zero
axiom Inv_def_r1 (x : ℤ) : infix_pl' x (prefix_mn' x) = zero
axiom Comm2 (x : ℤ) (y : ℤ) : infix_pl' x y = infix_pl' y x
axiom Assoc3 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z)
axiom Mul_distr_l1 (x : ℤ) (y : ℤ) (z : ℤ) : infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z)
axiom Mul_distr_r1 (y : ℤ) (z : ℤ) (x : ℤ) : infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x)
axiom Comm3 (x : ℤ) (y : ℤ) : infix_as' x y = infix_as' y x
axiom one1 : ℤ
axiom Unitary1 (x : ℤ) : infix_as' one1 x = x
axiom NonTrivialRing1 : ¬zero = one1
axiom row_zeros_def (i : ℤ) (m : mat) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : row_zeros m i ≤ j) : get m i j = zero
axiom col_zeros_def (j : ℤ) (m : mat) (i : ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : col_zeros m j ≤ i) : get m i j = zero
axiom row_zeros_nonneg (i : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ i) : (0 : ℤ) ≤ row_zeros m i
axiom col_zeros_nonneg (j : ℤ) (m : mat) (fact0 : (0 : ℤ) ≤ j) : (0 : ℤ) ≤ col_zeros m j
axiom set_def_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : get (set m i j v) i j = v
axiom set_def_unchanged (i : ℤ) (j : ℤ) (i' : ℤ) (j' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : (0 : ℤ) ≤ j') (fact4 : ¬i = i' ∨ ¬j = j') : get (set m i j v) i' j' = get m i' j'
axiom set_def_rowz_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : row_zeros m i ≤ j) : row_zeros (set m i j v) i = j + (1 : ℤ)
axiom set_def_colz_changed (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : col_zeros m j ≤ i) : col_zeros (set m i j v) j = i + (1 : ℤ)
axiom set_def_rowz_unchanged (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : j < row_zeros m i) : row_zeros (set m i j v) i = row_zeros m i
axiom set_def_colz_unchanged (i : ℤ) (j : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : i < col_zeros m j) : col_zeros (set m i j v) j = col_zeros m j
axiom set_def_other_rowz (i : ℤ) (j : ℤ) (i' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : ¬i = i') : row_zeros (set m i j v) i' = row_zeros m i'
axiom set_def_other_colz (i : ℤ) (j : ℤ) (j' : ℤ) (m : mat) (v : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ j') (fact3 : ¬j = j') : col_zeros (set m i j v) j' = col_zeros m j'
noncomputable def infix_eqeq (m1 : mat) (m2 : mat) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → get m1 i j = get m2 i j
axiom extensionality (m1 : mat) (m2 : mat) (fact0 : infix_eqeq m1 m2) : m1 = m2
noncomputable def infix_eqeqeq (m1 : mat) (m2 : mat) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → row_zeros m1 i = row_zeros m2 i ∧ col_zeros m1 j = col_zeros m2 j
noncomputable def in_bounds (m : mat) (i : ℤ) (j : ℤ) := ((0 : ℤ) ≤ i ∧ i < col_zeros m j) ∧ (0 : ℤ) ≤ j ∧ j < row_zeros m i
noncomputable def size (m : mat) (r : ℤ) (c : ℤ) := (∀(i : ℤ), (0 : ℤ) ≤ i → row_zeros m i = c) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → col_zeros m j = r)
axiom result3 : ℤ -> ℤ -> ℤ
axiom result4 : ℤ -> ℤ -> ℤ
axiom result'def3 (c : ℤ) (x : ℤ) : result3 c x = max (0 : ℤ) c
axiom result'def4 (r : ℤ) (x : ℤ) : result4 r x = max (0 : ℤ) r
noncomputable def fcreate (r : ℤ) (c : ℤ) (f : ℤ -> ℤ -> ℤ) := create (result3 c) (result4 r) f
axiom fc : ℤ -> ℤ -> ℤ
axiom fc'def (y0 : ℤ) (y1 : ℤ) : fc y0 y1 = (0 : ℤ)
noncomputable def mzero := fcreate (0 : ℤ) (0 : ℤ) fc
axiom fc1 : ℤ -> ℤ -> ℤ
axiom fc'def1 (y0 : ℤ) (y1 : ℤ) : fc1 y0 y1 = (0 : ℤ)
noncomputable def zerorc (r : ℤ) (c : ℤ) := fcreate r c fc1
noncomputable def idf (x : ℤ) (y : ℤ) := if x = y then (1 : ℤ) else (0 : ℤ)
axiom result5 : ℤ -> ℤ
axiom result6 : ℤ -> ℤ
axiom idf_closure : ℤ -> ℤ -> ℤ
axiom result'def5 (i : ℤ) : result5 i = i + (1 : ℤ)
axiom result'def6 (j : ℤ) : result6 j = j + (1 : ℤ)
axiom idf_closure_def (y : ℤ) (y1 : ℤ) : idf_closure y y1 = idf y y1
noncomputable def id1 := create result5 result6 idf_closure
noncomputable def idrc (r : ℤ) (c : ℤ) := fcreate r c idf_closure
axiom add2f : mat -> mat -> ℤ -> ℤ -> ℤ
axiom add2f'def (a : mat) (b : mat) (x : ℤ) (y : ℤ) : add2f a b x y = get a x y + get b x y
axiom fc2 : mat -> mat -> ℤ -> ℤ
axiom fc3 : mat -> mat -> ℤ -> ℤ
axiom fc'def2 (a : mat) (b : mat) (i : ℤ) : fc2 a b i = max (row_zeros a i) (row_zeros b i)
axiom fc'def3 (a : mat) (b : mat) (j : ℤ) : fc3 a b j = max (col_zeros a j) (col_zeros b j)
noncomputable def f_add (a : mat) (b : mat) := create (fc2 a b) (fc3 a b) (add2f a b)
axiom add : mat -> mat -> mat
axiom add'spec (a : mat) (b : mat) : add a b = f_add a b
axiom opp2f : mat -> ℤ -> ℤ -> ℤ
axiom opp2f'def (a : mat) (x : ℤ) (y : ℤ) : opp2f a x y = -get a x y
axiom row_zeros_closure : mat -> ℤ -> ℤ
axiom col_zeros_closure : mat -> ℤ -> ℤ
axiom row_zeros_closure_def (y : mat) (y1 : ℤ) : row_zeros_closure y y1 = row_zeros y y1
axiom col_zeros_closure_def (y : mat) (y1 : ℤ) : col_zeros_closure y y1 = col_zeros y y1
noncomputable def f_opp (a : mat) := create (row_zeros_closure a) (col_zeros_closure a) (opp2f a)
axiom opp : mat -> mat
axiom opp'spec (a : mat) : opp a = f_opp a
theorem sub'vc : True
  := sorry
end strassen_InfIntMatrix_subqtvc
