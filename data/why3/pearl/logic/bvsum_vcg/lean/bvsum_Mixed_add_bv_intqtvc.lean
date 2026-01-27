import Why3.Base
import Why3.why3.WellFounded.WellFounded
open Classical
open Lean4Why3
namespace bvsum_Mixed_add_bv_intqtvc
theorem add_bv_int'vc (x : BitVec 32) (y : BitVec 32) : BitVec.toUInt x + BitVec.toUInt y = BitVec.toUInt (x &&& y) + BitVec.toUInt (x ||| y)
  := sorry
end bvsum_Mixed_add_bv_intqtvc
