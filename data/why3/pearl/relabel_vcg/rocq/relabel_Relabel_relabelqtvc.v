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
Theorem relabel'vc {α : Type} `{Inhabited α} (t : tree α) (r : Z) : match t with | Leaf _ => (let result : tree Z := Leaf (r + 1%Z) in same_shape t result ∧ NoDup (labels result) ∧ r ≤ r + 1%Z ∧ (∀(x : Z), x ∈ labels result -> r < x ∧ x ≤ r + 1%Z)) | Node l r1 => (match t with | Leaf _ => False | Node f f1 => f = r1 ∨ f1 = r1 end) ∧ (∀(r2 : Z) (o1 : tree Z), same_shape r1 o1 ∧ NoDup (labels o1) ∧ r ≤ r2 ∧ (∀(x : Z), x ∈ labels o1 -> r < x ∧ x ≤ r2) -> (match t with | Leaf _ => False | Node f f1 => f = l ∨ f1 = l end) ∧ (∀(r3 : Z) (o2 : tree Z), same_shape l o2 ∧ NoDup (labels o2) ∧ r2 ≤ r3 ∧ (∀(x : Z), x ∈ labels o2 -> r2 < x ∧ x ≤ r3) -> (let result : tree Z := Node o2 o1 in same_shape t result ∧ NoDup (labels result) ∧ r ≤ r3 ∧ (∀(x : Z), x ∈ labels result -> r < x ∧ x ≤ r3)))) end.
Admitted.
