namespace Cbits
axiom bit_testb : ℤ -> ℤ -> Bool
axiom bit_test : ℤ -> ℤ -> Prop
axiom lnot : ℤ -> ℤ
axiom land : ℤ -> ℤ -> ℤ
axiom lxor : ℤ -> ℤ -> ℤ
axiom lor : ℤ -> ℤ -> ℤ
axiom lsl : ℤ -> ℤ -> ℤ
axiom lsr : ℤ -> ℤ -> ℤ
axiom lnot_bool : lnot (0 : ℤ) = -(1 : ℤ) ∧ lnot (-(1 : ℤ)) = (0 : ℤ)
axiom land_idemp (x : ℤ) : land x x = x
axiom land_idemp_bis (x : ℤ) (y : ℤ) : land x (land x y) = land x y
axiom land_0 (x : ℤ) : land (0 : ℤ) x = (0 : ℤ)
axiom land_0bis (x : ℤ) : land x (0 : ℤ) = (0 : ℤ)
axiom land_1 (x : ℤ) : land (-(1 : ℤ)) x = x
axiom land_1bis (x : ℤ) : land x (-(1 : ℤ)) = x
axiom land_bool : land (0 : ℤ) (0 : ℤ) = (0 : ℤ) ∧ land (0 : ℤ) (1 : ℤ) = (0 : ℤ) ∧ land (1 : ℤ) (0 : ℤ) = (0 : ℤ) ∧ land (1 : ℤ) (1 : ℤ) = (1 : ℤ)
axiom lor_idemp (x : ℤ) : lor x x = x
axiom lor_idemp_bis (x : ℤ) (y : ℤ) : lor x (lor x y) = lor x y
axiom lor_1 (x : ℤ) : lor (-(1 : ℤ)) x = -(1 : ℤ)
axiom lor_1bis (x : ℤ) : lor x (-(1 : ℤ)) = -(1 : ℤ)
axiom lor_0 (x : ℤ) : lor (0 : ℤ) x = x
axiom lor_0bis (x : ℤ) : lor x (0 : ℤ) = x
axiom lor_bool : lor (0 : ℤ) (0 : ℤ) = (0 : ℤ) ∧ lor (0 : ℤ) (1 : ℤ) = (1 : ℤ) ∧ lor (1 : ℤ) (0 : ℤ) = (1 : ℤ) ∧ lor (1 : ℤ) (1 : ℤ) = (1 : ℤ)
axiom lxor_nilpotent (x : ℤ) : lxor x x = (0 : ℤ)
axiom lxor_nilpotent_bis (x : ℤ) (y : ℤ) : lxor x (lxor x y) = y
axiom lxor_1 (x : ℤ) : lxor (-(1 : ℤ)) x = lnot x
axiom lxor_1bis (x : ℤ) : lxor x (-(1 : ℤ)) = lnot x
axiom lxor_0 (x : ℤ) : lxor (0 : ℤ) x = x
axiom lxor_0bis (x : ℤ) : lxor x (0 : ℤ) = x
axiom lxor_bool : lxor (0 : ℤ) (0 : ℤ) = (0 : ℤ) ∧ lxor (0 : ℤ) (1 : ℤ) = (1 : ℤ) ∧ lxor (1 : ℤ) (0 : ℤ) = (1 : ℤ) ∧ lxor (1 : ℤ) (1 : ℤ) = (0 : ℤ)
axiom lsl_0 (x : ℤ) : lsl x (0 : ℤ) = x
axiom lsl_1 (x : ℤ) : lsl x (1 : ℤ) = (2 : ℤ) * x
axiom lsl_add (p : ℤ) (q : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ p) (fact1 : (0 : ℤ) ≤ q) : lsl (lsl x p) q = lsl x (p + q)
axiom lsr_0 (x : ℤ) : lsr x (0 : ℤ) = x
axiom lsr_1 (x : ℤ) (fact0 : (0 : ℤ) ≤ x) : lsr x (1 : ℤ) = Int.tdiv x (2 : ℤ)
axiom lsr_add (p : ℤ) (q : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ p) (fact1 : (0 : ℤ) ≤ q) : lsr (lsr x p) q = lsr x (p + q)
axiom lsl_lsr_add (q : ℤ) (p : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ q) (fact1 : q ≤ p) : lsr (lsl x p) q = lsl x (p - q)
axiom bit_test_def (x : ℤ) (k : ℤ) : (bit_testb x k = true) = bit_test x k
axiom bit_test_extraction (k : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ k) : (¬land x (lsl (1 : ℤ) k) = (0 : ℤ)) = bit_test x k
axiom bit_test_extraction_eq (k : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ k) : (land x (lsl (1 : ℤ) k) = lsl (1 : ℤ) k) = bit_test x k
axiom lsl_1_0 : lsl (1 : ℤ) (0 : ℤ) = (1 : ℤ)
axiom bit_test_extraction_bis (x : ℤ) (fact0 : ¬land (1 : ℤ) x = (0 : ℤ)) : bit_test x (0 : ℤ)
axiom bit_test_extraction_bis_eq (x : ℤ) (fact0 : bit_test x (0 : ℤ)) : land (1 : ℤ) x = (1 : ℤ)
axiom lnot_extraction_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_testb (lnot x) i = (¬bit_testb x i)
axiom lnot_extraction (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_test (lnot x) i = (¬bit_test x i)
axiom land_extraction_bool (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_testb (land x y) i = (bit_testb x i && bit_testb y i)
axiom land_extraction (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_test (land x y) i = (bit_test x i ∧ bit_test y i)
axiom lor_extraction_bool (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_testb (lor x y) i = (bit_testb x i || bit_testb y i)
axiom lor_extraction (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_test (lor x y) i = (bit_test x i ∨ bit_test y i)
axiom lxor_extraction_bool (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_testb (lxor x y) i = (bit_testb x i ^^ bit_testb y i)
axiom lxor_extraction (i : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ i) : bit_test (lxor x y) i = (bit_test x i = (¬bit_test y i))
axiom lsl_1_two_power (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : lsl (1 : ℤ) n = Cint.two_power_abs n
axiom land_1_lsl_1 (n : ℤ) (a : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : a < lsl (1 : ℤ) n) : (2 : ℤ) * a + land (1 : ℤ) x < lsl (1 : ℤ) ((1 : ℤ) + n)
axiom lsl_extraction_sup_bool (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) (fact2 : n ≤ m) : bit_testb (lsl x n) m = bit_testb x (m - n)
axiom lsl_extraction_sup (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) (fact2 : n ≤ m) : bit_test (lsl x n) m = bit_test x (m - n)
axiom lsl_extraction_inf_bool (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) (fact2 : m < n) : bit_testb (lsl x n) m = false
axiom lsl_extraction_inf (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) (fact2 : m < n) : ¬bit_test (lsl x n) m
axiom lsr_extraction_bool (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : bit_testb (lsr x n) m = bit_testb x (m + n)
axiom lsr_extractionl (n : ℤ) (m : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : (0 : ℤ) ≤ m) : bit_test (lsr x n) m = bit_test x (m + n)
axiom lsl1_extraction_bool (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : bit_testb (lsl (1 : ℤ) i) j = (if i = j then true else false)
axiom lsl1_extraction (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : (0 : ℤ) ≤ j) : bit_test (lsl (1 : ℤ) i) j = (i = j)
axiom pos_extraction_sup (x : ℤ) (i : ℤ) (j : ℤ) (fact0 : (0 : ℤ) ≤ x) (fact1 : (0 : ℤ) ≤ i) (fact2 : x < lsl (1 : ℤ) i) (fact3 : i ≤ j) : ¬bit_test x j
axiom pos_extraction_sup_inv (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : ∀(j : ℤ), i ≤ j → ¬bit_test x j) : (0 : ℤ) ≤ x ∧ x < lsl (1 : ℤ) i
axiom to_uint_extraction_sup (n : ℤ) (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ i) (fact2 : Cint.is_uint n x) : ¬bit_test x i
axiom to_uint_extraction_inf_bool (i : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : bit_testb (Cint.to_uint n x) i = bit_testb x i
axiom to_uint_extraction_inf (i : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : bit_test (Cint.to_uint n x) i = bit_test x i
axiom is_uint_ext (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Cint.is_uint n x) (fact2 : Cint.is_uint n y) (fact3 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < n → bit_test x i = bit_test y i) : x = y
axiom to_uint8_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (8 : ℤ) ≤ i) (fact1 : Cint.is_uint8 x) : ¬bit_test x i
axiom to_uint8_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (8 : ℤ)) : bit_testb (Cint.to_uint8 x) i = bit_testb x i
axiom to_uint8_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (8 : ℤ)) : bit_test (Cint.to_uint8 x) i = bit_test x i
axiom is_uint8_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint8 x) (fact1 : Cint.is_uint8 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (8 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_uint16_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (16 : ℤ) ≤ i) (fact1 : Cint.is_uint16 x) : ¬bit_test x i
axiom to_uint16_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (16 : ℤ)) : bit_testb (Cint.to_uint16 x) i = bit_testb x i
axiom to_uint16_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (16 : ℤ)) : bit_test (Cint.to_uint16 x) i = bit_test x i
axiom is_uint16_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint16 x) (fact1 : Cint.is_uint16 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (16 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_uint32_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (32 : ℤ) ≤ i) (fact1 : Cint.is_uint32 x) : ¬bit_test x i
axiom to_uint32_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (32 : ℤ)) : bit_testb (Cint.to_uint32 x) i = bit_testb x i
axiom to_uint32_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (32 : ℤ)) : bit_test (Cint.to_uint32 x) i = bit_test x i
axiom is_uint32_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint32 x) (fact1 : Cint.is_uint32 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (32 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_uint64_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (64 : ℤ) ≤ i) (fact1 : Cint.is_uint64 x) : ¬bit_test x i
axiom to_uint64_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (64 : ℤ)) : bit_testb (Cint.to_uint64 x) i = bit_testb x i
axiom to_uint64_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (64 : ℤ)) : bit_test (Cint.to_uint64 x) i = bit_test x i
axiom is_uint64_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint64 x) (fact1 : Cint.is_uint64 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i < (64 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_sint_extraction_sup (n : ℤ) (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ i) (fact2 : Cint.is_sint n x) : bit_test x i = (x < (0 : ℤ))
axiom to_sint_extraction_inf_bool (i : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : bit_testb (Cint.to_sint n x) i = bit_testb x i
axiom to_sint_extraction_inf (i : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < n) : bit_test (Cint.to_sint n x) i = bit_test x i
axiom is_sint_ext (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : Cint.is_sint n x) (fact2 : Cint.is_sint n y) (fact3 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ n → bit_test x i = bit_test y i) : x = y
axiom to_sint8_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (7 : ℤ) ≤ i) (fact1 : Cint.is_sint8 x) : bit_test x i = (x < (0 : ℤ))
axiom to_sint8_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (7 : ℤ)) : bit_testb (Cint.to_sint8 x) i = bit_testb x i
axiom to_sint8_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (7 : ℤ)) : bit_test (Cint.to_sint8 x) i = bit_test x i
axiom is_sint8_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint8 x) (fact1 : Cint.is_sint8 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ (7 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_sint16_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (15 : ℤ) ≤ i) (fact1 : Cint.is_sint16 x) : bit_test x i = (x < (0 : ℤ))
axiom to_sint16_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (15 : ℤ)) : bit_testb (Cint.to_sint16 x) i = bit_testb x i
axiom to_sint16_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (15 : ℤ)) : bit_test (Cint.to_sint16 x) i = bit_test x i
axiom is_sint16_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint16 x) (fact1 : Cint.is_sint16 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ (15 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_sint32_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (31 : ℤ) ≤ i) (fact1 : Cint.is_sint32 x) : bit_test x i = (x < (0 : ℤ))
axiom to_sint32_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (31 : ℤ)) : bit_testb (Cint.to_sint32 x) i = bit_testb x i
axiom to_sint32_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (31 : ℤ)) : bit_test (Cint.to_sint32 x) i = bit_test x i
axiom is_sint32_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint32 x) (fact1 : Cint.is_sint32 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ (31 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_sint64_extraction_sup (i : ℤ) (x : ℤ) (fact0 : (63 : ℤ) ≤ i) (fact1 : Cint.is_sint64 x) : bit_test x i = (x < (0 : ℤ))
axiom to_sint64_extraction_inf_bool (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (63 : ℤ)) : bit_testb (Cint.to_sint64 x) i = bit_testb x i
axiom to_sint64_extraction_inf (i : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < (63 : ℤ)) : bit_test (Cint.to_sint64 x) i = bit_test x i
axiom is_sint64_ext (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint64 x) (fact1 : Cint.is_sint64 y) (fact2 : ∀(i : ℤ), (0 : ℤ) ≤ i ∧ i ≤ (63 : ℤ) → bit_test x i = bit_test y i) : x = y
axiom to_uint_lor (n : ℤ) (x : ℤ) (y : ℤ) : Cint.to_uint n (lor x y) = lor (Cint.to_uint n x) (Cint.to_uint n y)
axiom to_uint8_lor (x : ℤ) (y : ℤ) : Cint.to_uint8 (lor x y) = lor (Cint.to_uint8 x) (Cint.to_uint (8 : ℤ) y)
axiom to_uint16_lor (x : ℤ) (y : ℤ) : Cint.to_uint16 (lor x y) = lor (Cint.to_uint16 x) (Cint.to_uint16 y)
axiom to_uint32_lor (x : ℤ) (y : ℤ) : Cint.to_uint32 (lor x y) = lor (Cint.to_uint32 x) (Cint.to_uint32 y)
axiom to_uint64_lor (x : ℤ) (y : ℤ) : Cint.to_uint64 (lor x y) = lor (Cint.to_uint64 x) (Cint.to_uint64 y)
axiom is_uint_lxor (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint n x) (fact1 : Cint.is_uint n y) : Cint.to_uint n (lxor x y) = lxor x y
axiom is_uint_lor (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint n x) (fact1 : Cint.is_uint n y) : Cint.to_uint n (lor x y) = lor x y
axiom is_uint_land (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint n x) (fact1 : Cint.is_uint n y) : Cint.to_uint n (land x y) = land x y
axiom is_uint_lsr (y : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_uint n x) : Cint.to_uint n (lsr x y) = lsr x y
axiom is_uint_lsl1_inf (y : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < n) : Cint.to_uint n (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_uint_lsl1_sup (n : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n ≤ y) : Cint.to_uint n (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_uint8_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint8 x) (fact1 : Cint.is_uint8 y) : Cint.to_uint8 (lxor x y) = lxor x y
axiom is_uint8_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint8 x) (fact1 : Cint.is_uint8 y) : Cint.to_uint8 (lor x y) = lor x y
axiom is_uint8_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint8 x) (fact1 : Cint.is_uint8 y) : Cint.to_uint8 (land x y) = land x y
axiom is_uint8_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_uint8 x) : Cint.to_uint8 (lsr x y) = lsr x y
axiom is_uint8_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (8 : ℤ)) : Cint.to_uint8 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_uint8_lsl1_sup (y : ℤ) (fact0 : (8 : ℤ) ≤ y) : Cint.to_uint8 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_uint16_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint16 x) (fact1 : Cint.is_uint16 y) : Cint.to_uint16 (lxor x y) = lxor x y
axiom is_uint16_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint16 x) (fact1 : Cint.is_uint16 y) : Cint.to_uint16 (lor x y) = lor x y
axiom is_uint16_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint16 x) (fact1 : Cint.is_uint16 y) : Cint.to_uint16 (land x y) = land x y
axiom is_uint16_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_uint16 x) : Cint.to_uint16 (lsr x y) = lsr x y
axiom is_uint16_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (16 : ℤ)) : Cint.to_uint16 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_uint16_lsl1_sup (y : ℤ) (fact0 : (16 : ℤ) ≤ y) : Cint.to_uint16 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_uint32_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint32 x) (fact1 : Cint.is_uint32 y) : Cint.to_uint32 (lxor x y) = lxor x y
axiom is_uint32_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint32 x) (fact1 : Cint.is_uint32 y) : Cint.to_uint32 (lor x y) = lor x y
axiom is_uint32_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint32 x) (fact1 : Cint.is_uint32 y) : Cint.to_uint32 (land x y) = land x y
axiom is_uint32_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_uint32 x) : Cint.to_uint32 (lsr x y) = lsr x y
axiom is_uint32_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (32 : ℤ)) : Cint.to_uint32 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_uint32_lsl1_sup (y : ℤ) (fact0 : (32 : ℤ) ≤ y) : Cint.to_uint32 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_uint64_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint64 x) (fact1 : Cint.is_uint64 y) : Cint.to_uint64 (lxor x y) = lxor x y
axiom is_uint64_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint64 x) (fact1 : Cint.is_uint64 y) : Cint.to_uint64 (lor x y) = lor x y
axiom is_uint64_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_uint64 x) (fact1 : Cint.is_uint64 y) : Cint.to_uint64 (land x y) = land x y
axiom is_uint64_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_uint64 x) : Cint.to_uint64 (lsr x y) = lsr x y
axiom is_uint64_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (64 : ℤ)) : Cint.to_uint64 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_uint64_lsl1_sup (y : ℤ) (fact0 : (64 : ℤ) ≤ y) : Cint.to_uint64 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_sint_lnot (n : ℤ) (x : ℤ) (fact0 : Cint.is_sint n x) : Cint.to_sint n (lnot x) = lnot x
axiom is_sint_lxor (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint n x) (fact1 : Cint.is_sint n y) : Cint.to_sint n (lxor x y) = lxor x y
axiom is_sint_lor (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint n x) (fact1 : Cint.is_sint n y) : Cint.to_sint n (lor x y) = lor x y
axiom is_sint_land (n : ℤ) (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint n x) (fact1 : Cint.is_sint n y) : Cint.to_sint n (land x y) = land x y
axiom is_sint_lsr (y : ℤ) (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_sint n x) : Cint.to_sint n (lsr x y) = lsr x y
axiom is_sint_lsl1_inf (y : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < n) : Cint.to_sint n (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_sint_lsl1_sup (n : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ n) (fact1 : n < y) : Cint.to_sint n (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_sint8_lnot (x : ℤ) (fact0 : Cint.is_sint8 x) : Cint.to_sint8 (lnot x) = lnot x
axiom is_sint8_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint8 x) (fact1 : Cint.is_sint8 y) : Cint.to_sint8 (lxor x y) = lxor x y
axiom is_sint8_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint8 x) (fact1 : Cint.is_sint8 y) : Cint.to_sint8 (lor x y) = lor x y
axiom is_sint8_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint8 x) (fact1 : Cint.is_sint8 y) : Cint.to_sint8 (land x y) = land x y
axiom is_sint8_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_sint8 x) : Cint.to_sint8 (lsr x y) = lsr x y
axiom is_sint8_lsl1 : lsl (1 : ℤ) (7 : ℤ) = (128 : ℤ)
axiom is_sint8_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (7 : ℤ)) : Cint.to_sint8 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_sint8_lsl1_sup (y : ℤ) (fact0 : (8 : ℤ) ≤ y) : Cint.to_sint8 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_sint16_lnot (x : ℤ) (fact0 : Cint.is_sint16 x) : Cint.to_sint16 (lnot x) = lnot x
axiom is_sint16_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint16 x) (fact1 : Cint.is_sint16 y) : Cint.to_sint16 (lxor x y) = lxor x y
axiom is_sint16_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint16 x) (fact1 : Cint.is_sint16 y) : Cint.to_sint16 (lor x y) = lor x y
axiom is_sint16_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint16 x) (fact1 : Cint.is_sint16 y) : Cint.to_sint16 (land x y) = land x y
axiom is_sint16_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_sint16 x) : Cint.to_sint16 (lsr x y) = lsr x y
axiom is_sint16_lsl1 : lsl (1 : ℤ) (15 : ℤ) = (32768 : ℤ)
axiom is_sint16_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (15 : ℤ)) : Cint.to_sint16 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_sint16_lsl1_sup (y : ℤ) (fact0 : (16 : ℤ) ≤ y) : Cint.to_sint16 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_sint32_lnot (x : ℤ) (fact0 : Cint.is_sint32 x) : Cint.to_sint32 (lnot x) = lnot x
axiom is_sint32_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint32 x) (fact1 : Cint.is_sint32 y) : Cint.to_sint32 (lxor x y) = lxor x y
axiom is_sint32_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint32 x) (fact1 : Cint.is_sint32 y) : Cint.to_sint32 (lor x y) = lor x y
axiom is_sint32_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint32 x) (fact1 : Cint.is_sint32 y) : Cint.to_sint32 (land x y) = land x y
axiom is_sint32_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_sint32 x) : Cint.to_sint32 (lsr x y) = lsr x y
axiom is_sint32_lsl1 : lsl (1 : ℤ) (31 : ℤ) = (2147483648 : ℤ)
axiom is_sint32_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (31 : ℤ)) : Cint.to_sint32 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_sint32_lsl1_sup (y : ℤ) (fact0 : (32 : ℤ) ≤ y) : Cint.to_sint32 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom is_sint64_lnot (x : ℤ) (fact0 : Cint.is_sint64 x) : Cint.to_sint64 (lnot x) = lnot x
axiom is_sint64_lxor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint64 x) (fact1 : Cint.is_sint64 y) : Cint.to_sint64 (lxor x y) = lxor x y
axiom is_sint64_lor (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint64 x) (fact1 : Cint.is_sint64 y) : Cint.to_sint64 (lor x y) = lor x y
axiom is_sint64_land (x : ℤ) (y : ℤ) (fact0 : Cint.is_sint64 x) (fact1 : Cint.is_sint64 y) : Cint.to_sint64 (land x y) = land x y
axiom is_sint64_lsr (y : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : Cint.is_sint64 x) : Cint.to_sint64 (lsr x y) = lsr x y
axiom is_sint64_lsl1 : lsl (1 : ℤ) (63 : ℤ) = (9223372036854775808 : ℤ)
axiom is_sint64_lsl1_inf (y : ℤ) (fact0 : (0 : ℤ) ≤ y) (fact1 : y < (63 : ℤ)) : Cint.to_sint64 (lsl (1 : ℤ) y) = lsl (1 : ℤ) y
axiom is_sint64_lsl1_sup (y : ℤ) (fact0 : (64 : ℤ) ≤ y) : Cint.to_sint64 (lsl (1 : ℤ) y) = (0 : ℤ)
axiom uint_land_range (x : ℤ) (y : ℤ) (fact0 : (0 : ℤ) ≤ x) : (0 : ℤ) ≤ land x y ∧ land x y ≤ x
axiom uint_lor_inf (x : ℤ) (y : ℤ) (fact0 : -(1 : ℤ) ≤ x) (fact1 : (0 : ℤ) ≤ y) : x ≤ lor x y
axiom sint_land_inf (x : ℤ) (y : ℤ) (fact0 : x ≤ (0 : ℤ)) (fact1 : y < (0 : ℤ)) : land x y ≤ x
axiom sint_lor_range (x : ℤ) (y : ℤ) (fact0 : x < (0 : ℤ)) : x ≤ lor x y ∧ lor x y < (0 : ℤ)
axiom is_uint_lor_distrib (n : ℤ) (x : ℤ) (y : ℤ) : Cint.is_uint n (lor x y) = (Cint.is_uint n x ∧ Cint.is_uint n y)
axiom lor_addition (x : ℤ) (y : ℤ) (fact0 : land x y = (0 : ℤ)) : x + y = lor x y
axiom lxor_addition (x : ℤ) (y : ℤ) (fact0 : land x y = (0 : ℤ)) : x + y = lxor x y
axiom to_uint_land_edge (n : ℤ) (x : ℤ) (fact0 : (0 : ℤ) ≤ n) : Cint.to_uint n x = land (lsl (1 : ℤ) n - (1 : ℤ)) x
end Cbits
