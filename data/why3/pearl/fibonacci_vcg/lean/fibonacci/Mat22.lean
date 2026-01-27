import Why3.Base
open Classical
open Lean4Why3
namespace Mat22
structure t where
  a11 : ℤ
  a12 : ℤ
  a21 : ℤ
  a22 : ℤ
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mult (x : t) (y : t) := t.mk (t.a11 x * t.a11 y + t.a12 x * t.a21 y) (t.a11 x * t.a12 y + t.a12 x * t.a22 y) (t.a21 x * t.a11 y + t.a22 x * t.a21 y) (t.a21 x * t.a12 y + t.a22 x * t.a22 y)
axiom power : t -> ℤ -> t
axiom Power_0 (x : t) : power x (0 : ℤ) = t.mk (1 : ℤ) (0 : ℤ) (0 : ℤ) (1 : ℤ)
axiom Power_s (n : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) : power x (n + (1 : ℤ)) = mult x (power x n)
axiom Power_s_alt (n : ℤ) (x : t) (fact0 : (0 : ℤ) < n) : power x n = mult x (power x (n - (1 : ℤ)))
axiom Power_1 (x : t) : power x (1 : ℤ) = x
axiom Power_sum (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : power x (n + m) = mult (power x n) (power x m)
axiom Power_mult (n : ℤ) (m : ℤ) (x : t) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : power x (n * m) = power (power x n) m
axiom Power_comm1 (x : t) (y : t) (n : ℤ) (fact0 : mult x y = mult y x) (fact1 : (0 : ℤ) ≤ n) : mult (power x n) y = mult y (power x n)
axiom Power_comm2 (x : t) (y : t) (n : ℤ) (fact0 : mult x y = mult y x) (fact1 : (0 : ℤ) ≤ n) : power (mult x y) n = mult (power x n) (power y n)
end Mat22
