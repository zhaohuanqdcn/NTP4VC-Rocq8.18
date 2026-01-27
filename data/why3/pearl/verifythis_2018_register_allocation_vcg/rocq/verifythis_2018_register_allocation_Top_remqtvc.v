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
Require Import Why3.ocaml.Exceptions.
Open Scope Z_scope.
Axiom var : Type.
Axiom var_inhabited : Inhabited var.
Global Existing Instance var_inhabited.
Axiom var_countable : Countable var.
Global Existing Instance var_countable.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset var.
Axiom mk : gset var -> set.
Axiom mk'spec : forall  (s : gset var), to_fset (mk s) = s.
Axiom choose1 : set -> var.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {χ : Type} `{Inhabited χ} `{Countable χ}, Inhabited (t χ).
Global Existing Instance t_inhabited.
Axiom to_fmap : forall {χ : Type} `{Inhabited χ} `{Countable χ}, t χ -> gmap var χ.
Theorem rem'vc (v : var) (g : t set) (remv : t set) (result : t set) (fact0 : v ∈ dom (to_fmap g)) (fact1 : to_fmap remv = delete_gmap v (to_fmap g)) (fact2 : ∀(k : var), (k ∈ dom (to_fmap result)) = (k ∈ dom (to_fmap remv))) (fact3 : ∀(k : var), k ∈ dom (to_fmap result) -> to_fset (lookup_gmap_total (to_fmap result) k) = remove_set v (to_fset (lookup_gmap_total (to_fmap remv) k))) (fact4 : size_i (to_fmap result) = size_i (to_fmap remv)) : ¬ v ∈ dom (to_fmap result) ∧ (∀(k : var), (k ∈ dom (to_fmap result)) = (¬ k = v ∧ k ∈ dom (to_fmap g))) ∧ (∀(k : var), k ∈ dom (to_fmap result) -> to_fset (lookup_gmap_total (to_fmap result) k) = remove_set v (to_fset (lookup_gmap_total (to_fmap g) k))) ∧ size_i (to_fmap result) = size_i (to_fmap g) - 1%Z.
Admitted.
