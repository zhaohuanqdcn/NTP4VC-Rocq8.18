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
Theorem bad_shift_table'vc (o1 : t (bv 63%N)) (fact0 : to_fmap o1 = (∅ : gmap ascii (bv 63%N))) : (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (String.length ""%string) -> get_str_i ""%string j ∈ dom (to_fmap o1)) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (String.length ""%string) -> get_str_i ""%string j ∈ dom (to_fmap o1)) -> (∀(c : ascii), c ∈ dom (to_fmap o1) -> 1%Z ≤ bv_signed (lookup_gmap_total (to_fmap o1) c) ∧ bv_signed (lookup_gmap_total (to_fmap o1) c) ≤ Z.of_nat (String.length ""%string) + 1%Z) ∧ ((∀(c : ascii), c ∈ dom (to_fmap o1) -> 1%Z ≤ bv_signed (lookup_gmap_total (to_fmap o1) c) ∧ bv_signed (lookup_gmap_total (to_fmap o1) c) ≤ Z.of_nat (String.length ""%string) + 1%Z) -> (∀(c : ascii), c ∈ dom (to_fmap o1) -> (∀(j : Z), 1%Z ≤ j ∧ j < bv_signed (lookup_gmap_total (to_fmap o1) c) -> ¬ get_str_i ""%string (Z.of_nat (String.length ""%string) - j) = c)))).
Admitted.
