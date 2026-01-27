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
namespace base_info_BaseInfo_wmpn_limb_size_in_base_2qtvc
axiom wmpn_base_info : Type
axiom inhabited_axiom_wmpn_base_info : Inhabited wmpn_base_info
attribute [instance] inhabited_axiom_wmpn_base_info
axiom b : wmpn_base_info -> ℤ
axiom exp : wmpn_base_info -> BitVec 32
axiom bb : wmpn_base_info -> BitVec 64
axiom wmpn_base_info'invariant (self : wmpn_base_info) : (2 : ℤ) ≤ b self ∧ b self ≤ (256 : ℤ) ∧ BitVec.toUInt (bb self) < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ BitVec.toUInt (bb self) * b self ∧ (7 : ℤ) ≤ BitVec.toUInt (exp self) ∧ BitVec.toUInt (exp self) ≤ (63 : ℤ) ∧ BitVec.toUInt (bb self) = HPow.hPow (b self) (Int.toNat (BitVec.toUInt (exp self)))
noncomputable def wmpn_base_info'eq (a : wmpn_base_info) (b1 : wmpn_base_info) := b a = b b1 ∧ exp a = exp b1 ∧ bb a = bb b1
axiom wmpn_base_info'inj (a : wmpn_base_info) (b1 : wmpn_base_info) (fact0 : wmpn_base_info'eq a b1) : a = b1
theorem wmpn_limb_size_in_base_2'vc (u : BitVec 64) (fact0 : (0 : ℤ) < BitVec.toUInt u) : (0 : ℤ) < BitVec.toUInt u ∧ (∀(o1 : BitVec 32), HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt o1)) * BitVec.toUInt u ≤ (18446744073709551615 : ℤ) ∧ (18446744073709551615 : ℤ) < (2 : ℤ) * HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toInt o1)) * BitVec.toUInt u ∧ (0 : ℤ) ≤ BitVec.toInt o1 ∧ BitVec.toInt o1 < (64 : ℤ) → (0 : ℤ) ≤ BitVec.toInt o1 ∧ (∀(shift : BitVec 64), BitVec.toUInt shift = BitVec.toInt o1 → uint'64_in_bounds ((64 : ℤ) - BitVec.toUInt shift) ∧ (∀(r : BitVec 64), BitVec.toUInt r = (64 : ℤ) - BitVec.toUInt shift → ((1 : ℤ) ≤ BitVec.toUInt r ∧ BitVec.toUInt r ≤ (64 : ℤ)) ∧ HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt r - (1 : ℤ))) ≤ BitVec.toUInt u ∧ BitVec.toUInt u < HPow.hPow (2 : ℤ) (Int.toNat (BitVec.toUInt r)))))
  := sorry
end base_info_BaseInfo_wmpn_limb_size_in_base_2qtvc
