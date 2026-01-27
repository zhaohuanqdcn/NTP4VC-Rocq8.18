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
Axiom rem : var -> t set -> t set.
Axiom rem'spec'2 : forall  (v : var) (g : t set) (fact0 : v ∈ dom (to_fmap g)), ¬ v ∈ dom (to_fmap (rem v g)).
Axiom rem'spec'1 : forall  (v : var) (g : t set) (k : var) (fact0 : v ∈ dom (to_fmap g)), (k ∈ dom (to_fmap (rem v g))) = (¬ k = v ∧ k ∈ dom (to_fmap g)).
Axiom rem'spec'0 : forall  (v : var) (g : t set) (k : var) (fact0 : v ∈ dom (to_fmap g)) (fact1 : k ∈ dom (to_fmap (rem v g))), to_fset (lookup_gmap_total (to_fmap (rem v g)) k) = remove_set v (to_fset (lookup_gmap_total (to_fmap g) k)).
Axiom rem'spec : forall  (v : var) (g : t set) (fact0 : v ∈ dom (to_fmap g)), size_i (to_fmap (rem v g)) = size_i (to_fmap g) - 1%Z.
Theorem replace'vc (v : var) (u : var) (s : set) (result : set) (fact0 : ¬ v = u) (fact1 : if decide (v ∈ to_fset s) then ∃(o1 : set), (to_fset o1 = remove_set v (to_fset s) ∧ (if decide (v ∈ to_fset s) then Z.of_nat (size (to_fset o1)) = Z.of_nat (size (to_fset s)) - 1%Z else size (to_fset o1) = size (to_fset s))) ∧ to_fset result = insert_set u (to_fset o1) ∧ (if decide (u ∈ to_fset o1) then size (to_fset result) = size (to_fset o1) else Z.of_nat (size (to_fset result)) = Z.of_nat (size (to_fset o1)) + 1%Z) else result = s) : (u ∈ to_fset result) = (u ∈ to_fset s ∨ v ∈ to_fset s) ∧ ¬ v ∈ to_fset result ∧ (∀(w : var), ¬ w = u -> ¬ w = v -> (w ∈ to_fset result) = (w ∈ to_fset s)).
Admitted.
