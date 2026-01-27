import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_DM3
theorem DM3 (x : BitVec 32) : ~~~(x + (1 : BitVec 32)) = ~~~x - (1 : BitVec 32)
  := sorry
end bitvector_examples_Hackers_delight_DM3
