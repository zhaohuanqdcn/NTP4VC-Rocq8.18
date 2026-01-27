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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {χ : Type} `{Inhabited χ} `{Countable χ}, Inhabited (t χ).
Global Existing Instance t_inhabited.
Axiom to_fmap : forall {χ : Type} `{Inhabited χ} `{Countable χ}, t χ -> gmap loc χ.
Axiom null : loc.
Definition valid (prev : gmap loc loc) (next : gmap loc loc) (s : list loc) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = null ∧ nth (Z.to_nat i) s inhabitant ∈ dom prev ∧ nth (Z.to_nat i) s inhabitant ∈ dom next ∧ (∀(j : Z), i < j ∧ j < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = nth (Z.to_nat j) s inhabitant).
Definition dll (prev : gmap loc loc) (next : gmap loc loc) (s : list loc) (head : loc) (lo : Z) (hi : Z) := valid prev next s ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length s)) ∧ head = (if decide (lo = Z.of_nat (length s)) then null else nth (Z.to_nat lo) s inhabitant) ∧ (∀(i : Z), lo ≤ i ∧ i < hi - 1%Z -> lookup_gmap_total next (nth (Z.to_nat i) s inhabitant) = nth (Z.to_nat (i + 1%Z)) s inhabitant) ∧ (∀(i : Z), lo < i ∧ i < hi -> lookup_gmap_total prev (nth (Z.to_nat i) s inhabitant) = nth (Z.to_nat (i - 1%Z)) s inhabitant) ∧ (lo < hi -> lookup_gmap_total next (nth (Z.to_nat (hi - 1%Z)) s inhabitant) = (if decide (hi = Z.of_nat (length s)) then null else nth (Z.to_nat hi) s inhabitant)) ∧ (lo < hi -> lookup_gmap_total prev (nth (Z.to_nat lo) s inhabitant) = (if decide (lo = 0%Z) then null else nth (Z.to_nat (lo - 1%Z)) s inhabitant)).
Program Fixpoint tree (prev : gmap loc loc) (next : gmap loc loc) (s : list loc) (root : loc) (t1 : Tree.tree Z) (lo : Z) (hi : Z) : Prop :=
valid prev next s ∧ (0%Z ≤ lo ∧ lo ≤ hi ∧ hi ≤ Z.of_nat (length s)) ∧ (match t1 with | Empty => root = null ∧ lo = hi | Node l p r => (lo ≤ p ∧ p < hi) ∧ root = nth (Z.to_nat p) s inhabitant ∧ tree prev next s (lookup_gmap_total prev root) l lo p ∧ tree prev next s (lookup_gmap_total next root) r (p + 1%Z) hi end).
Admit Obligations.
Theorem tree_size'vc (prev : gmap loc loc) (next : gmap loc loc) (s : list loc) (root : loc) (t1 : Tree.tree Z) (lo : Z) (hi : Z) (fact0 : tree prev next s root t1 lo hi) : Size.size t1 = hi - lo.
Admitted.
