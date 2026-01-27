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
namespace logical_LogicalUtil_lsl_mod_extqtvc
theorem lsl_mod_ext'vc (cnt : BitVec 64) (x : BitVec 64) (fact0 : (0 : ℤ) ≤ BitVec.toUInt cnt) (fact1 : BitVec.toUInt cnt < (64 : ℤ)) : (0 : ℤ) ≤ BitVec.toUInt cnt ∧ BitVec.toUInt cnt < (64 : ℤ) ∧ (∀(r : BitVec 64), BitVec.toUInt r = BitVec.toUInt x * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) % ((18446744073709551615 : ℤ) + (1 : ℤ)) → ¬(18446744073709551615 : ℤ) + (1 : ℤ) = (0 : ℤ) ∧ BitVec.toUInt r = BitVec.toUInt x * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) % ((18446744073709551615 : ℤ) + (1 : ℤ)) ∧ BitVec.toUInt r ≤ (18446744073709551615 : ℤ) + (1 : ℤ) - HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)))
  := sorry
end logical_LogicalUtil_lsl_mod_extqtvc
