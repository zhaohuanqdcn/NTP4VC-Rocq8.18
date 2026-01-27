import Why3.Base
open Classical
open Lean4Why3
namespace dreal_Quantifiers_g2
axiom g : ℤ -> ℤ
axiom g_pos (z : ℤ) : (0 : ℤ) ≤ g z
theorem g2 : (0 : ℤ) ≤ g (3 : ℤ)
  := sorry
end dreal_Quantifiers_g2
