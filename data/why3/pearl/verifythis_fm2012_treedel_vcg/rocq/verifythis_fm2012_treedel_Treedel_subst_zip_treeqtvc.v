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
Require Import Why3.why3.Ref.Ref.
Require Import verifythis_fm2012_treedel_vcg.verifythis_fm2012_treedel.Memory.
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Inorder.
Open Scope Z_scope.
Definition root (t : tree loc) : loc := match t with | Empty => null | Node _ p _ => p end.
Program Fixpoint istree (m : loc -> node) (t : tree loc) : Prop :=
match t with | Empty => True | Node l p r => ¬ p = null ∧ istree m l ∧ istree m r ∧ root l = left1 (m p) ∧ root r = right1 (m p) end.
Admit Obligations.
Inductive zipper (α : Type) :=
  | Top : zipper α
  | Left : zipper α -> α -> tree α -> zipper α.
Axiom zipper_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (zipper α).
Global Existing Instance zipper_inhabited.
Arguments Top {α}.
Arguments Left {α}.
Program Fixpoint zip {α : Type} `{Inhabited α} (t : tree α) (z : zipper α) : tree α :=
match z with | Top => t | Left z1 x r => zip (Node t x r) z1 end.
Admit Obligations.
Program Fixpoint inorderz {α : Type} `{Inhabited α} (z : zipper α) : list α :=
match z with | Top => ([] : list α) | Left z1 x r => cons x (inorder r) ++ inorderz z1 end.
Admit Obligations.
Theorem subst_zip_tree'vc (m : loc -> node) (t1 : tree loc) (z : zipper loc) (m' : loc -> node) (t2 : tree loc) (fact0 : istree m (zip t1 z)) (fact1 : istree m' t2) (fact2 : root t1 = root t2) (fact3 : NoDup (inorder (zip t1 z))) (fact4 : ∀(x : loc), ¬ m x = m' x -> x ∈ inorder t1) : (match z with | Top => True | Left z1 p r => (let t3 : tree loc := Node t1 p r in istree m (zip t3 z1) ∧ (istree m t3 -> (istree m r ∧ (∀(p1 : loc), p1 ∈ inorder r -> left1 (m p1) = left1 (m' p1) ∧ right1 (m p1) = right1 (m' p1))) ∧ (istree m' r -> (let o1 : tree loc := Node t2 p r in (match z with | Top => False | Left f _ _ => f = z1 end) ∧ (istree m (zip t3 z1) ∧ istree m' o1) ∧ root t3 = root o1 ∧ NoDup (inorder (zip t3 z1)) ∧ (∀(x : loc), ¬ m x = m' x -> x ∈ inorder t3))))) end) ∧ ((match z with | Top => True | Left z1 p r => (let t3 : tree loc := Node t1 p r in istree m t3 ∧ istree m' r ∧ (let o1 : tree loc := Node t2 p r in istree m' (zip o1 z1) ∧ root (zip t3 z1) = root (zip o1 z1))) end) -> istree m' (zip t2 z) ∧ root (zip t1 z) = root (zip t2 z)).
Proof.
Admitted.
