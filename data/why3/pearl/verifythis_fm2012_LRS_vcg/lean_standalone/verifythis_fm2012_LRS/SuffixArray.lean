namespace SuffixArray
noncomputable def permutation (m : ℤ -> ℤ) (u : ℤ) := MapInjection.range m u ∧ MapInjection.injective m u
axiom suffixArray : Type
axiom inhabited_axiom_suffixArray : Inhabited suffixArray
attribute [instance] inhabited_axiom_suffixArray
axiom values : suffixArray -> List ℤ
axiom suffixes : suffixArray -> List ℤ
axiom suffixArray'invariant (self : suffixArray) : List.length (values self) = List.length (suffixes self) ∧ permutation (getElem! (suffixes self) ∘ Int.toNat) (Int.ofNat (List.length (suffixes self))) ∧ SuffixSort.sorted (values self) (suffixes self)
noncomputable def suffixArray'eq (a : suffixArray) (b : suffixArray) := values a = values b ∧ suffixes a = suffixes b
axiom suffixArray'inj (a : suffixArray) (b : suffixArray) (fact0 : suffixArray'eq a b) : a = b
end SuffixArray
