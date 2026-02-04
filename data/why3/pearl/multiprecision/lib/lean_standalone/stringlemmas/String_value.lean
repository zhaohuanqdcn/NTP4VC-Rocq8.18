namespace String_value
axiom abs_value_sub_text : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom abs_value_sub_text'def (n : ℤ) (m : ℤ) (b : ℤ) (s : ℤ -> BitVec 8) : if n < m then abs_value_sub_text b s n m = Conversions.text_to_num b (s (m - (1 : ℤ))) + b * abs_value_sub_text b s n (m - (1 : ℤ)) else abs_value_sub_text b s n m = (0 : ℤ)
noncomputable def abs_value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := abs_value_sub_text b s ofs (ofs + String.strlen s ofs)
noncomputable def value_text (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := if s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! then -abs_value_text b s (ofs + (1 : ℤ)) else abs_value_text b s ofs
noncomputable def text_in_base (b : ℤ) (t : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ Conversions.text_to_num b (t i) ∧ Conversions.text_to_num b (t i) < b
noncomputable def string_in_base (b : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) := text_in_base b s ofs (ofs + String.strlen s ofs) ∧ (0 : ℤ) < String.strlen s ofs ∨ s ofs = ([45] : List (BitVec 8))[(0 : ℕ)]! ∧ text_in_base b s (ofs + (1 : ℤ)) (ofs + String.strlen s ofs) ∧ (1 : ℤ) < String.strlen s ofs
end String_value
