namespace ArrayInt63
axiom array63 : Type
axiom inhabited_axiom_array63 : Inhabited array63
attribute [instance] inhabited_axiom_array63
axiom elts : array63 -> List ℤ
axiom size : array63 -> ℤ
axiom array63'invariant (self : array63) : (0 : ℤ) ≤ size self ∧ size self = Int.ofNat (List.length (elts self)) ∧ Int.ofNat (List.length (elts self)) ≤ BitVec.toInt int'63_max ∧ (∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < Int.ofNat (List.length (elts self)) → int'63_in_bounds ((elts self)[Int.toNat i]!))
end ArrayInt63
