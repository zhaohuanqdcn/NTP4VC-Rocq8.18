namespace StrlenLemmas
axiom strlen_before_null (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < String.strlen s ofs) : ¬BitVec.toInt (s (ofs + i)) = (0 : ℤ)
axiom strlen_at_null (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ String.strlen s ofs) : BitVec.toInt (s (ofs + String.strlen s ofs)) = (0 : ℤ)
axiom strlen_not_0 (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < String.strlen s ofs) (fact2 : ¬BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : i < String.strlen s ofs
axiom strlen_0 (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < String.strlen s ofs) (fact2 : BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : i = String.strlen s ofs
axiom strlen_sup (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : (0 : ℤ) ≤ String.strlen s ofs ∧ String.strlen s ofs ≤ i
end StrlenLemmas
