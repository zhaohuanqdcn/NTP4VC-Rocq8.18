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
namespace util_Util_wmpn_zeroqtvc
theorem wmpn_zero'vc (r : C.ptr (BitVec 64)) (sz : BitVec 32) (fact0 : C.valid r (BitVec.toInt sz)) (fact1 : C.writable r = true) : (0 : ℤ) ≤ (0 : ℤ) ∧ (0 : ℤ) ≤ BitVec.toInt sz ∧ Lemmas.value r (0 : ℤ) = (0 : ℤ) ∧ (∀(i : BitVec 32) (r1 : C.ptr (BitVec 64)), List.length (C.data r1) = List.length (C.data r) ∧ C.offset r1 = C.offset r ∧ C.min r1 = C.min r ∧ C.max r1 = C.max r ∧ C.writable r1 = C.writable r ∧ C.zone1 r1 = C.zone1 r → ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ BitVec.toInt sz) ∧ Lemmas.value r1 (BitVec.toInt i) = (0 : ℤ) ∧ (∀(j : ℤ), j < C.offset r1 ∨ C.offset r1 + BitVec.toInt sz ≤ j → C.pelts r1 j = C.pelts r j) → (if BitVec.toInt i < BitVec.toInt sz then ((C.min r1 ≤ C.offset r1 + BitVec.toInt i ∧ C.offset r1 + BitVec.toInt i < C.max r1) ∧ C.writable r1 = true) ∧ (∀(r2 : C.ptr (BitVec 64)), List.length (C.data r2) = List.length (C.data r1) ∧ C.offset r2 = C.offset r1 ∧ C.min r2 = C.min r1 ∧ C.max r2 = C.max r1 ∧ C.writable r2 = C.writable r1 ∧ C.zone1 r2 = C.zone1 r1 → C.pelts r2 = Function.update (C.pelts r1) (C.offset r2 + BitVec.toInt i) (0 : BitVec 64) ∧ C.pelts r2 (C.offset r2 + BitVec.toInt i) = (0 : BitVec 64) → int'32_in_bounds (BitVec.toInt i + (1 : ℤ)) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt i + (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toInt sz - BitVec.toInt i ∧ BitVec.toInt sz - BitVec.toInt o1 < BitVec.toInt sz - BitVec.toInt i) ∧ ((0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 ≤ BitVec.toInt sz) ∧ Lemmas.value r2 (BitVec.toInt o1) = (0 : ℤ) ∧ (∀(j : ℤ), j < C.offset r2 ∨ C.offset r2 + BitVec.toInt sz ≤ j → C.pelts r2 j = C.pelts r j))) else Lemmas.value r1 (BitVec.toInt sz) = (0 : ℤ) ∧ (∀(j : ℤ), j < C.offset r1 ∨ C.offset r1 + BitVec.toInt sz ≤ j → C.pelts r1 j = C.pelts r j)))
  := sorry
end util_Util_wmpn_zeroqtvc
