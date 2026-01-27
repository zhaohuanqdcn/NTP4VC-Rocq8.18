import Why3.Base
open Classical
open Lean4Why3
namespace kleene_algebra_Dioid_le_compat_add_leftqtvc
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom zero : t
axiom one : t
axiom infix_pl : t -> t -> t
axiom infix_as : t -> t -> t
axiom Assoc (x : t) (y : t) (z : t) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l (x : t) : infix_pl zero x = x
axiom Unit_def_r (x : t) : infix_pl x zero = x
axiom Comm (x : t) (y : t) : infix_pl x y = infix_pl y x
axiom Assoc1 (x : t) (y : t) (z : t) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Unit_def_l1 (x : t) : infix_as one x = x
axiom Unit_def_r1 (x : t) : infix_as x one = x
axiom Mul_zero_l (x : t) : infix_as zero x = zero
axiom Mul_zero_r (x : t) : infix_as x zero = zero
axiom Mul_distr_l (x : t) (y : t) (z : t) : infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)
axiom Mul_distr_r (y : t) (z : t) (x : t) : infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)
axiom infix_cf : t -> ℤ -> t
axiom infix_cf'def (n : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then infix_cf x n = one else infix_cf x n = infix_as x (infix_cf x (n - (1 : ℤ)))
axiom Assoc2 (x : t) (y : t) (z : t) : infix_as (infix_as x y) z = infix_as x (infix_as y z)
axiom Unit_def_l2 (x : t) : infix_as one x = x
axiom Unit_def_r2 (x : t) : infix_as x one = x
axiom Power_0 (x : t) : infix_cf x (0 : ℤ) = one
axiom Power_s (n : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) : infix_cf x (n + (1 : ℤ)) = infix_as x (infix_cf x n)
axiom Power_s_alt (n : ℤ) (x : t) (fact0 : (0 : ℤ) < n) : infix_cf x n = infix_as x (infix_cf x (n - (1 : ℤ)))
axiom Power_1 (x : t) : infix_cf x (1 : ℤ) = x
axiom Power_sum (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : infix_cf x (n + m) = infix_as (infix_cf x n) (infix_cf x m)
axiom Power_mult (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : infix_cf x (n * m) = infix_cf (infix_cf x n) m
axiom Power_comm1 (x : t) (y : t) (n : ℤ) (fact0 : infix_as x y = infix_as y x) (fact1 : (0 : ℤ) ≤ n) : infix_as (infix_cf x n) y = infix_as y (infix_cf x n)
axiom Power_comm2 (x : t) (y : t) (n : ℤ) (fact0 : infix_as x y = infix_as y x) (fact1 : (0 : ℤ) ≤ n) : infix_cf (infix_as x y) n = infix_as (infix_cf x n) (infix_cf y n)
axiom Idem (x : t) : infix_pl x x = x
noncomputable def infix_lseq (x : t) (y : t) := infix_pl x y = y
theorem le_compat_add_left'vc (x : t) (y : t) (z : t) (fact0 : infix_lseq x y) : infix_lseq (infix_as z x) (infix_as z y)
  := sorry
end kleene_algebra_Dioid_le_compat_add_leftqtvc
