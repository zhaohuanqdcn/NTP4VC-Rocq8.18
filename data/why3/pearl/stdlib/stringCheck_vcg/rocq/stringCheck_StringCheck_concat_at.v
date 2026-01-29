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
Theorem concat_at (s1 : string) (s2 : string) : let s : string := concat s1 s2 in ∀(i : Z), (0%Z ≤ i ∧ i < StringRealization.length s1 -> s_at s i = s_at s1 i) ∧ (StringRealization.length s1 ≤ i ∧ i < StringRealization.length s -> s_at s i = s_at s2 (i - StringRealization.length s1)).
Proof.
Admitted.
