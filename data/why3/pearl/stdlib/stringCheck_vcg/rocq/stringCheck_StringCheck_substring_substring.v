From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.string.StringRealization.
Open Scope Z_scope.
Axiom concat_assoc : forall  (s1 : string) (s2 : string) (s3 : string), concat (concat s1 s2) s3 = concat s1 (concat s2 s3).
Axiom concat_empty : forall  (s : string), concat s ""%string = concat ""%string s ∧ concat ""%string s = s.
Axiom length_empty : StringRealization.length ""%string = 0%Z.
Axiom length_concat : forall  (s1 : string) (s2 : string), StringRealization.length (concat s1 s2) = StringRealization.length s1 + StringRealization.length s2.
Axiom lt_empty : forall  (s : string) (fact0 : ¬ s = ""%string), lt ""%string s.
Axiom lt_not_com : forall  (s1 : string) (s2 : string) (fact0 : lt s1 s2), ¬ lt s2 s1.
Axiom lt_ref : forall  (s1 : string), ¬ lt s1 s1.
Axiom lt_trans : forall  (s1 : string) (s2 : string) (s3 : string) (fact0 : lt s1 s2) (fact1 : lt s2 s3), lt s1 s3.
Axiom le_empty : forall  (s : string), le ""%string s.
Axiom le_ref : forall  (s1 : string), le s1 s1.
Axiom lt_le : forall  (s1 : string) (s2 : string) (fact0 : lt s1 s2), le s1 s2.
Axiom lt_le_eq : forall  (s1 : string) (s2 : string) (fact0 : le s1 s2), lt s1 s2 ∨ s1 = s2.
Axiom le_trans : forall  (s1 : string) (s2 : string) (s3 : string) (fact0 : le s1 s2) (fact1 : le s2 s3), le s1 s3.
Axiom at_out_of_range : forall  (i : Z) (s : string) (fact0 : i < 0%Z ∨ StringRealization.length s ≤ i), s_at s i = ""%string.
Axiom at_empty : forall  (i : Z), s_at ""%string i = ""%string.
Axiom at_length : forall  (s : string) (i : Z), if decide (0%Z ≤ i ∧ i < StringRealization.length s) then StringRealization.length (s_at s i) = 1%Z else StringRealization.length (s_at s i) = 0%Z.
Axiom concat_at : forall  (s1 : string) (s2 : string), ∀(i : Z), (0%Z ≤ i ∧ i < StringRealization.length s1 -> s_at (concat s1 s2) i = s_at s1 i) ∧ (StringRealization.length s1 ≤ i ∧ i < StringRealization.length (concat s1 s2) -> s_at (concat s1 s2) i = s_at s2 (i - StringRealization.length s1)).
Axiom substring_out_of_range : forall  (i : Z) (s : string) (x : Z) (fact0 : i < 0%Z ∨ StringRealization.length s ≤ i), StringRealization.substring s i x = ""%string.
Axiom substring_of_length_zero_or_less : forall  (x : Z) (s : string) (i : Z) (fact0 : x ≤ 0%Z), StringRealization.substring s i x = ""%string.
Axiom substring_of_empty : forall  (i : Z) (x : Z), StringRealization.substring ""%string i x = ""%string.
Axiom substring_smaller : forall  (s : string) (i : Z) (x : Z), StringRealization.length (StringRealization.substring s i x) ≤ StringRealization.length s.
Axiom substring_smaller_x : forall  (x : Z) (s : string) (i : Z) (fact0 : 0%Z ≤ x), StringRealization.length (StringRealization.substring s i x) ≤ x.
Axiom substring_length : forall  (x : Z) (i : Z) (s : string) (fact0 : 0%Z ≤ x) (fact1 : 0%Z ≤ i) (fact2 : i < StringRealization.length s), if decide (StringRealization.length s < i + x) then StringRealization.length (StringRealization.substring s i x) = StringRealization.length s - i else StringRealization.length (StringRealization.substring s i x) = x.
Axiom substring_at : forall  (s : string) (i : Z), s_at s i = StringRealization.substring s i 1%Z.
Theorem substring_substring (ofs : Z) (s : string) (len : Z) (ofs' : Z) (len' : Z) (fact0 : 0%Z ≤ ofs) (fact1 : ofs ≤ StringRealization.length s) (fact2 : 0%Z ≤ len) (fact3 : ofs + len ≤ StringRealization.length s) (fact4 : 0%Z ≤ ofs') (fact5 : ofs' ≤ len) (fact6 : 0%Z ≤ len') (fact7 : ofs' + len' ≤ len) : StringRealization.substring (StringRealization.substring s ofs len) ofs' len' = StringRealization.substring s (ofs + ofs') len'.
Admitted.
