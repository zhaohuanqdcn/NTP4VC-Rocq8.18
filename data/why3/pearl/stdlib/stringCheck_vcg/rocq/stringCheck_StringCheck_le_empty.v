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
Theorem le_empty (s : string) : le ""%string s.
Admitted.
