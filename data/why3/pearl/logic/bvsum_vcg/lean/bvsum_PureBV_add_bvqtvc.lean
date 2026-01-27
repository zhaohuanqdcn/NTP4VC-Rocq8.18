import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bvsum_PureBV_add_bvqtvc
theorem add_bv'vc (x : BitVec 32) (y : BitVec 32) : x + y = (x &&& y) + (x ||| y)
  := sorry
end bvsum_PureBV_add_bvqtvc
