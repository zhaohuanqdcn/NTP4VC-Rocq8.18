import Why3.Base
open Classical
open Lean4Why3
namespace three_idem_ring_Top_mul_star_rqtvc
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
axiom mul : t -> ℤ -> t
axiom mul'def (n : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) : if n = (0 : ℤ) then mul x n = zero else mul x n = infix_pl x (mul x (n - (1 : ℤ)))
axiom Assoc2 (x : t) (y : t) (z : t) : infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)
axiom Unit_def_l1 (x : t) : infix_pl zero x = x
axiom Unit_def_r1 (x : t) : infix_pl x zero = x
axiom Power_0 (x : t) : mul x (0 : ℤ) = zero
axiom Power_s (n : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) : mul x (n + (1 : ℤ)) = infix_pl x (mul x n)
axiom Power_s_alt (n : ℤ) (x : t) (fact0 : (0 : ℤ) < n) : mul x n = infix_pl x (mul x (n - (1 : ℤ)))
axiom Power_1 (x : t) : mul x (1 : ℤ) = x
axiom Power_sum (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : mul x (n + m) = infix_pl (mul x n) (mul x m)
axiom Power_mult (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : mul x (n * m) = mul (mul x n) m
axiom Power_comm1 (x : t) (y : t) (n : ℤ) (fact0 : infix_pl x y = infix_pl y x) (fact1 : (0 : ℤ) ≤ n) : infix_pl (mul x n) y = infix_pl y (mul x n)
axiom Power_comm2 (x : t) (y : t) (n : ℤ) (fact0 : infix_pl x y = infix_pl y x) (fact1 : (0 : ℤ) ≤ n) : mul (infix_pl x y) n = infix_pl (mul x n) (mul y n)
noncomputable def null (x : t) (n : ℤ) := mul x n = zero
theorem mul_star_r'vc (n : ℤ) (x : t) (y : t) (fact0 : (0 : ℤ) ≤ n) : mul (infix_as x y) n = infix_as x (mul y n)
  := sorry
end three_idem_ring_Top_mul_star_rqtvc
