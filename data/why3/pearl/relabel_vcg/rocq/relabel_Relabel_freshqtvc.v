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
Inductive same_shape { β : Type} { α : Type} : tree α -> tree β -> Prop :=
 | same_shape_Leaf (x1 : α) (x2 : β) : same_shape (Leaf x1) (Leaf x2)
 | same_shape_Node (l1 : tree α) (l2 : tree β) (r1 : tree α) (r2 : tree β) : same_shape l1 l2 -> same_shape r1 r2 -> same_shape (Node l1 r1) (Node l2 r2).
Theorem fresh'vc : True.
Proof.
Admitted.
