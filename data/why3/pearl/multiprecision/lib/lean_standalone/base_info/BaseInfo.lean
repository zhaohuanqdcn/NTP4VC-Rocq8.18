namespace BaseInfo
axiom wmpn_base_info : Type
axiom inhabited_axiom_wmpn_base_info : Inhabited wmpn_base_info
attribute [instance] inhabited_axiom_wmpn_base_info
axiom b : wmpn_base_info -> ℤ
axiom exp : wmpn_base_info -> BitVec 32
axiom bb : wmpn_base_info -> BitVec 64
axiom wmpn_base_info'invariant (self : wmpn_base_info) : (2 : ℤ) ≤ b self ∧ b self ≤ (256 : ℤ) ∧ BitVec.toUInt (bb self) < (18446744073709551615 : ℤ) + (1 : ℤ) ∧ (18446744073709551615 : ℤ) + (1 : ℤ) ≤ BitVec.toUInt (bb self) * b self ∧ (7 : ℤ) ≤ BitVec.toUInt (exp self) ∧ BitVec.toUInt (exp self) ≤ (63 : ℤ) ∧ BitVec.toUInt (bb self) = HPow.hPow (b self) (Int.toNat (BitVec.toUInt (exp self)))
noncomputable def wmpn_base_info'eq (a : wmpn_base_info) (b1 : wmpn_base_info) := b a = b b1 ∧ exp a = exp b1 ∧ bb a = bb b1
axiom wmpn_base_info'inj (a : wmpn_base_info) (b1 : wmpn_base_info) (fact0 : wmpn_base_info'eq a b1) : a = b1
end BaseInfo
