import Why3.Base
open Classical
open Lean4Why3
namespace fibonacci_Mat22_Assoc
structure t where
  a11 : ℤ
  a12 : ℤ
  a21 : ℤ
  a22 : ℤ
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
noncomputable def mult (x : t) (y : t) := t.mk (t.a11 x * t.a11 y + t.a12 x * t.a21 y) (t.a11 x * t.a12 y + t.a12 x * t.a22 y) (t.a21 x * t.a11 y + t.a22 x * t.a21 y) (t.a21 x * t.a12 y + t.a22 x * t.a22 y)
theorem Assoc (x : t) (y : t) (z : t) : mult (mult x y) z = mult x (mult y z)
  := sorry
end fibonacci_Mat22_Assoc
