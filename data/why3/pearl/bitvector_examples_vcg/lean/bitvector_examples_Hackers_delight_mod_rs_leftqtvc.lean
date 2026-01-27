import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_mod_rs_leftqtvc
theorem rs_left'vc (x : BitVec 32) : x <<< BitVec.toNat (1 : BitVec 32) ||| (x >>> BitVec.toNat (31 : BitVec 32)) = BitVec.rotateLeft x (BitVec.toNat (1 : BitVec 32))
  := sorry
end bitvector_examples_Hackers_delight_mod_rs_leftqtvc
