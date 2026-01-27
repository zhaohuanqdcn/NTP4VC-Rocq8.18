import Why3.Base
open Classical
open Lean4Why3
namespace Hyps
axiom p : ℤ -> Prop
axiom H0 : p (0 : ℤ)
axiom H1 : p (1 : ℤ)
axiom H2 (n : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : p n) : p (n + (2 : ℤ))
end Hyps
