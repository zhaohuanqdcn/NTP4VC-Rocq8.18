import Why3.Base
open Classical
open Lean4Why3
namespace test_elim_DefMatchPair_g
noncomputable def f (x : ℤ) := match (x, x + (1 : ℤ)) with | (a, b) => a < b
theorem g (x : ℤ) : f x
  := sorry
end test_elim_DefMatchPair_g
