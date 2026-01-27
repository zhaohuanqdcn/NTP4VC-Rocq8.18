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
namespace util_Util_normalizeqtvc
theorem normalize'vc (n : BitVec 32) (p : C.ptr (BitVec 64)) (fact0 : (0 : ℤ) ≤ BitVec.toInt n) (fact1 : C.valid p (BitVec.toInt n)) : (0 : ℤ) ≤ BitVec.toInt n ∧ BitVec.toInt n ≤ BitVec.toInt n ∧ (∀(n1 : BitVec 32), Lemmas.value p (BitVec.toInt n1) = Lemmas.value p (BitVec.toInt n) ∧ (0 : ℤ) ≤ BitVec.toInt n1 ∧ BitVec.toInt n1 ≤ BitVec.toInt n → (if (0 : ℤ) < BitVec.toInt n1 then int'32_in_bounds (BitVec.toInt n1 - (1 : ℤ)) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt n1 - (1 : ℤ) → (C.min p ≤ C.offset p + BitVec.toInt o1 ∧ C.offset p + BitVec.toInt o1 < C.max p) ∧ (let o2 : BitVec 64 := C.pelts p (C.offset p + BitVec.toInt o1); ∀(o3 : Bool), (BitVec.toUInt o2 = BitVec.toUInt (0 : BitVec 64) → o3 = true) ∧ (o3 = true → o2 = (0 : BitVec 64)) → (if ¬o3 = true then ((0 : ℤ) ≤ BitVec.toInt n1 ∧ BitVec.toInt n1 ≤ BitVec.toInt n) ∧ Lemmas.value p (BitVec.toInt n1) = Lemmas.value p (BitVec.toInt n) ∧ (BitVec.toInt n1 = (0 : ℤ) ∨ (0 : ℤ) < BitVec.toUInt (C.pelts p (C.offset p + BitVec.toInt n1 - (1 : ℤ)))) ∧ (BitVec.toInt n1 = (0 : ℤ) ∨ HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n1 - (1 : ℤ))) ≤ Lemmas.value p (BitVec.toInt n1)) else int'32_in_bounds (BitVec.toInt n1 - (1 : ℤ)) ∧ (∀(o4 : BitVec 32), BitVec.toInt o4 = BitVec.toInt n1 - (1 : ℤ) → BitVec.toInt o4 < BitVec.toInt n1 ∧ Lemmas.value p (BitVec.toInt o4) = Lemmas.value p (BitVec.toInt n) ∧ (0 : ℤ) ≤ BitVec.toInt o4 ∧ BitVec.toInt o4 ≤ BitVec.toInt n)))) else ((0 : ℤ) ≤ BitVec.toInt n1 ∧ BitVec.toInt n1 ≤ BitVec.toInt n) ∧ Lemmas.value p (BitVec.toInt n1) = Lemmas.value p (BitVec.toInt n) ∧ (BitVec.toInt n1 = (0 : ℤ) ∨ (0 : ℤ) < BitVec.toUInt (C.pelts p (C.offset p + BitVec.toInt n1 - (1 : ℤ)))) ∧ (BitVec.toInt n1 = (0 : ℤ) ∨ HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt n1 - (1 : ℤ))) ≤ Lemmas.value p (BitVec.toInt n1))))
  := sorry
end util_Util_normalizeqtvc
