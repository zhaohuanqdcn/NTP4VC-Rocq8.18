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
namespace div_Div_fact_divqtvc
noncomputable def reciprocal (v : BitVec 64) (d : BitVec 64) := BitVec.toUInt v = (((18446744073709551615 : ℤ) + (1 : ℤ)) * ((18446744073709551615 : ℤ) + (1 : ℤ)) - (1 : ℤ)) / BitVec.toUInt d - ((18446744073709551615 : ℤ) + (1 : ℤ))
theorem fact_div'vc (y : ℤ) (x : ℤ) (z : ℤ) (fact0 : (0 : ℤ) < y) : (x + y * z) / y = x / y + z
  := sorry
end div_Div_fact_divqtvc
