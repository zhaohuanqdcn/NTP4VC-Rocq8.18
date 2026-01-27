import Why3.Base
open Classical
open Lean4Why3
namespace strassen_InfMatrixGen_iso_sizeqtvc
axiom mat : Type -> Type
axiom inhabited_axiom_mat {α : Type} [Inhabited α] : Inhabited (mat α)
attribute [instance] inhabited_axiom_mat
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom infix_pl : t -> t -> t
axiom prefix_mn : t -> t
axiom infix_as : t -> t -> t
axiom Assoc (x : t) (y : t) (z : t) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : t) : infix_pl zero x = x
axiom Unit_def_r (x : t) : infix_pl x zero = x
axiom Inv_def_l (x : t) : infix_pl (prefix_mn x) x = zero
axiom Inv_def_r (x : t) : infix_pl x (prefix_mn x) = zero
axiom Comm (x : t) (y : t) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : t) (y : t) (z : t) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Mul_distr_l (x : t) (y : t) (z : t) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : t) (z : t) (x : t) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom Comm1 (x : t) (y : t) : infix_as x y = infix_as y x
axiom one : t
axiom Unitary (x : t) : infix_as one x = x
axiom NonTrivialRing : ¬zero = one
axiom get : mat t -> ℤ -> ℤ -> t
axiom set : mat t -> ℤ -> ℤ -> t -> mat t
axiom row_zeros : mat t -> ℤ -> ℤ
axiom col_zeros : mat t -> ℤ -> ℤ
axiom row_zeros_def (i : ℤ) (m : mat t) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : row_zeros m i ≤ j) : get m i j = zero
axiom col_zeros_def (j : ℤ) (m : mat t) (i : ℤ) (fact0 : (0 : ℤ) ≤ j) (fact1 : col_zeros m j ≤ i) : get m i j = zero
axiom row_zeros_nonneg (i : ℤ) (m : mat t) (fact0 : (0 : ℤ) ≤ i) : (0 : ℤ) ≤ row_zeros m i
axiom col_zeros_nonneg (j : ℤ) (m : mat t) (fact0 : (0 : ℤ) ≤ j) : (0 : ℤ) ≤ col_zeros m j
axiom set_def_changed (i : ℤ) (j : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : get (set m i j v) i j = v
axiom set_def_unchanged (i : ℤ) (j : ℤ) (i' : ℤ) (j' : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : (0 : ℤ) ≤ j') (fact4 : ¬i = i' ∨ ¬j = j') : get (set m i j v) i' j' = get m i' j'
axiom set_def_rowz_changed (i : ℤ) (j : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : row_zeros m i ≤ j) : row_zeros (set m i j v) i = j + (1 : ℤ)
axiom set_def_colz_changed (i : ℤ) (j : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : col_zeros m j ≤ i) : col_zeros (set m i j v) j = i + (1 : ℤ)
axiom set_def_rowz_unchanged (i : ℤ) (j : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : j < row_zeros m i) : row_zeros (set m i j v) i = row_zeros m i
axiom set_def_colz_unchanged (i : ℤ) (j : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : i < col_zeros m j) : col_zeros (set m i j v) j = col_zeros m j
axiom set_def_other_rowz (i : ℤ) (j : ℤ) (i' : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ i') (fact3 : ¬i = i') : row_zeros (set m i j v) i' = row_zeros m i'
axiom set_def_other_colz (i : ℤ) (j : ℤ) (j' : ℤ) (m : mat t) (v : t) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) (fact2 : (0 : ℤ) ≤ j') (fact3 : ¬j = j') : col_zeros (set m i j v) j' = col_zeros m j'
noncomputable def infix_eqeq (m1 : mat t) (m2 : mat t) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → get m1 i j = get m2 i j
axiom extensionality (m1 : mat t) (m2 : mat t) (fact0 : infix_eqeq m1 m2) : m1 = m2
noncomputable def infix_eqeqeq (m1 : mat t) (m2 : mat t) := ∀(i : ℤ) (j : ℤ), (0 : ℤ) ≤ i → (0 : ℤ) ≤ j → row_zeros m1 i = row_zeros m2 i ∧ col_zeros m1 j = col_zeros m2 j
noncomputable def in_bounds (m : mat t) (i : ℤ) (j : ℤ) := ((0 : ℤ) ≤ i ∧ i < col_zeros m j) ∧ (0 : ℤ) ≤ j ∧ j < row_zeros m i
noncomputable def size (m : mat t) (r : ℤ) (c : ℤ) := (∀(i : ℤ), (0 : ℤ) ≤ i → row_zeros m i = c) ∧ (∀(j : ℤ), (0 : ℤ) ≤ j → col_zeros m j = r)
theorem iso_size'vc (a : mat t) (b : mat t) (r : ℤ) (c : ℤ) (fact0 : infix_eqeqeq a b) : size a r c = size b r c
  := sorry
end strassen_InfMatrixGen_iso_sizeqtvc
