namespace String
axiom zero_char : BitVec 8
axiom zero_char'def : BitVec.toInt zero_char = (0 : ℤ)
axiom numcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (10 : ℤ)) : BitVec.toInt (([48, 49, 50, 51, 52, 53, 54, 55, 56, 57] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom lowcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (26 : ℤ)) : BitVec.toInt (([97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom upcodes (i : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (26 : ℤ)) : BitVec.toInt (([65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90] : List (BitVec 8))[Int.toNat i]!) = BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) + i
axiom code_0 : BitVec.toInt (([48] : List (BitVec 8))[(0 : ℕ)]!) = (48 : ℤ)
axiom code_a : BitVec.toInt (([97] : List (BitVec 8))[(0 : ℕ)]!) = (97 : ℤ)
axiom code_A : BitVec.toInt (([65] : List (BitVec 8))[(0 : ℕ)]!) = (65 : ℤ)
axiom code_minus : BitVec.toInt (([45] : List (BitVec 8))[(0 : ℕ)]!) = (45 : ℤ)
axiom strlen : (ℤ -> BitVec 8) -> ℤ -> ℤ
axiom strlen_def (i : ℤ) (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : ∀(j : ℤ), (0 : ℤ) ≤ j ∧ j < i → ¬BitVec.toInt (s (ofs + j)) = (0 : ℤ)) (fact2 : BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : strlen s ofs = i
axiom strlen_invalid (s : ℤ -> BitVec 8) (ofs : ℤ) (fact0 : ∀(i : ℤ), (0 : ℤ) ≤ i → ¬BitVec.toInt (s (ofs + i)) = (0 : ℤ)) : strlen s ofs < (0 : ℤ)
noncomputable def valid_string (p : C.ptr (BitVec 8)) := (0 : ℤ) ≤ strlen (C.pelts p) (C.offset p) ∧ C.valid p ((1 : ℤ) + strlen (C.pelts p) (C.offset p))
end String
