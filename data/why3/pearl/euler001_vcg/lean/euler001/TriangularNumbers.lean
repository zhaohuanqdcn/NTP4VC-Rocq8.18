import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
open Classical
open Lean4Why3
namespace TriangularNumbers
noncomputable def tr (n : ℤ) := Int.tdiv (n * (n + (1 : ℤ))) (2 : ℤ)
end TriangularNumbers
