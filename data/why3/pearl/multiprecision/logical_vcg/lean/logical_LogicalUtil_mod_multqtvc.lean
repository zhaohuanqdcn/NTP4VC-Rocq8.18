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
namespace logical_LogicalUtil_mod_multqtvc
theorem mod_mult'vc (x : ℤ) (y : ℤ) (z : ℤ) (fact0 : (0 : ℤ) < x) : (x * y + z) % x = z % x
  := sorry
end logical_LogicalUtil_mod_multqtvc
