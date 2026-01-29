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
Open Scope Z_scope.
Inductive tree (α : Type) :=
  | Leaf : α -> tree α
  | Node : tree α -> tree α -> tree α.
Axiom tree_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (tree α).
Global Existing Instance tree_inhabited.
Arguments Leaf {α}.
Arguments Node {α}.
Program Fixpoint labels {α : Type} `{Inhabited α} (t : tree α) : list α :=
match t with | Leaf x => cons x ([] : list α) | Node l r => labels l ++ labels r end.
Admit Obligations.
Theorem labels_Leaf'vc {α : Type} `{Inhabited α} (x : α) (y : α) : (x ∈ labels (Leaf y)) = (x = y).
Proof.
Admitted.
