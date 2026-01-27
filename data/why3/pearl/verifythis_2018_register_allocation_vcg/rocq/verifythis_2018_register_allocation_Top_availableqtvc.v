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
Axiom replace : var -> var -> set -> set.
Axiom replace'spec'1 : forall  (v : var) (u : var) (s : set) (fact0 : ¬ v = u), (u ∈ to_fset (replace v u s)) = (u ∈ to_fset s ∨ v ∈ to_fset s).
Axiom replace'spec'0 : forall  (v : var) (u : var) (s : set) (fact0 : ¬ v = u), ¬ v ∈ to_fset (replace v u s).
Axiom replace'spec : forall  (v : var) (u : var) (w : var) (s : set) (fact0 : ¬ v = u) (fact1 : ¬ w = u) (fact2 : ¬ w = v), (w ∈ to_fset (replace v u s)) = (w ∈ to_fset s).
Axiom merge : var -> var -> t set -> t set.
Axiom merge'spec'2 : forall  (v : var) (u : var) (g : t set) (k : var) (fact0 : ¬ v = u) (fact1 : v ∈ dom (to_fmap g)) (fact2 : u ∈ dom (to_fmap g)), (k ∈ dom (to_fmap (merge v u g))) = (¬ k = v ∧ k ∈ dom (to_fmap g)).
Axiom merge'spec'1 : forall  (v : var) (u : var) (g : t set) (fact0 : ¬ v = u) (fact1 : v ∈ dom (to_fmap g)) (fact2 : u ∈ dom (to_fmap g)), to_fset (lookup_gmap_total (to_fmap (merge v u g)) u) = to_fset (replace v u (lookup_gmap_total (to_fmap g) u)) ∪ to_fset (replace v u (lookup_gmap_total (to_fmap g) v)).
Axiom merge'spec'0 : forall  (v : var) (u : var) (g : t set) (k : var) (fact0 : ¬ v = u) (fact1 : v ∈ dom (to_fmap g)) (fact2 : u ∈ dom (to_fmap g)) (fact3 : k ∈ dom (to_fmap (merge v u g))) (fact4 : ¬ k = u), to_fset (lookup_gmap_total (to_fmap (merge v u g)) k) = to_fset (replace v u (lookup_gmap_total (to_fmap g) k)).
Axiom merge'spec : forall  (v : var) (u : var) (g : t set) (fact0 : ¬ v = u) (fact1 : v ∈ dom (to_fmap g)) (fact2 : u ∈ dom (to_fmap g)), size_i (to_fmap (merge v u g)) = size_i (to_fmap g) - 1%Z.
Axiom all_from : set -> t var -> set.
Axiom all_from'spec : forall  (v : var) (s : set) (a : t var), (v ∈ to_fset (all_from s a)) = (∃(k : var), k ∈ to_fset s ∧ to_fmap a !! k = Some v).
Theorem available'vc (s : set) (a : t var) (r : set) : let o1 : set := all_from s a in (∀(v : var), (v ∈ to_fset o1) = (∃(k : var), k ∈ to_fset s ∧ to_fmap a !! k = Some v)) -> (∀(free_r : set), to_fset free_r = to_fset r ∖ to_fset o1 -> (∀(result : option var), (if decide (to_fset free_r = ∅) then result = None else let o2 : var := choose1 free_r in o2 ∈ to_fset free_r ∧ result = Some o2) -> (match result with | None => (∀(u : var), u ∈ to_fset r -> (∃(v : var), v ∈ to_fset s ∧ to_fmap a !! v = Some u)) | Some res => res ∈ to_fset r ∧ (∀(v : var), v ∈ to_fset s -> v ∈ dom (to_fmap a) -> ¬ res = lookup_gmap_total (to_fmap a) v) end))).
Admitted.
