import Why3.Base
open Classical
open Lean4Why3
namespace euler001_DivModHints_mod_succ_1qtvc
theorem mod_succ_1'vc (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) < y) (fact2 : ¬Int.tmod (x + (1 : ℤ)) y = (0 : ℤ)) : Int.tmod (x + (1 : ℤ)) y = Int.tmod x y + (1 : ℤ)
  := sorry
end euler001_DivModHints_mod_succ_1qtvc
