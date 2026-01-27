import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace test_elim_UnusedBV_fqtvc
theorem f'vc (x : BitVec 32) (fact0 : (1000 : BitVec 32) > x) : x + (1 : BitVec 32) > x
  := sorry
end test_elim_UnusedBV_fqtvc
