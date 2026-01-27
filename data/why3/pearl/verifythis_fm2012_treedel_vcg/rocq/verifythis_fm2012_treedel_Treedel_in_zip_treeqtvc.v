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
Theorem in_zip_tree'vc (m : loc -> node) (t : tree loc) (z : zipper loc) (fact0 : istree m (zip t z)) : (match z with | Top => True | Left z1 p r => (match z with | Top => False | Left f _ _ => f = z1 end) ∧ istree m (zip (Node t p r) z1) end) ∧ ((match z with | Top => True | Left z1 p r => istree m (Node t p r) end) -> istree m t).
Admitted.
