import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace isqrt_von_neumann_VonNeumann32_sqr_add2qtvc
noncomputable def sqr (x : BitVec 32) := x * x
noncomputable def is_pow2 (x : BitVec 32) (n : BitVec 32) := x &&& ((1 : BitVec 32) <<< BitVec.toNat n) - (1 : BitVec 32) = (0 : BitVec 32)
theorem sqr_add2'vc (x : BitVec 32) (y : BitVec 32) : sqr (x + y) = sqr x + y * ((2 : BitVec 32) * x + y)
  := sorry
end isqrt_von_neumann_VonNeumann32_sqr_add2qtvc
