From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Axiom bit_testb : Z -> Z -> bool.
Axiom bit_test : Z -> Z -> Prop.
Axiom lnot : Z -> Z.
Axiom land : Z -> Z -> Z.
Axiom lxor : Z -> Z -> Z.
Axiom lor : Z -> Z -> Z.
Axiom lsl : Z -> Z -> Z.
Axiom lsr : Z -> Z -> Z.
Axiom lnot_bool : lnot 0%Z = - 1%Z ∧ lnot (- 1%Z) = 0%Z.
Axiom land_idemp : forall  (x : Z), land x x = x.
Axiom land_idemp_bis : forall  (x : Z) (y : Z), land x (land x y) = land x y.
Axiom land_0 : forall  (x : Z), land 0%Z x = 0%Z.
Axiom land_0bis : forall  (x : Z), land x 0%Z = 0%Z.
Axiom land_1 : forall  (x : Z), land (- 1%Z) x = x.
Axiom land_1bis : forall  (x : Z), land x (- 1%Z) = x.
Axiom land_bool : land 0%Z 0%Z = 0%Z ∧ land 0%Z 1%Z = 0%Z ∧ land 1%Z 0%Z = 0%Z ∧ land 1%Z 1%Z = 1%Z.
Axiom lor_idemp : forall  (x : Z), lor x x = x.
Axiom lor_idemp_bis : forall  (x : Z) (y : Z), lor x (lor x y) = lor x y.
Axiom lor_1 : forall  (x : Z), lor (- 1%Z) x = - 1%Z.
Axiom lor_1bis : forall  (x : Z), lor x (- 1%Z) = - 1%Z.
Axiom lor_0 : forall  (x : Z), lor 0%Z x = x.
Axiom lor_0bis : forall  (x : Z), lor x 0%Z = x.
Axiom lor_bool : lor 0%Z 0%Z = 0%Z ∧ lor 0%Z 1%Z = 1%Z ∧ lor 1%Z 0%Z = 1%Z ∧ lor 1%Z 1%Z = 1%Z.
Axiom lxor_nilpotent : forall  (x : Z), lxor x x = 0%Z.
Axiom lxor_nilpotent_bis : forall  (x : Z) (y : Z), lxor x (lxor x y) = y.
Axiom lxor_1 : forall  (x : Z), lxor (- 1%Z) x = lnot x.
Axiom lxor_1bis : forall  (x : Z), lxor x (- 1%Z) = lnot x.
Axiom lxor_0 : forall  (x : Z), lxor 0%Z x = x.
Axiom lxor_0bis : forall  (x : Z), lxor x 0%Z = x.
Axiom lxor_bool : lxor 0%Z 0%Z = 0%Z ∧ lxor 0%Z 1%Z = 1%Z ∧ lxor 1%Z 0%Z = 1%Z ∧ lxor 1%Z 1%Z = 0%Z.
Axiom lsl_0 : forall  (x : Z), lsl x 0%Z = x.
Axiom lsl_1 : forall  (x : Z), lsl x 1%Z = 2%Z * x.
Axiom lsl_add : forall  (p : Z) (q : Z) (x : Z) (fact0 : 0%Z ≤ p) (fact1 : 0%Z ≤ q), lsl (lsl x p) q = lsl x (p + q).
Axiom lsr_0 : forall  (x : Z), lsr x 0%Z = x.
Axiom lsr_1 : forall  (x : Z) (fact0 : 0%Z ≤ x), lsr x 1%Z = Z.rem x 2%Z.
Axiom lsr_add : forall  (p : Z) (q : Z) (x : Z) (fact0 : 0%Z ≤ p) (fact1 : 0%Z ≤ q), lsr (lsr x p) q = lsr x (p + q).
Axiom lsl_lsr_add : forall  (q : Z) (p : Z) (x : Z) (fact0 : 0%Z ≤ q) (fact1 : q ≤ p), lsr (lsl x p) q = lsl x (p - q).
Axiom bit_test_def : forall  (x : Z) (k : Z), (bit_testb x k = true) = bit_test x k.
Axiom bit_test_extraction : forall  (k : Z) (x : Z) (fact0 : 0%Z ≤ k), (¬ land x (lsl 1%Z k) = 0%Z) = bit_test x k.
Axiom bit_test_extraction_eq : forall  (k : Z) (x : Z) (fact0 : 0%Z ≤ k), (land x (lsl 1%Z k) = lsl 1%Z k) = bit_test x k.
Axiom lsl_1_0 : lsl 1%Z 0%Z = 1%Z.
Axiom bit_test_extraction_bis : forall  (x : Z) (fact0 : ¬ land 1%Z x = 0%Z), bit_test x 0%Z.
Axiom bit_test_extraction_bis_eq : forall  (x : Z) (fact0 : bit_test x 0%Z), land 1%Z x = 1%Z.
Axiom lnot_extraction_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i), bit_testb (lnot x) i = negb (bit_testb x i).
Axiom lnot_extraction : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i), bit_test (lnot x) i = (¬ bit_test x i).
Axiom land_extraction_bool : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_testb (land x y) i = bit_testb x i && bit_testb y i.
Axiom land_extraction : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_test (land x y) i = (bit_test x i ∧ bit_test y i).
Axiom lor_extraction_bool : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_testb (lor x y) i = bit_testb x i || bit_testb y i.
Axiom lor_extraction : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_test (lor x y) i = (bit_test x i ∨ bit_test y i).
Axiom lxor_extraction_bool : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_testb (lxor x y) i = xorb (bit_testb x i) (bit_testb y i).
Axiom lxor_extraction : forall  (i : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ i), bit_test (lxor x y) i = (bit_test x i = (¬ bit_test y i)).
Axiom lsl_1_two_power : forall  (n : Z) (fact0 : 0%Z ≤ n), lsl 1%Z n = two_power_abs n.
Axiom land_1_lsl_1 : forall  (n : Z) (a : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : a < lsl 1%Z n), 2%Z * a + land 1%Z x < lsl 1%Z (1%Z + n).
Axiom lsl_extraction_sup_bool : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m) (fact2 : n ≤ m), bit_testb (lsl x n) m = bit_testb x (m - n).
Axiom lsl_extraction_sup : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m) (fact2 : n ≤ m), bit_test (lsl x n) m = bit_test x (m - n).
Axiom lsl_extraction_inf_bool : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m) (fact2 : m < n), bit_testb (lsl x n) m = false.
Axiom lsl_extraction_inf : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m) (fact2 : m < n), ¬ bit_test (lsl x n) m.
Axiom lsr_extraction_bool : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), bit_testb (lsr x n) m = bit_testb x (m + n).
Axiom lsr_extractionl : forall  (n : Z) (m : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), bit_test (lsr x n) m = bit_test x (m + n).
Axiom lsl1_extraction_bool : forall  (i : Z) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : 0%Z ≤ j), bit_testb (lsl 1%Z i) j = (if decide (i = j) then true else false).
Axiom lsl1_extraction : forall  (i : Z) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : 0%Z ≤ j), bit_test (lsl 1%Z i) j = (i = j).
Axiom pos_extraction_sup : forall  (x : Z) (i : Z) (j : Z) (fact0 : 0%Z ≤ x) (fact1 : 0%Z ≤ i) (fact2 : x < lsl 1%Z i) (fact3 : i ≤ j), ¬ bit_test x j.
Axiom pos_extraction_sup_inv : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : ∀(j : Z), i ≤ j -> ¬ bit_test x j), 0%Z ≤ x ∧ x < lsl 1%Z i.
Axiom to_uint_extraction_sup : forall  (n : Z) (i : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ i) (fact2 : is_uint n x), ¬ bit_test x i.
Axiom to_uint_extraction_inf_bool : forall  (i : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n), bit_testb (to_uint n x) i = bit_testb x i.
Axiom to_uint_extraction_inf : forall  (i : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n), bit_test (to_uint n x) i = bit_test x i.
Axiom is_uint_ext : forall  (n : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : is_uint n x) (fact2 : is_uint n y) (fact3 : ∀(i : Z), 0%Z ≤ i ∧ i < n -> bit_test x i = bit_test y i), x = y.
Axiom to_uint8_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 8%Z ≤ i) (fact1 : is_uint8 x), ¬ bit_test x i.
Axiom to_uint8_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 8%Z), bit_testb (to_uint8 x) i = bit_testb x i.
Axiom to_uint8_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 8%Z), bit_test (to_uint8 x) i = bit_test x i.
Axiom is_uint8_ext : forall  (x : Z) (y : Z) (fact0 : is_uint8 x) (fact1 : is_uint8 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < 8%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_uint16_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 16%Z ≤ i) (fact1 : is_uint16 x), ¬ bit_test x i.
Axiom to_uint16_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 16%Z), bit_testb (to_uint16 x) i = bit_testb x i.
Axiom to_uint16_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 16%Z), bit_test (to_uint16 x) i = bit_test x i.
Axiom is_uint16_ext : forall  (x : Z) (y : Z) (fact0 : is_uint16 x) (fact1 : is_uint16 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < 16%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_uint32_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 32%Z ≤ i) (fact1 : is_uint32 x), ¬ bit_test x i.
Axiom to_uint32_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 32%Z), bit_testb (to_uint32 x) i = bit_testb x i.
Axiom to_uint32_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 32%Z), bit_test (to_uint32 x) i = bit_test x i.
Axiom is_uint32_ext : forall  (x : Z) (y : Z) (fact0 : is_uint32 x) (fact1 : is_uint32 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < 32%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_uint64_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 64%Z ≤ i) (fact1 : is_uint64 x), ¬ bit_test x i.
Axiom to_uint64_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 64%Z), bit_testb (to_uint64 x) i = bit_testb x i.
Axiom to_uint64_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 64%Z), bit_test (to_uint64 x) i = bit_test x i.
Axiom is_uint64_ext : forall  (x : Z) (y : Z) (fact0 : is_uint64 x) (fact1 : is_uint64 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < 64%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_sint_extraction_sup : forall  (n : Z) (i : Z) (x : Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ i) (fact2 : is_sint n x), bit_test x i = (x < 0%Z).
Axiom to_sint_extraction_inf_bool : forall  (i : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n), bit_testb (to_sint n x) i = bit_testb x i.
Axiom to_sint_extraction_inf : forall  (i : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n), bit_test (to_sint n x) i = bit_test x i.
Axiom is_sint_ext : forall  (n : Z) (x : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : is_sint n x) (fact2 : is_sint n y) (fact3 : ∀(i : Z), 0%Z ≤ i ∧ i ≤ n -> bit_test x i = bit_test y i), x = y.
Axiom to_sint8_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 7%Z ≤ i) (fact1 : is_sint8 x), bit_test x i = (x < 0%Z).
Axiom to_sint8_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 7%Z), bit_testb (to_sint8 x) i = bit_testb x i.
Axiom to_sint8_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 7%Z), bit_test (to_sint8 x) i = bit_test x i.
Axiom is_sint8_ext : forall  (x : Z) (y : Z) (fact0 : is_sint8 x) (fact1 : is_sint8 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i ≤ 7%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_sint16_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 15%Z ≤ i) (fact1 : is_sint16 x), bit_test x i = (x < 0%Z).
Axiom to_sint16_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 15%Z), bit_testb (to_sint16 x) i = bit_testb x i.
Axiom to_sint16_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 15%Z), bit_test (to_sint16 x) i = bit_test x i.
Axiom is_sint16_ext : forall  (x : Z) (y : Z) (fact0 : is_sint16 x) (fact1 : is_sint16 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i ≤ 15%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_sint32_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 31%Z ≤ i) (fact1 : is_sint32 x), bit_test x i = (x < 0%Z).
Axiom to_sint32_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 31%Z), bit_testb (to_sint32 x) i = bit_testb x i.
Axiom to_sint32_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 31%Z), bit_test (to_sint32 x) i = bit_test x i.
Axiom is_sint32_ext : forall  (x : Z) (y : Z) (fact0 : is_sint32 x) (fact1 : is_sint32 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i ≤ 31%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_sint64_extraction_sup : forall  (i : Z) (x : Z) (fact0 : 63%Z ≤ i) (fact1 : is_sint64 x), bit_test x i = (x < 0%Z).
Axiom to_sint64_extraction_inf_bool : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 63%Z), bit_testb (to_sint64 x) i = bit_testb x i.
Axiom to_sint64_extraction_inf : forall  (i : Z) (x : Z) (fact0 : 0%Z ≤ i) (fact1 : i < 63%Z), bit_test (to_sint64 x) i = bit_test x i.
Axiom is_sint64_ext : forall  (x : Z) (y : Z) (fact0 : is_sint64 x) (fact1 : is_sint64 y) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i ≤ 63%Z -> bit_test x i = bit_test y i), x = y.
Axiom to_uint_lor : forall  (n : Z) (x : Z) (y : Z), to_uint n (lor x y) = lor (to_uint n x) (to_uint n y).
Axiom to_uint8_lor : forall  (x : Z) (y : Z), to_uint8 (lor x y) = lor (to_uint8 x) (to_uint 8%Z y).
Axiom to_uint16_lor : forall  (x : Z) (y : Z), to_uint16 (lor x y) = lor (to_uint16 x) (to_uint16 y).
Axiom to_uint32_lor : forall  (x : Z) (y : Z), to_uint32 (lor x y) = lor (to_uint32 x) (to_uint32 y).
Axiom to_uint64_lor : forall  (x : Z) (y : Z), to_uint64 (lor x y) = lor (to_uint64 x) (to_uint64 y).
Axiom is_uint_lxor : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_uint n x) (fact1 : is_uint n y), to_uint n (lxor x y) = lxor x y.
Axiom is_uint_lor : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_uint n x) (fact1 : is_uint n y), to_uint n (lor x y) = lor x y.
Axiom is_uint_land : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_uint n x) (fact1 : is_uint n y), to_uint n (land x y) = land x y.
Axiom is_uint_lsr : forall  (y : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_uint n x), to_uint n (lsr x y) = lsr x y.
Axiom is_uint_lsl1_inf : forall  (y : Z) (n : Z) (fact0 : 0%Z ≤ y) (fact1 : y < n), to_uint n (lsl 1%Z y) = lsl 1%Z y.
Axiom is_uint_lsl1_sup : forall  (n : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : n ≤ y), to_uint n (lsl 1%Z y) = 0%Z.
Axiom is_uint8_lxor : forall  (x : Z) (y : Z) (fact0 : is_uint8 x) (fact1 : is_uint8 y), to_uint8 (lxor x y) = lxor x y.
Axiom is_uint8_lor : forall  (x : Z) (y : Z) (fact0 : is_uint8 x) (fact1 : is_uint8 y), to_uint8 (lor x y) = lor x y.
Axiom is_uint8_land : forall  (x : Z) (y : Z) (fact0 : is_uint8 x) (fact1 : is_uint8 y), to_uint8 (land x y) = land x y.
Axiom is_uint8_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_uint8 x), to_uint8 (lsr x y) = lsr x y.
Axiom is_uint8_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 8%Z), to_uint8 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_uint8_lsl1_sup : forall  (y : Z) (fact0 : 8%Z ≤ y), to_uint8 (lsl 1%Z y) = 0%Z.
Axiom is_uint16_lxor : forall  (x : Z) (y : Z) (fact0 : is_uint16 x) (fact1 : is_uint16 y), to_uint16 (lxor x y) = lxor x y.
Axiom is_uint16_lor : forall  (x : Z) (y : Z) (fact0 : is_uint16 x) (fact1 : is_uint16 y), to_uint16 (lor x y) = lor x y.
Axiom is_uint16_land : forall  (x : Z) (y : Z) (fact0 : is_uint16 x) (fact1 : is_uint16 y), to_uint16 (land x y) = land x y.
Axiom is_uint16_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_uint16 x), to_uint16 (lsr x y) = lsr x y.
Axiom is_uint16_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 16%Z), to_uint16 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_uint16_lsl1_sup : forall  (y : Z) (fact0 : 16%Z ≤ y), to_uint16 (lsl 1%Z y) = 0%Z.
Axiom is_uint32_lxor : forall  (x : Z) (y : Z) (fact0 : is_uint32 x) (fact1 : is_uint32 y), to_uint32 (lxor x y) = lxor x y.
Axiom is_uint32_lor : forall  (x : Z) (y : Z) (fact0 : is_uint32 x) (fact1 : is_uint32 y), to_uint32 (lor x y) = lor x y.
Axiom is_uint32_land : forall  (x : Z) (y : Z) (fact0 : is_uint32 x) (fact1 : is_uint32 y), to_uint32 (land x y) = land x y.
Axiom is_uint32_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_uint32 x), to_uint32 (lsr x y) = lsr x y.
Axiom is_uint32_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 32%Z), to_uint32 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_uint32_lsl1_sup : forall  (y : Z) (fact0 : 32%Z ≤ y), to_uint32 (lsl 1%Z y) = 0%Z.
Axiom is_uint64_lxor : forall  (x : Z) (y : Z) (fact0 : is_uint64 x) (fact1 : is_uint64 y), to_uint64 (lxor x y) = lxor x y.
Axiom is_uint64_lor : forall  (x : Z) (y : Z) (fact0 : is_uint64 x) (fact1 : is_uint64 y), to_uint64 (lor x y) = lor x y.
Axiom is_uint64_land : forall  (x : Z) (y : Z) (fact0 : is_uint64 x) (fact1 : is_uint64 y), to_uint64 (land x y) = land x y.
Axiom is_uint64_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_uint64 x), to_uint64 (lsr x y) = lsr x y.
Axiom is_uint64_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 64%Z), to_uint64 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_uint64_lsl1_sup : forall  (y : Z) (fact0 : 64%Z ≤ y), to_uint64 (lsl 1%Z y) = 0%Z.
Axiom is_sint_lnot : forall  (n : Z) (x : Z) (fact0 : is_sint n x), to_sint n (lnot x) = lnot x.
Axiom is_sint_lxor : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_sint n x) (fact1 : is_sint n y), to_sint n (lxor x y) = lxor x y.
Axiom is_sint_lor : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_sint n x) (fact1 : is_sint n y), to_sint n (lor x y) = lor x y.
Axiom is_sint_land : forall  (n : Z) (x : Z) (y : Z) (fact0 : is_sint n x) (fact1 : is_sint n y), to_sint n (land x y) = land x y.
Axiom is_sint_lsr : forall  (y : Z) (n : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_sint n x), to_sint n (lsr x y) = lsr x y.
Axiom is_sint_lsl1_inf : forall  (y : Z) (n : Z) (fact0 : 0%Z ≤ y) (fact1 : y < n), to_sint n (lsl 1%Z y) = lsl 1%Z y.
Axiom is_sint_lsl1_sup : forall  (n : Z) (y : Z) (fact0 : 0%Z ≤ n) (fact1 : n < y), to_sint n (lsl 1%Z y) = 0%Z.
Axiom is_sint8_lnot : forall  (x : Z) (fact0 : is_sint8 x), to_sint8 (lnot x) = lnot x.
Axiom is_sint8_lxor : forall  (x : Z) (y : Z) (fact0 : is_sint8 x) (fact1 : is_sint8 y), to_sint8 (lxor x y) = lxor x y.
Axiom is_sint8_lor : forall  (x : Z) (y : Z) (fact0 : is_sint8 x) (fact1 : is_sint8 y), to_sint8 (lor x y) = lor x y.
Axiom is_sint8_land : forall  (x : Z) (y : Z) (fact0 : is_sint8 x) (fact1 : is_sint8 y), to_sint8 (land x y) = land x y.
Axiom is_sint8_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_sint8 x), to_sint8 (lsr x y) = lsr x y.
Axiom is_sint8_lsl1 : lsl 1%Z 7%Z = 128%Z.
Axiom is_sint8_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 7%Z), to_sint8 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_sint8_lsl1_sup : forall  (y : Z) (fact0 : 8%Z ≤ y), to_sint8 (lsl 1%Z y) = 0%Z.
Axiom is_sint16_lnot : forall  (x : Z) (fact0 : is_sint16 x), to_sint16 (lnot x) = lnot x.
Axiom is_sint16_lxor : forall  (x : Z) (y : Z) (fact0 : is_sint16 x) (fact1 : is_sint16 y), to_sint16 (lxor x y) = lxor x y.
Axiom is_sint16_lor : forall  (x : Z) (y : Z) (fact0 : is_sint16 x) (fact1 : is_sint16 y), to_sint16 (lor x y) = lor x y.
Axiom is_sint16_land : forall  (x : Z) (y : Z) (fact0 : is_sint16 x) (fact1 : is_sint16 y), to_sint16 (land x y) = land x y.
Axiom is_sint16_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_sint16 x), to_sint16 (lsr x y) = lsr x y.
Axiom is_sint16_lsl1 : lsl 1%Z 15%Z = 32768%Z.
Axiom is_sint16_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 15%Z), to_sint16 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_sint16_lsl1_sup : forall  (y : Z) (fact0 : 16%Z ≤ y), to_sint16 (lsl 1%Z y) = 0%Z.
Axiom is_sint32_lnot : forall  (x : Z) (fact0 : is_sint32 x), to_sint32 (lnot x) = lnot x.
Axiom is_sint32_lxor : forall  (x : Z) (y : Z) (fact0 : is_sint32 x) (fact1 : is_sint32 y), to_sint32 (lxor x y) = lxor x y.
Axiom is_sint32_lor : forall  (x : Z) (y : Z) (fact0 : is_sint32 x) (fact1 : is_sint32 y), to_sint32 (lor x y) = lor x y.
Axiom is_sint32_land : forall  (x : Z) (y : Z) (fact0 : is_sint32 x) (fact1 : is_sint32 y), to_sint32 (land x y) = land x y.
Axiom is_sint32_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_sint32 x), to_sint32 (lsr x y) = lsr x y.
Axiom is_sint32_lsl1 : lsl 1%Z 31%Z = 2147483648%Z.
Axiom is_sint32_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 31%Z), to_sint32 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_sint32_lsl1_sup : forall  (y : Z) (fact0 : 32%Z ≤ y), to_sint32 (lsl 1%Z y) = 0%Z.
Axiom is_sint64_lnot : forall  (x : Z) (fact0 : is_sint64 x), to_sint64 (lnot x) = lnot x.
Axiom is_sint64_lxor : forall  (x : Z) (y : Z) (fact0 : is_sint64 x) (fact1 : is_sint64 y), to_sint64 (lxor x y) = lxor x y.
Axiom is_sint64_lor : forall  (x : Z) (y : Z) (fact0 : is_sint64 x) (fact1 : is_sint64 y), to_sint64 (lor x y) = lor x y.
Axiom is_sint64_land : forall  (x : Z) (y : Z) (fact0 : is_sint64 x) (fact1 : is_sint64 y), to_sint64 (land x y) = land x y.
Axiom is_sint64_lsr : forall  (y : Z) (x : Z) (fact0 : 0%Z ≤ y) (fact1 : is_sint64 x), to_sint64 (lsr x y) = lsr x y.
Axiom is_sint64_lsl1 : lsl 1%Z 63%Z = 9223372036854775808%Z.
Axiom is_sint64_lsl1_inf : forall  (y : Z) (fact0 : 0%Z ≤ y) (fact1 : y < 63%Z), to_sint64 (lsl 1%Z y) = lsl 1%Z y.
Axiom is_sint64_lsl1_sup : forall  (y : Z) (fact0 : 64%Z ≤ y), to_sint64 (lsl 1%Z y) = 0%Z.
Axiom uint_land_range : forall  (x : Z) (y : Z) (fact0 : 0%Z ≤ x), 0%Z ≤ land x y ∧ land x y ≤ x.
Axiom uint_lor_inf : forall  (x : Z) (y : Z) (fact0 : - 1%Z ≤ x) (fact1 : 0%Z ≤ y), x ≤ lor x y.
Axiom sint_land_inf : forall  (x : Z) (y : Z) (fact0 : x ≤ 0%Z) (fact1 : y < 0%Z), land x y ≤ x.
Axiom sint_lor_range : forall  (x : Z) (y : Z) (fact0 : x < 0%Z), x ≤ lor x y ∧ lor x y < 0%Z.
Axiom is_uint_lor_distrib : forall  (n : Z) (x : Z) (y : Z), is_uint n (lor x y) = (is_uint n x ∧ is_uint n y).
Axiom lor_addition : forall  (x : Z) (y : Z) (fact0 : land x y = 0%Z), x + y = lor x y.
Axiom lxor_addition : forall  (x : Z) (y : Z) (fact0 : land x y = 0%Z), x + y = lxor x y.
Axiom to_uint_land_edge : forall  (n : Z) (x : Z) (fact0 : 0%Z ≤ n), to_uint n x = land (lsl 1%Z n - 1%Z) x.
