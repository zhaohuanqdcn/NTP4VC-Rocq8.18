import Why3.Base
open Classical
open Lean4Why3
namespace euler001_DivModHints_mod_div_uniqueqtvc
theorem mod_div_unique'vc (q : ℤ) (y : ℤ) (r : ℤ) (fact0 : (0 : ℤ) ≤ q * y + r) (fact1 : (0 : ℤ) < y) (fact2 : (0 : ℤ) ≤ r) (fact3 : r < y) : q = Int.tdiv (q * y + r) y ∧ r = Int.tmod (q * y + r) y
  := sorry
end euler001_DivModHints_mod_div_uniqueqtvc
