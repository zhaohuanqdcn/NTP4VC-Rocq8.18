import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace isqrt_von_neumann_VonNeumann16_sqr_add2qtvc
noncomputable def sqr (x : BitVec 16) := x * x
noncomputable def is_pow2 (x : BitVec 16) (n : BitVec 16) := x &&& ((1 : BitVec 16) <<< BitVec.toNat n) - (1 : BitVec 16) = (0 : BitVec 16)
theorem sqr_add2'vc (x : BitVec 16) (y : BitVec 16) : sqr (x + y) = sqr x + y * ((2 : BitVec 16) * x + y)
  := sorry
end isqrt_von_neumann_VonNeumann16_sqr_add2qtvc
