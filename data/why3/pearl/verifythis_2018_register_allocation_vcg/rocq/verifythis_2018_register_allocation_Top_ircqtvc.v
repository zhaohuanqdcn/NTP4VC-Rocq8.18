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
Require Import Why3.why3.Ref.Ref.
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
Definition no_collision (g : t set) (a : t var) := ∀(u : var) (v : var), u ∈ dom (to_fmap g) -> v ∈ dom (to_fmap g) -> u ∈ dom (to_fmap a) -> v ∈ dom (to_fmap a) -> v ∈ to_fset (lookup_gmap_total (to_fmap g) u) -> ¬ lookup_gmap_total (to_fmap a) u = lookup_gmap_total (to_fmap a) v.
Definition irrefl (g : t set) := ∀(u : var), u ∈ dom (to_fmap g) -> ¬ u ∈ to_fset (lookup_gmap_total (to_fmap g) u).
Definition sym (g : t set) := ∀(u : var) (v : var), u ∈ dom (to_fmap g) -> v ∈ dom (to_fmap g) -> v ∈ to_fset (lookup_gmap_total (to_fmap g) u) -> u ∈ to_fset (lookup_gmap_total (to_fmap g) v).
Theorem irc'vc (r : set) (g : t set) (o1 : option var) (fact0 : ∀(v : var), v ∈ to_fset r -> v ∈ dom (to_fmap g)) (fact1 : irrefl g) (fact2 : sym g) (fact3 : match o1 with | None => (∀(v : var), v ∈ dom (to_fmap g) -> v ∈ to_fset r) | Some v => v ∈ dom (to_fmap g) ∧ ¬ v ∈ to_fset r end) : match o1 with | None => (∀(result : t var), (∀(u : var), (u ∈ dom (to_fmap result)) = (u ∈ to_fset r)) ∧ (∀(u : var), u ∈ dom (to_fmap result) -> lookup_gmap_total (to_fmap result) u = u) -> (∀(u : var), (u ∈ dom (to_fmap result)) = (u ∈ dom (to_fmap g))) ∧ (∀(u : var) (v : var), to_fmap result !! u = Some v -> v ∈ dom (to_fmap g)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap result !! k = Some k) ∧ no_collision g result) | Some v => (∀(o2 : option var), (match o2 with | None => True | Some u => ¬ u = v ∧ u ∈ dom (to_fmap g) ∧ ¬ v ∈ to_fset (lookup_gmap_total (to_fmap g) u) end) -> (match o2 with | None => v ∈ dom (to_fmap g) ∧ (let s : set := lookup_gmap_total (to_fmap g) v in s = lookup_gmap_total (to_fmap g) v -> v ∈ dom (to_fmap g) ∧ (let o3 : t set := rem v g in ¬ v ∈ dom (to_fmap o3) ∧ (∀(k : var), (k ∈ dom (to_fmap o3)) = (¬ k = v ∧ k ∈ dom (to_fmap g))) ∧ (∀(k : var), k ∈ dom (to_fmap o3) -> to_fset (lookup_gmap_total (to_fmap o3) k) = remove_set v (to_fset (lookup_gmap_total (to_fmap g) k))) ∧ size_i (to_fmap o3) = size_i (to_fmap g) - 1%Z -> ((0%Z ≤ size_i (to_fmap g) ∧ size_i (to_fmap o3) < size_i (to_fmap g)) ∧ (∀(v1 : var), v1 ∈ to_fset r -> v1 ∈ dom (to_fmap o3)) ∧ irrefl o3 ∧ sym o3) ∧ (∀(a : t var), (∀(u : var), (u ∈ dom (to_fmap a)) = (u ∈ dom (to_fmap o3))) ∧ (∀(u : var) (v1 : var), to_fmap a !! u = Some v1 -> v1 ∈ dom (to_fmap o3)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap a !! k = Some k) ∧ no_collision o3 a -> (∀(o4 : option var), (match o4 with | None => (∀(u : var), u ∈ to_fset r -> (∃(v1 : var), v1 ∈ to_fset s ∧ to_fmap a !! v1 = Some u)) | Some res => res ∈ to_fset r ∧ (∀(v1 : var), v1 ∈ to_fset s -> v1 ∈ dom (to_fmap a) -> ¬ res = lookup_gmap_total (to_fmap a) v1) end) -> (match o4 with | Some av => (∀(result : t var), to_fmap result = <[v := av]>(to_fmap a) -> (∀(u : var), (u ∈ dom (to_fmap result)) = (u ∈ dom (to_fmap g))) ∧ (∀(u : var) (v1 : var), to_fmap result !! u = Some v1 -> v1 ∈ dom (to_fmap g)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap result !! k = Some k) ∧ no_collision g result) | None => (∀(result : t var), to_fmap result = <[v := v]>(to_fmap a) -> (∀(u : var), (u ∈ dom (to_fmap result)) = (u ∈ dom (to_fmap g))) ∧ (∀(u : var) (v1 : var), to_fmap result !! u = Some v1 -> v1 ∈ dom (to_fmap g)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap result !! k = Some k) ∧ no_collision g result) end))))) | Some u => (¬ v = u ∧ v ∈ dom (to_fmap g) ∧ u ∈ dom (to_fmap g)) ∧ (let o3 : t set := merge v u g in (∀(k : var), (k ∈ dom (to_fmap o3)) = (¬ k = v ∧ k ∈ dom (to_fmap g))) ∧ to_fset (lookup_gmap_total (to_fmap o3) u) = to_fset (replace v u (lookup_gmap_total (to_fmap g) u)) ∪ to_fset (replace v u (lookup_gmap_total (to_fmap g) v)) ∧ (∀(k : var), k ∈ dom (to_fmap o3) -> ¬ k = u -> to_fset (lookup_gmap_total (to_fmap o3) k) = to_fset (replace v u (lookup_gmap_total (to_fmap g) k))) ∧ size_i (to_fmap o3) = size_i (to_fmap g) - 1%Z -> ((0%Z ≤ size_i (to_fmap g) ∧ size_i (to_fmap o3) < size_i (to_fmap g)) ∧ (∀(v1 : var), v1 ∈ to_fset r -> v1 ∈ dom (to_fmap o3)) ∧ irrefl o3 ∧ sym o3) ∧ (∀(a : t var), (∀(u1 : var), (u1 ∈ dom (to_fmap a)) = (u1 ∈ dom (to_fmap o3))) ∧ (∀(u1 : var) (v1 : var), to_fmap a !! u1 = Some v1 -> v1 ∈ dom (to_fmap o3)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap a !! k = Some k) ∧ no_collision o3 a -> u ∈ dom (to_fmap a) ∧ (let o4 : var := lookup_gmap_total (to_fmap a) u in o4 = lookup_gmap_total (to_fmap a) u -> (∀(result : t var), to_fmap result = <[v := o4]>(to_fmap a) -> (∀(u1 : var), (u1 ∈ dom (to_fmap result)) = (u1 ∈ dom (to_fmap g))) ∧ (∀(u1 : var) (v1 : var), to_fmap result !! u1 = Some v1 -> v1 ∈ dom (to_fmap g)) ∧ (∀(k : var), k ∈ to_fset r -> to_fmap result !! k = Some k) ∧ no_collision g result)))) end)) end.
Admitted.
