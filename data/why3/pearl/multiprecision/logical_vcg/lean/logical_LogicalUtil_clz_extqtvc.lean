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
namespace logical_LogicalUtil_clz_extqtvc
theorem clz_ext'vc (x : BitVec 64) (fact0 : (0 : ℤ) < BitVec.toUInt x) : (0 : ℤ) < BitVec.toUInt x ∧ (∀(r : BitVec 32), HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)) * BitVec.toUInt x ≤ (18446744073709551615 : ℤ) ∧ (18446744073709551615 : ℤ) < (2 : ℤ) * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)) * BitVec.toUInt x ∧ (0 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < (64 : ℤ) → HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)) * BitVec.toUInt x < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ (2 : ℤ) * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)) * BitVec.toUInt x ∧ ((0 : ℤ) ≤ BitVec.toInt r ∧ BitVec.toInt r < (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)) * BitVec.toUInt x ≤ (18446744073709551615 : ℤ) + (1 : ℤ) - HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt r)))
  := sorry
end logical_LogicalUtil_clz_extqtvc
