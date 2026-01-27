import Why3.Base
import Why3.why3.Ref.Ref
open Classical
open Lean4Why3
namespace incremental_Ce_int32_dummy_updateqtvc
theorem dummy_update'vc (r : BitVec 32) (fact0 : BitVec.toInt r = (22 : ℤ)) : int'32_in_bounds (42 : ℤ) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = (42 : ℤ) → int'32_in_bounds (BitVec.toInt o1 + BitVec.toInt o1) ∧ (∀(o2 : BitVec 32), BitVec.toInt o2 = BitVec.toInt o1 + BitVec.toInt o1 → BitVec.toInt o2 = (42 : ℤ)))
  := sorry
end incremental_Ce_int32_dummy_updateqtvc
