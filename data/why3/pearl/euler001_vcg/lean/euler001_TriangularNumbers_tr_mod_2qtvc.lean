import Why3.Base
import Why3.int.Div2
import pearl.euler001_vcg.lean.euler001.DivModHints
open Classical
open Lean4Why3
namespace euler001_TriangularNumbers_tr_mod_2qtvc
theorem tr_mod_2'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : Int.tmod (n * (n + (1 : ℤ))) (2 : ℤ) = (0 : ℤ)
  := sorry
end euler001_TriangularNumbers_tr_mod_2qtvc
