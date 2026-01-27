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
import pearl.multiprecision.lib.lean.ptralias.Alias
import pearl.multiprecision.lib.lean.util.UtilOld
import pearl.multiprecision.lib.lean.add.AddOld
import pearl.multiprecision.lib.lean.sub.SubOld
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.logical.LogicalOld
open Classical
open Lean4Why3
namespace div_Div_invert_limbqtvc
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
theorem invert_limb'vc (d : BitVec 64) (fact0 : ((18446744073709551615 : ℤ) + (1 : ℤ)) / (2 : ℤ) ≤ BitVec.toUInt d) : let o1 : BitVec 64 := uint'64_max; uint'64_in_bounds (BitVec.toUInt o1 - BitVec.toUInt d) ∧ (∀(o2 : BitVec 64), BitVec.toUInt o2 = BitVec.toUInt o1 - BitVec.toUInt d → BitVec.toUInt o2 < BitVec.toUInt d ∧ (∀(v : BitVec 64), BitVec.toUInt v = (BitVec.toUInt uint'64_max + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt o2) / BitVec.toUInt d → reciprocal v d))
  := sorry
end div_Div_invert_limbqtvc
