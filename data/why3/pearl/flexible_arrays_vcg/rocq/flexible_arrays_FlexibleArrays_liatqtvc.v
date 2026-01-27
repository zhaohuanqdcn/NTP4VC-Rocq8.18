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
Require Import flexible_arrays_vcg.flexible_arrays.BraunTrees.
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom size : forall {α : Type} `{Inhabited α}, t α -> Z.
Axiom tree : forall {α : Type} `{Inhabited α}, t α -> Tree.tree α.
Axiom t'invariant : forall  {α : Type} `{Inhabited α} (self : t α), braun (tree self) ∧ Size.size (tree self) = size self ∧ 0%Z ≤ size self.
Definition t'eq {α : Type} `{Inhabited α} (a : t α) (b : t α) := size a = size b ∧ tree a = tree b.
Axiom t'inj : forall  {α : Type} `{Inhabited α} (a : t α) (b : t α) (fact0 : t'eq a b), a = b.
Axiom empty : forall {α : Type} `{Inhabited α}, t α.
Axiom empty'def : forall  {α : Type} `{Inhabited α}, size (empty : t α) = 0%Z.
Axiom get : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom get'def : forall  {α : Type} `{Inhabited α} (i : Z) (t1 : t α) (fact0 : 0%Z ≤ i) (fact1 : i < size t1), get t1 i = get_tree (tree t1) i.
Theorem liat'vc {α : Type} `{Inhabited α} (t1 : t α) (fact0 : 0%Z < size t1) : let o1 : Tree.tree α := tree t1 in (braun o1 ∧ size t1 = Size.size o1 ∧ 0%Z < Size.size o1) ∧ (∀(o2 : Tree.tree α), Size.size o2 = Size.size o1 - 1%Z ∧ braun o2 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Size.size o2 -> get_tree o2 i = get_tree o1 i) -> (let o3 : Z := size t1 - 1%Z in (braun o2 ∧ Size.size o2 = o3 ∧ 0%Z ≤ o3) ∧ (∀(r : t α), size r = o3 ∧ tree r = o2 -> size r = size t1 - 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < size r -> get r i = get t1 i)))).
Admitted.
