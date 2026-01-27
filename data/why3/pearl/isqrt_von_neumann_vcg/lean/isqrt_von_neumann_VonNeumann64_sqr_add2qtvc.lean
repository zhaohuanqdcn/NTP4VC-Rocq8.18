import Why3.Base
import Why3.why3.WellFounded.WellFounded
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace isqrt_von_neumann_VonNeumann64_sqr_add2qtvc
noncomputable def sqr (x : BitVec 64) := x * x
noncomputable def is_pow2 (x : BitVec 64) (n : BitVec 64) := x &&& ((1 : BitVec 64) <<< BitVec.toNat n) - (1 : BitVec 64) = (0 : BitVec 64)
theorem sqr_add2'vc (x : BitVec 64) (y : BitVec 64) : sqr (x + y) = sqr x + y * ((2 : BitVec 64) * x + y)
  := sorry
end isqrt_von_neumann_VonNeumann64_sqr_add2qtvc
