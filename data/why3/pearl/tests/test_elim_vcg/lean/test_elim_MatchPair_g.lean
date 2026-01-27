import Why3.Base
open Classical
open Lean4Why3
namespace test_elim_MatchPair_g
theorem g (x : ℤ) : match (x, x + (1 : ℤ)) with | (a, b) => a < b
  := sorry
end test_elim_MatchPair_g
