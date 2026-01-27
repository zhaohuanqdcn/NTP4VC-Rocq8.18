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
namespace logical_LogicalUtil_lsld_extqtvc
theorem lsld_ext'vc (cnt : BitVec 64) (x : BitVec 64) (fact0 : (0 : ℤ) < BitVec.toUInt cnt) (fact1 : BitVec.toUInt cnt < (64 : ℤ)) : (0 : ℤ) < BitVec.toUInt cnt ∧ BitVec.toUInt cnt < (64 : ℤ) ∧ (∀(r : BitVec 64) (d : BitVec 64), BitVec.toUInt r + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt d = HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) * BitVec.toUInt x → BitVec.toUInt r + ((18446744073709551615 : ℤ) + (1 : ℤ)) * BitVec.toUInt d = HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) * BitVec.toUInt x ∧ BitVec.toUInt r % HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) = (0 : ℤ) ∧ BitVec.toUInt r ≤ (18446744073709551615 : ℤ) + (1 : ℤ) - HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)) ∧ BitVec.toUInt d < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt cnt)))
  := sorry
end logical_LogicalUtil_lsld_extqtvc
