namespace String_lemmas
noncomputable def in_base (b : ℤ) (x : ℤ -> BitVec 8) (n : ℤ) (m : ℤ) := ∀(i : ℤ), n ≤ i ∧ i < m → (0 : ℤ) ≤ BitVec.toInt (x i) ∧ BitVec.toInt (x i) < b
axiom svalue_le_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_le_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_le_sub b x n m = BitVec.toInt (x n) + b * svalue_le_sub b x (n + (1 : ℤ)) m else svalue_le_sub b x n m = (0 : ℤ)
noncomputable def string_in_base (b : ℤ) (p : C.ptr (BitVec 8)) := in_base b (C.pelts p) (C.min p) (C.max p)
noncomputable def svalue_le (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_le_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
axiom svalue_sub : ℤ -> (ℤ -> BitVec 8) -> ℤ -> ℤ -> ℤ
axiom svalue_sub'def (n : ℤ) (m : ℤ) (b : ℤ) (x : ℤ -> BitVec 8) : if n < m then svalue_sub b x n m = BitVec.toInt (x (m - (1 : ℤ))) + b * svalue_sub b x n (m - (1 : ℤ)) else svalue_sub b x n m = (0 : ℤ)
noncomputable def svalue (b : ℤ) (x : C.ptr (BitVec 8)) (sz : ℤ) := svalue_sub b (C.pelts x) (C.offset x) (C.offset x + sz)
end String_lemmas
