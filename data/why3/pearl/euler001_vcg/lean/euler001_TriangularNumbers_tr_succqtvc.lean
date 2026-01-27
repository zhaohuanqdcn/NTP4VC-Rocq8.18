import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
open Classical
open Lean4Why3
namespace euler001_TriangularNumbers_tr_succqtvc
noncomputable def tr (n : ℤ) := Int.tdiv (n * (n + (1 : ℤ))) (2 : ℤ)
theorem tr_succ'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : tr (n + (1 : ℤ)) = tr n + n + (1 : ℤ)
  := sorry
end euler001_TriangularNumbers_tr_succqtvc
