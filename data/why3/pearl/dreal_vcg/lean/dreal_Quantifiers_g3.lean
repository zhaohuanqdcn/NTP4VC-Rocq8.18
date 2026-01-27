import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Quantifiers_g3
axiom g : ℤ -> ℤ
axiom g_pos (z : ℤ) : (0 : ℤ) ≤ g z
axiom h : ℤ -> ℤ
axiom h_pos (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ h x
theorem g3 (x : ℤ) : (0 : ℤ) ≤ h (g x)
  := sorry
end dreal_Quantifiers_g3
