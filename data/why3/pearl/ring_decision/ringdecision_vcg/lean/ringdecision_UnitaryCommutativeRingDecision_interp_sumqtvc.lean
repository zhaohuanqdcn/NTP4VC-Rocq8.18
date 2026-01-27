import Why3.Base
open Classical
open Lean4Why3
namespace ringdecision_UnitaryCommutativeRingDecision_interp_sumqtvc
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
axiom t1 : Type
axiom inhabited_axiom_t1 : Inhabited t1
attribute [instance] inhabited_axiom_t1
axiom zero1 : t1
axiom infix_pl' : t1 -> t1 -> t1
axiom prefix_mn' : t1 -> t1
axiom infix_as' : t1 -> t1 -> t1
axiom Assoc2 (x : t1) (y : t1) (z : t1) : infix_pl' (infix_pl' x y) z = infix_pl' x (infix_pl' y z)
axiom Unit_def_l1 (x : t1) : infix_pl' zero1 x = x
axiom Unit_def_r1 (x : t1) : infix_pl' x zero1 = x
axiom Inv_def_l1 (x : t1) : infix_pl' (prefix_mn' x) x = zero1
axiom Inv_def_r1 (x : t1) : infix_pl' x (prefix_mn' x) = zero1
axiom Comm2 (x : t1) (y : t1) : infix_pl' x y = infix_pl' y x
axiom Assoc3 (x : t1) (y : t1) (z : t1) : infix_as' (infix_as' x y) z = infix_as' x (infix_as' y z)
axiom Mul_distr_l1 (x : t1) (y : t1) (z : t1) : infix_as' x (infix_pl' y z) = infix_pl' (infix_as' x y) (infix_as' x z)
axiom Mul_distr_r1 (y : t1) (z : t1) (x : t1) : infix_as' (infix_pl' y z) x = infix_pl' (infix_as' y x) (infix_as' z x)
axiom Comm3 (x : t1) (y : t1) : infix_as' x y = infix_as' y x
axiom one1 : t1
axiom Unitary1 (x : t1) : infix_as' one1 x = x
axiom NonTrivialRing1 : ¬zero1 = one1
axiom morph : t1 -> t
axiom morph_zero : morph zero1 = zero
axiom morph_one : morph one1 = one
axiom morph_add (z1 : t1) (z2 : t1) : morph (infix_pl' z1 z2) = infix_pl (morph z1) (morph z2)
axiom morph_mul (z1 : t1) (z2 : t1) : morph (infix_as' z1 z2) = infix_as (morph z1) (morph z2)
axiom morph_inv (z : t1) : morph (prefix_mn' z) = prefix_mn (morph z)
axiom eq0 : t1 -> Prop
axiom eq0'spec (x : t1) : eq0 x = (x = zero1)
inductive t2 where
  | Var : ℤ -> t2
  | Add : t2 -> t2 -> t2
  | Mul : t2 -> t2 -> t2
  | Cst : t1 -> t2
axiom inhabited_axiom_t2 : Inhabited t2
attribute [instance] inhabited_axiom_t2
axiom vars : Type
axiom inhabited_axiom_vars : Inhabited vars
attribute [instance] inhabited_axiom_vars
noncomputable def interp : t2 -> (ℤ -> t) -> t
  | (t2.Var n), y => y n
  | (t2.Add x1 x2), y => infix_pl (interp x1 y) (interp x2 y)
  | (t2.Mul x1 x2), y => infix_as (interp x1 y) (interp x2 y)
  | (t2.Cst c), y => morph c
noncomputable def eq (x1 : t2) (x2 : t2) := ∀(y : ℤ -> t), interp x1 y = interp x2 y
inductive m where
  | M : t1 -> List ℤ -> m
axiom inhabited_axiom_m : Inhabited m
attribute [instance] inhabited_axiom_m
axiom t' : Type
axiom inhabited_axiom_t' : Inhabited t'
attribute [instance] inhabited_axiom_t'
noncomputable def mon : List ℤ -> (ℤ -> t) -> t
  | ([] : List ℤ), y => one
  | (List.cons x1 r), y => infix_as (y x1) (mon r y)
noncomputable def interp' : List m -> (ℤ -> t) -> t
  | ([] : List m), y => zero
  | (List.cons (m.M a m1) r), y => infix_pl (infix_as (morph a) (mon m1 y)) (interp' r y)
noncomputable def eq_mon (m1 : List ℤ) (m2 : List ℤ) := ∀(y : ℤ -> t), mon m1 y = mon m2 y
noncomputable def eq' (x1 : List m) (x2 : List m) := ∀(y : ℤ -> t), interp' x1 y = interp' x2 y
theorem interp_sum'vc (x1 : List m) (x2 : List m) (y : ℤ -> t) : interp' (x1 ++ x2) y = infix_pl (interp' x1 y) (interp' x2 y)
  := sorry
end ringdecision_UnitaryCommutativeRingDecision_interp_sumqtvc
