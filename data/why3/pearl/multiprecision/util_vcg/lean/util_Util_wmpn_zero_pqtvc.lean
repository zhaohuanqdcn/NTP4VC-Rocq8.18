import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import Why3.mach.c.C
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
open Classical
open Lean4Why3
namespace util_Util_wmpn_zero_pqtvc
theorem wmpn_zero_p'vc (x : C.ptr (BitVec 64)) (sz : BitVec 32) (fact0 : C.valid x (BitVec.toInt sz)) : (0 : ℤ) ≤ BitVec.toInt sz ∧ BitVec.toInt sz ≤ BitVec.toInt sz ∧ Lemmas.value_sub (C.pelts x) (C.offset x + BitVec.toInt sz) (C.offset x + BitVec.toInt sz) = (0 : ℤ) ∧ (∀(i : BitVec 32), ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ BitVec.toInt sz) ∧ Lemmas.value_sub (C.pelts x) (C.offset x + BitVec.toInt i) (C.offset x + BitVec.toInt sz) = (0 : ℤ) → (if (1 : ℤ) ≤ BitVec.toInt i then int'32_in_bounds (BitVec.toInt i - (1 : ℤ)) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt i - (1 : ℤ) → (C.min x ≤ C.offset x + BitVec.toInt o1 ∧ C.offset x + BitVec.toInt o1 < C.max x) ∧ ((BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt o1)) = (0 : ℤ) → C.pelts x (C.offset x + BitVec.toInt o1) = (0 : BitVec 64)) → (if ¬C.pelts x (C.offset x + BitVec.toInt o1) = (0 : BitVec 64) then ((0 : ℤ) ≤ BitVec.toInt (0 : BitVec 32) ∧ BitVec.toInt (0 : BitVec 32) ≤ (1 : ℤ)) ∧ (BitVec.toInt (0 : BitVec 32) = (1 : ℤ)) = (Lemmas.value x (BitVec.toInt sz) = (0 : ℤ)) else ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt o1 < BitVec.toInt i) ∧ ((0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 ≤ BitVec.toInt sz) ∧ Lemmas.value_sub (C.pelts x) (C.offset x + BitVec.toInt o1) (C.offset x + BitVec.toInt sz) = (0 : ℤ)))) else ((0 : ℤ) ≤ BitVec.toInt (1 : BitVec 32) ∧ BitVec.toInt (1 : BitVec 32) ≤ (1 : ℤ)) ∧ (BitVec.toInt (1 : BitVec 32) = (1 : ℤ)) = (Lemmas.value x (BitVec.toInt sz) = (0 : ℤ))))
  := sorry
end util_Util_wmpn_zero_pqtvc
