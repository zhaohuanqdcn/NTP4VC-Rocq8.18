namespace Spec
noncomputable def matches1 (pat : List (BitVec 8)) (text : List (BitVec 8)) (p : ℤ) := ((0 : ℤ) ≤ p ∧ p ≤ Int.ofNat (List.length text) - Int.ofNat (List.length pat)) ∧ List.drop (Int.toNat p) (List.take (List.length pat - Int.toNat p) text) = pat
end Spec
