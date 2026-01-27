import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bitvector_examples_Hackers_delight_SR1
theorem SR1 (n : BitVec 32) (x : BitVec 32) (fact0 : (0 : BitVec 32) ≤ n) (fact1 : n ≤ (31 : BitVec 32)) : x >>> BitVec.toNat n ||| (-(x >>> BitVec.toNat (31 : BitVec 32)) <<< BitVec.toNat ((31 : BitVec 32) - n)) = BitVec.sshiftRight x (BitVec.toNat n)
  := sorry
end bitvector_examples_Hackers_delight_SR1
