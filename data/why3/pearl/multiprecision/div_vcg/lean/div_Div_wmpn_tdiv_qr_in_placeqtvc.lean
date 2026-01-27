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
import pearl.multiprecision.lib.lean.compare.Compare
import pearl.multiprecision.lib.lean.util.Util
import pearl.multiprecision.lib.lean.ptralias.Alias
import pearl.multiprecision.lib.lean.util.UtilOld
import pearl.multiprecision.lib.lean.add.Add
import pearl.multiprecision.lib.lean.add.AddOld
import pearl.multiprecision.lib.lean.sub.SubOld
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.logical.LogicalOld
import pearl.multiprecision.lib.lean.mul.Mul
open Classical
open Lean4Why3
namespace div_Div_wmpn_tdiv_qr_in_placeqtvc
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def reciprocal_3by2 (v : BitVec 64) (dh : BitVec 64) (dl : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / (BitVec.toUInt dl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt dh) - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def normalized (x : C.ptr (BitVec 64)) (sz : BitVec 32) := C.valid x (BitVec.toInt sz) ∧ ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt sz - (1 : ℤ)))
theorem wmpn_tdiv_qr_in_place'vc (sy : BitVec 32) (sx : BitVec 32) (x : C.ptr (BitVec 64)) (y : C.ptr (BitVec 64)) (q : C.ptr (BitVec 64)) (qxn : BitVec 32) (fact0 : (1 : ℤ) ≤ BitVec.toInt sy) (fact1 : BitVec.toInt sy ≤ BitVec.toInt sx) (fact2 : BitVec.toInt sx ≤ (2147483647 : ℤ) - (1 : ℤ)) (fact3 : C.valid x (BitVec.toInt sx)) (fact4 : C.valid y (BitVec.toInt sy)) (fact5 : C.valid q (BitVec.toInt sx - BitVec.toInt sy + (1 : ℤ))) (fact6 : C.writable x = true) (fact7 : C.writable q = true) (fact8 : BitVec.toInt qxn = (0 : ℤ)) (fact9 : (0 : ℤ) < BitVec.toUInt (C.pelts y (C.offset y + BitVec.toInt sy - (1 : ℤ)))) : (0 : ℤ) ≤ BitVec.toInt sx ∧ (∀(o1 : BitVec 32), BitVec.toUInt o1 = BitVec.toInt sx → uint'32_in_bounds (BitVec.toUInt o1 + (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toUInt o2 = BitVec.toUInt o1 + (1 : ℤ) → (0 : ℤ) ≤ BitVec.toUInt o2 ∧ (∀(nx : C.ptr (BitVec 64)), (¬C.zone1 nx = C.null_zone → C.plength nx = BitVec.toUInt o2) ∧ C.offset nx = (0 : ℤ) ∧ C.min nx = (0 : ℤ) ∧ C.max nx = C.plength nx ∧ C.writable nx = true → C.is_not_null nx = (¬C.zone1 nx = C.null_zone) → C.is_not_null nx → (0 : ℤ) ≤ BitVec.toInt sy ∧ (∀(o3 : BitVec 32), BitVec.toUInt o3 = BitVec.toInt sy → (0 : ℤ) ≤ BitVec.toUInt o3 ∧ (∀(ny : C.ptr (BitVec 64)), (¬C.zone1 ny = C.null_zone → C.plength ny = BitVec.toUInt o3) ∧ C.offset ny = (0 : ℤ) ∧ C.min ny = (0 : ℤ) ∧ C.max ny = C.plength ny ∧ C.writable ny = true → C.is_not_null ny = (¬C.zone1 ny = C.null_zone) → C.is_not_null ny → (((1 : ℤ) ≤ BitVec.toInt sy ∧ BitVec.toInt sy ≤ BitVec.toInt sx ∧ BitVec.toInt sx ≤ (2147483647 : ℤ) - (1 : ℤ)) ∧ C.valid x (BitVec.toInt sx) ∧ C.valid y (BitVec.toInt sy) ∧ C.valid q (BitVec.toInt sx - BitVec.toInt sy + (1 : ℤ)) ∧ C.valid nx (BitVec.toInt sx + (1 : ℤ)) ∧ C.valid ny (BitVec.toInt sy) ∧ (C.writable q = true ∧ C.writable x = true) ∧ (C.writable nx = true ∧ C.writable ny = true) ∧ (0 : ℤ) < BitVec.toUInt (C.pelts y (C.offset y + BitVec.toInt sy - (1 : ℤ)))) ∧ (∀(ny1 : C.ptr (BitVec 64)) (nx1 : C.ptr (BitVec 64)) (x1 : C.ptr (BitVec 64)) (q1 : C.ptr (BitVec 64)), List.length (C.data ny1) = List.length (C.data ny) ∧ C.offset ny1 = C.offset ny ∧ C.min ny1 = C.min ny ∧ C.max ny1 = C.max ny ∧ C.writable ny1 = C.writable ny ∧ C.zone1 ny1 = C.zone1 ny → List.length (C.data nx1) = List.length (C.data nx) ∧ C.offset nx1 = C.offset nx ∧ C.min nx1 = C.min nx ∧ C.max nx1 = C.max nx ∧ C.writable nx1 = C.writable nx ∧ C.zone1 nx1 = C.zone1 nx → List.length (C.data x1) = List.length (C.data x) ∧ C.offset x1 = C.offset x ∧ C.min x1 = C.min x ∧ C.max x1 = C.max x ∧ C.writable x1 = C.writable x ∧ C.zone1 x1 = C.zone1 x → List.length (C.data q1) = List.length (C.data q) ∧ C.offset q1 = C.offset q ∧ C.min q1 = C.min q ∧ C.max q1 = C.max q ∧ C.writable q1 = C.writable q ∧ C.zone1 q1 = C.zone1 q → Lemmas.value x (BitVec.toInt sx) = Lemmas.value q1 (BitVec.toInt sx - BitVec.toInt sy + (1 : ℤ)) * Lemmas.value y (BitVec.toInt sy) + Lemmas.value x1 (BitVec.toInt sy) ∧ Lemmas.value x1 (BitVec.toInt sy) < Lemmas.value y (BitVec.toInt sy) → (C.offset nx1 = (0 : ℤ) ∧ C.min nx1 = (0 : ℤ) ∧ C.max nx1 = C.plength nx1 ∧ C.writable nx1 = true) ∧ (C.offset ny1 = (0 : ℤ) ∧ C.min ny1 = (0 : ℤ) ∧ C.max ny1 = C.plength ny1 ∧ C.writable ny1 = true) ∧ Lemmas.value x (BitVec.toInt sx) = Lemmas.value q1 (BitVec.toInt sx - BitVec.toInt sy + (1 : ℤ)) * Lemmas.value y (BitVec.toInt sy) + Lemmas.value x1 (BitVec.toInt sy) ∧ Lemmas.value x1 (BitVec.toInt sy) < Lemmas.value y (BitVec.toInt sy)))))))
  := sorry
end div_Div_wmpn_tdiv_qr_in_placeqtvc
