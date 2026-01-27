import Why3.Base
import Why3.why3.Ref.Ref
import Why3.map.Const
import Why3.map.MapEq
import Why3.mach.int.Unsigned
import pearl.multiprecision.lib.lean.types.Config
import pearl.multiprecision.lib.lean.types.Types
import Why3.mach.c.C
import pearl.multiprecision.lib.lean.types.Int32Eq
import pearl.multiprecision.lib.lean.types.UInt64Eq
import pearl.multiprecision.lib.lean.logical.LogicalUtil
import pearl.multiprecision.lib.lean.lemmas.Lemmas
import pearl.multiprecision.lib.lean.logical.Logical
import pearl.multiprecision.lib.lean.ptralias.Alias
open Classical
open Lean4Why3
namespace base_info_BaseInfo_wmpn_get_base_infoqtvc
axiom wmpn_base_info : Type
axiom inhabited_axiom_wmpn_base_info : Inhabited wmpn_base_info
attribute [instance] inhabited_axiom_wmpn_base_info
axiom b : wmpn_base_info -> ℤ
axiom exp : wmpn_base_info -> BitVec 32
axiom bb : wmpn_base_info -> BitVec 64
axiom wmpn_base_info'invariant (self : wmpn_base_info) : (2 : ℤ) ≤ b self ∧ b self ≤ (256 : ℤ) ∧ BitVec.toUInt (bb self) < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ BitVec.toUInt (bb self) * b self ∧ (7 : ℤ) ≤ BitVec.toUInt (exp self) ∧ BitVec.toUInt (exp self) ≤ (63 : ℤ) ∧ BitVec.toUInt (bb self) = HPow.hPow (b self) (Int.toNat (BitVec.toUInt (exp self)))
noncomputable def wmpn_base_info'eq (a : wmpn_base_info) (b1 : wmpn_base_info) := b a = b b1 ∧ exp a = exp b1 ∧ bb a = bb b1
axiom wmpn_base_info'inj (a : wmpn_base_info) (b1 : wmpn_base_info) (fact0 : wmpn_base_info'eq a b1) : a = b1
theorem wmpn_get_base_info'vc (b1 : BitVec 64) (fact0 : (2 : ℤ) ≤ BitVec.toUInt b1) (fact1 : BitVec.toUInt b1 ≤ (256 : ℤ)) : ¬BitVec.toUInt b1 = (0 : ℤ) ∧ uint'64_in_bounds (Int.tdiv (18446744073709551615 : ℤ) (BitVec.toUInt b1)) ∧ (∀(m : BitVec 64), BitVec.toUInt m = Int.tdiv (18446744073709551615 : ℤ) (BitVec.toUInt b1) → (HPow.hPow (BitVec.toUInt b1) (1 : ℕ) = BitVec.toUInt b1 ∧ (1 : ℤ) ≤ (1 : ℤ) ∧ (1 : ℤ) ≤ (64 : ℤ)) ∧ (∀(exp1 : BitVec 32) (p : BitVec 64), HPow.hPow (BitVec.toUInt b1) (Int.toNat (BitVec.toUInt exp1)) = BitVec.toUInt p ∧ (1 : ℤ) ≤ BitVec.toUInt exp1 ∧ BitVec.toUInt exp1 ≤ (64 : ℤ) → (if BitVec.toUInt p ≤ BitVec.toUInt m then uint'64_in_bounds (BitVec.toUInt p * BitVec.toUInt b1) ∧ (∀(o1 : BitVec 64), BitVec.toUInt o1 = BitVec.toUInt p * BitVec.toUInt b1 → uint'32_in_bounds (BitVec.toUInt exp1 + (1 : ℤ)) ∧ (∀(o2 : BitVec 32), BitVec.toUInt o2 = BitVec.toUInt exp1 + (1 : ℤ) → ((0 : ℤ) ≤ BitVec.toUInt m - BitVec.toUInt p ∧ BitVec.toUInt m - BitVec.toUInt o1 < BitVec.toUInt m - BitVec.toUInt p) ∧ HPow.hPow (BitVec.toUInt b1) (Int.toNat (BitVec.toUInt o2)) = BitVec.toUInt o1 ∧ (1 : ℤ) ≤ BitVec.toUInt o2 ∧ BitVec.toUInt o2 ≤ (64 : ℤ))) else let o1 : ℤ := BitVec.toUInt b1; (((2 : ℤ) ≤ o1 ∧ o1 ≤ (256 : ℤ)) ∧ (BitVec.toUInt p < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ BitVec.toUInt p * o1) ∧ ((7 : ℤ) ≤ BitVec.toUInt exp1 ∧ BitVec.toUInt exp1 ≤ (63 : ℤ)) ∧ BitVec.toUInt p = HPow.hPow o1 (Int.toNat (BitVec.toUInt exp1))) ∧ (∀(result : wmpn_base_info), b result = o1 ∧ exp result = exp1 ∧ bb result = p → b result = BitVec.toUInt b1))))
  := sorry
end base_info_BaseInfo_wmpn_get_base_infoqtvc
