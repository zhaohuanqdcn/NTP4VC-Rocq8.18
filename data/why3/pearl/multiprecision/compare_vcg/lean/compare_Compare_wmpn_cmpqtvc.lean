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
namespace compare_Compare_wmpn_cmpqtvc
noncomputable def compare_int (x : ℤ) (y : ℤ) := if x < y then -(1 : ℤ) else if x = y then (0 : ℤ) else (1 : ℤ)
theorem wmpn_cmp'vc (x : C.ptr (BitVec 64)) (sz : BitVec 32) (y : C.ptr (BitVec 64)) (fact0 : C.valid x (BitVec.toInt sz)) (fact1 : C.valid y (BitVec.toInt sz)) : (0 : ℤ) ≤ BitVec.toInt sz ∧ BitVec.toInt sz ≤ BitVec.toInt sz ∧ (∀(j : ℤ), BitVec.toInt sz ≤ j ∧ j < BitVec.toInt sz → C.pelts x (C.offset x + j) = C.pelts y (C.offset y + j)) ∧ (∀(i : BitVec 32), ((0 : ℤ) ≤ BitVec.toInt i ∧ BitVec.toInt i ≤ BitVec.toInt sz) ∧ (∀(j : ℤ), BitVec.toInt i ≤ j ∧ j < BitVec.toInt sz → C.pelts x (C.offset x + j) = C.pelts y (C.offset y + j)) → (if (1 : ℤ) ≤ BitVec.toInt i then int'32_in_bounds (BitVec.toInt i - (1 : ℤ)) ∧ (∀(o1 : BitVec 32), BitVec.toInt o1 = BitVec.toInt i - (1 : ℤ) → (C.min x ≤ C.offset x + BitVec.toInt o1 ∧ C.offset x + BitVec.toInt o1 < C.max x) ∧ (let lx : BitVec 64 := C.pelts x (C.offset x + BitVec.toInt o1); (C.min y ≤ C.offset y + BitVec.toInt o1 ∧ C.offset y + BitVec.toInt o1 < C.max y) ∧ (let ly : BitVec 64 := C.pelts y (C.offset y + BitVec.toInt o1); ∀(o2 : Bool), (BitVec.toUInt lx = BitVec.toUInt ly → o2 = true) ∧ (o2 = true → lx = ly) → (if ¬o2 = true then if BitVec.toUInt ly < BitVec.toUInt lx then (1 : ℤ) = compare_int (Lemmas.value x (BitVec.toInt sz)) (Lemmas.value y (BitVec.toInt sz)) else -(1 : ℤ) = compare_int (Lemmas.value x (BitVec.toInt sz)) (Lemmas.value y (BitVec.toInt sz)) else BitVec.toInt o1 < BitVec.toInt i ∧ ((0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 ≤ BitVec.toInt sz) ∧ (∀(j : ℤ), BitVec.toInt o1 ≤ j ∧ j < BitVec.toInt sz → C.pelts x (C.offset x + j) = C.pelts y (C.offset y + j)))))) else (0 : ℤ) = compare_int (Lemmas.value x (BitVec.toInt sz)) (Lemmas.value y (BitVec.toInt sz))))
  := sorry
end compare_Compare_wmpn_cmpqtvc
