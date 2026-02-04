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
namespace Div
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def reciprocal_3by2 (v : BitVec 64) (dh : BitVec 64) (dl : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / (BitVec.toUInt dl + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt dh) - ((18446744073709551615 : ℤ) + (1 : ℤ))
noncomputable def normalized (x : C.ptr (BitVec 64)) (sz : BitVec 32) := C.valid x (BitVec.toInt sz) ∧ ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt (C.pelts x (C.offset x + BitVec.toInt sz - (1 : ℤ)))
end Div
