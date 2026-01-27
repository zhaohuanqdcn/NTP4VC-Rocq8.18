import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.c.C
import Why3.mach.int.Unsigned
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.ptralias.Alias
open Classical
open Lean4Why3
namespace add_Add_add_n_rxyqtvc
theorem add_n_rxy'vc (sx : BitVec 32) (x : C.ptr (BitVec 64)) (fact0 : (0 : ℤ) ≤ BitVec.toInt sx) (fact1 : C.writable x = true) (fact2 : C.valid x (BitVec.toInt sx)) : (0 : ℤ) ≤ BitVec.toInt sx ∧ C.valid x (BitVec.toInt sx) ∧ C.writable x = true ∧ (∀(x1 : C.ptr (BitVec 64)), List.length (C.data x1) = List.length (C.data x) ∧ C.offset x1 = C.offset x ∧ C.min x1 = C.min x ∧ C.max x1 = C.max x ∧ C.writable x1 = C.writable x ∧ C.zone1 x1 = C.zone1 x → (∀(result : BitVec 64), Lemmas.value x1 (BitVec.toInt sx) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt sx)) * BitVec.toUInt result = Lemmas.value x (BitVec.toInt sx) + Lemmas.value x (BitVec.toInt sx) ∧ ((0 : ℤ) ≤ BitVec.toUInt result ∧ BitVec.toUInt result ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset x1 ∨ C.offset x1 + BitVec.toInt sx ≤ j → C.pelts x1 j = C.pelts x j) → Lemmas.value x1 (BitVec.toInt sx) + HPow.hPow ((18446744073709551615 : ℤ) + (1 : ℤ)) (Int.toNat (BitVec.toInt sx)) * BitVec.toUInt result = Lemmas.value x (BitVec.toInt sx) + Lemmas.value x (BitVec.toInt sx) ∧ ((0 : ℤ) ≤ BitVec.toUInt result ∧ BitVec.toUInt result ≤ (1 : ℤ)) ∧ (∀(j : ℤ), j < C.offset x1 ∨ C.offset x1 + BitVec.toInt sx ≤ j → C.pelts x1 j = C.pelts x j) ∧ C.min x1 = C.min x ∧ C.max x1 = C.max x ∧ C.plength x1 = C.plength x))
  := sorry
end add_Add_add_n_rxyqtvc
