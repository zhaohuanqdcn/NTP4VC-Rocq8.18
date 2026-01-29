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
Theorem set'vc {α : Type} `{Inhabited α} (i : Z) (t1 : t α) (v : α) (fact0 : 0%Z ≤ i) (fact1 : i < size t1) : let o1 : Tree.tree α := tree t1 in ((0%Z ≤ i ∧ i < Size.size o1) ∧ braun o1) ∧ (let o2 : Tree.tree α := set_tree o1 i v in Size.size o2 = Size.size o1 ∧ braun o2 ∧ get_tree o2 i = v ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Size.size o1 -> ¬ j = i -> get_tree o2 j = get_tree o1 j) -> (let o3 : Z := size t1 in (braun o2 ∧ Size.size o2 = o3 ∧ 0%Z ≤ o3) ∧ (∀(r : t α), size r = o3 ∧ tree r = o2 -> size r = size t1 ∧ get r i = v ∧ (∀(j : Z), 0%Z ≤ j ∧ j < size t1 -> ¬ j = i -> get r j = get t1 j)))).
Proof.
Admitted.
