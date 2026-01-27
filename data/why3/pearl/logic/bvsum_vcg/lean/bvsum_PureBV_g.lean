import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bvsum_PureBV_g
theorem g (x : BitVec 32) (y : BitVec 32) (z : BitVec 32) : x + y + z = ((x &&& y) + (x ||| y) &&& z) + ((x &&& y) + (x ||| y) ||| z)
  := sorry
end bvsum_PureBV_g
