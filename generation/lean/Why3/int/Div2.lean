import Why3.Base
open Classical
open Lean4Why3
namespace Div2
axiom div2 (x : ℤ) : ∃(y : ℤ), x = (2 : ℤ) * y ∨ x = (2 : ℤ) * y + (1 : ℤ)
end Div2
