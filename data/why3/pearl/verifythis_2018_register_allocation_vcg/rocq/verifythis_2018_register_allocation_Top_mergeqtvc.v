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
Theorem merge'vc (v : var) (u : var) (g : t set) (g1 : t set) (gu : set) (gv : set) (o1 : set) (g2 : t set) (result : t set) (fact0 : ¬ v = u) (fact1 : v ∈ dom (to_fmap g)) (fact2 : u ∈ dom (to_fmap g)) (fact3 : ∀(k : var), (k ∈ dom (to_fmap g1)) = (k ∈ dom (to_fmap g))) (fact4 : ∀(k : var), k ∈ dom (to_fmap g1) -> to_fset (lookup_gmap_total (to_fmap g1) k) = to_fset (replace v u (lookup_gmap_total (to_fmap g) k))) (fact5 : size_i (to_fmap g1) = size_i (to_fmap g)) (fact6 : if decide (u ∈ dom (to_fmap g1)) then gu = lookup_gmap_total (to_fmap g1) u ∧ gu = lookup_gmap_total (to_fmap g1) u else to_fset gu = (∅ : gset var) ∧ Z.of_nat (size (to_fset gu)) = 0%Z) (fact7 : if decide (v ∈ dom (to_fmap g1)) then gv = lookup_gmap_total (to_fmap g1) v ∧ gv = lookup_gmap_total (to_fmap g1) v else to_fset gv = (∅ : gset var) ∧ Z.of_nat (size (to_fset gv)) = 0%Z) (fact8 : to_fset o1 = to_fset gu ∪ to_fset gv) (fact9 : to_fmap g2 = <[u := o1]>(to_fmap g1)) (fact10 : to_fmap result = delete_gmap v (to_fmap g2)) : (∀(k : var), (k ∈ dom (to_fmap result)) = (¬ k = v ∧ k ∈ dom (to_fmap g))) ∧ to_fset (lookup_gmap_total (to_fmap result) u) = to_fset (replace v u (lookup_gmap_total (to_fmap g) u)) ∪ to_fset (replace v u (lookup_gmap_total (to_fmap g) v)) ∧ (∀(k : var), k ∈ dom (to_fmap result) -> ¬ k = u -> to_fset (lookup_gmap_total (to_fmap result) k) = to_fset (replace v u (lookup_gmap_total (to_fmap g) k))) ∧ size_i (to_fmap result) = size_i (to_fmap g) - 1%Z.
Proof.
Admitted.
