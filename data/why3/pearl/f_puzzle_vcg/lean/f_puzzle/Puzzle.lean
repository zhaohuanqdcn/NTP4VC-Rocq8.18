import Why3.Base
open Classical
open Lean4Why3
namespace Puzzle
axiom f : ℤ -> ℤ
axiom H1 (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ f n
axiom H2 (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : f (f n) < f (n + (1 : ℤ))
end Puzzle
