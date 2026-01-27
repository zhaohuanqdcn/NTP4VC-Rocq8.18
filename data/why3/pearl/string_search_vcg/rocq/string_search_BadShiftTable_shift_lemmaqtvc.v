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
Require Import string_search_vcg.string_search.Spec.
Require Import string_search_vcg.string_search.Occurs.
Require Import Why3.ocaml.Exceptions.
Open Scope Z_scope.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {χ : Type} `{Inhabited χ} `{Countable χ}, Inhabited (t χ).
Global Existing Instance t_inhabited.
Axiom to_fmap : forall {χ : Type} `{Inhabited χ} `{Countable χ}, t χ -> gmap ascii χ.
Axiom bad_shift_table : Type.
Axiom bad_shift_table_inhabited : Inhabited bad_shift_table.
Global Existing Instance bad_shift_table_inhabited.
Axiom bad_shift_table_countable : Countable bad_shift_table.
Global Existing Instance bad_shift_table_countable.
Axiom pat : bad_shift_table -> string.
Axiom sht : bad_shift_table -> t (bv 63%N).
Axiom bad_shift_table'invariant : forall  (self : bad_shift_table), (∀(j : Z) (c : ascii), 0%Z ≤ j ∧ j < Z.of_nat (String.length (pat self)) -> c = get_str_i (pat self) j -> c ∈ dom (to_fmap (sht self))) ∧ (∀(c : ascii), c ∈ dom (to_fmap (sht self)) -> 1%Z ≤ bv_signed (lookup_gmap_total (to_fmap (sht self)) c) ∧ bv_signed (lookup_gmap_total (to_fmap (sht self)) c) ≤ Z.of_nat (String.length (pat self)) + 1%Z) ∧ (∀(c : ascii), c ∈ dom (to_fmap (sht self)) -> (∀(j : Z), 1%Z ≤ j ∧ j < bv_signed (lookup_gmap_total (to_fmap (sht self)) c) -> ¬ get_str_i (pat self) (Z.of_nat (String.length (pat self)) - j) = c)).
Definition bad_shift_table'eq (a : bad_shift_table) (b : bad_shift_table) := pat a = pat b ∧ sht a = sht b.
Axiom bad_shift_table'inj : forall  (a : bad_shift_table) (b : bad_shift_table) (fact0 : bad_shift_table'eq a b), a = b.
Theorem shift_lemma'vc (i : bv 63%N) (text : string) (bst : bad_shift_table) (j : Z) (fact0 : 0%Z ≤ bv_signed i) (fact1 : bv_signed i ≤ Z.of_nat (String.length text) - Z.of_nat (String.length (pat bst))) (fact2 : get_str_i text (bv_signed i + Z.of_nat (String.length (pat bst))) ∈ dom (to_fmap (sht bst))) (fact3 : bv_signed i < j) (fact4 : j < bv_signed i + bv_signed (lookup_gmap_total (to_fmap (sht bst)) (get_str_i text (bv_signed i + Z.of_nat (String.length (pat bst)))))) (fact5 : j ≤ Z.of_nat (String.length text) - Z.of_nat (String.length (pat bst))) : ¬ substring (Z.to_nat j) (String.length (pat bst)) text = pat bst.
Admitted.
