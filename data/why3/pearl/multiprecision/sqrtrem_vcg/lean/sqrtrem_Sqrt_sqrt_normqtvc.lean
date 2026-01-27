import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.real.Truncate
import Why3.mach.c.C
import Why3.mach.int.Unsigned
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import pearl.multiprecision.lib.lean.compare.Compare
import pearl.multiprecision.lib.lean.util.Util
import pearl.multiprecision.lib.lean.ptralias.Alias
import pearl.multiprecision.lib.lean.util.UtilOld
import pearl.multiprecision.lib.lean.add_1.Add_1
import pearl.multiprecision.lib.lean.add.Add
import pearl.multiprecision.lib.lean.add.AddOld
import pearl.multiprecision.lib.lean.sub_1.Sub_1
import pearl.multiprecision.lib.lean.sub.SubOld
import pearl.multiprecision.lib.lean.mul.Mul
import pearl.multiprecision.lib.lean.mul.Mul_basecase
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.logical.Logical
import pearl.multiprecision.lib.lean.logical.LogicalOld
import pearl.multiprecision.lib.lean.div.Div
import pearl.multiprecision.lib.lean.sqrt.Sqrt1
import Why3.mach.fxp.Fxp
import pearl.multiprecision.lib.lean.toom.Toom
import pearl.multiprecision.lib.lean.valuation.Valuation
open Classical
open Lean4Why3
namespace sqrtrem_Sqrt_sqrt_normqtvc
noncomputable def ceilhalf (n : ℤ) := Int.tdiv (n + (1 : ℤ)) (2 : ℤ)
axiom ceilhalf'spec'0 (n : ℤ) : n ≤ (2 : ℤ) * ceilhalf n
axiom ceilhalf'spec (n : ℤ) : n < (2 : ℤ) * (ceilhalf n + (1 : ℤ))
theorem sqrt_norm'vc (c : ℤ) (n : ℤ) (s : ℤ) (s0 : ℤ) (fact0 : (0 : ℤ) ≤ c) (fact1 : (0 : ℤ) < n) (fact2 : (0 : ℤ) ≤ s) (fact3 : (0 : ℤ) ≤ s0) (fact4 : s0 < HPow.hPow (2 : ℤ) (Int.toNat c)) (fact5 : (HPow.hPow (2 : ℤ) (Int.toNat c) * s + s0) * (HPow.hPow (2 : ℤ) (Int.toNat c) * s + s0) ≤ HPow.hPow (2 : ℤ) (Int.toNat ((2 : ℤ) * c)) * n) (fact6 : HPow.hPow (2 : ℤ) (Int.toNat ((2 : ℤ) * c)) * n < (HPow.hPow (2 : ℤ) (Int.toNat c) * s + s0 + (1 : ℤ)) * (HPow.hPow (2 : ℤ) (Int.toNat c) * s + s0 + (1 : ℤ))) : s * s ≤ n ∧ n < (s + (1 : ℤ)) * (s + (1 : ℤ))
  := sorry
end sqrtrem_Sqrt_sqrt_normqtvc
