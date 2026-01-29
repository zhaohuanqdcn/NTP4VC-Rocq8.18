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
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Inductive color :=
  | Red : color
  | Black : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Inductive tree :=
  | Leaf : tree
  | Node : color -> tree -> Z -> Z -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint memt (t : tree) (k : Z) (v : Z) : Prop :=
match t with | Leaf => False | Node _ l k' v' r => k = k' ∧ v = v' ∨ memt l k v ∨ memt r k v end.
Admit Obligations.
Definition lt_tree (x : Z) (t : tree) := ∀(k : Z) (v : Z), memt t k v -> k < x.
Definition gt_tree (x : Z) (t : tree) := ∀(k : Z) (v : Z), memt t k v -> x < k.
Program Fixpoint bst (t : tree) : Prop :=
match t with | Leaf => True | Node _ l k _ r => bst l ∧ bst r ∧ lt_tree k l ∧ gt_tree k r end.
Admit Obligations.
Definition is_not_red (t : tree) := match t with | Node Red _ _ _ _ => False | Leaf => True | Node Black _ _ _ _ => True end.
Program Fixpoint rbtree (n : Z) (t : tree) : Prop :=
match t with | Leaf => n = 0%Z | Node Red l _ _ r => rbtree n l ∧ rbtree n r ∧ is_not_red l ∧ is_not_red r | Node Black l _ _ r => rbtree (n - 1%Z) l ∧ rbtree (n - 1%Z) r end.
Admit Obligations.
Definition almost_rbtree (n : Z) (t : tree) := match t with | Leaf => n = 0%Z | Node Red l _ _ r => rbtree n l ∧ rbtree n r | Node Black l _ _ r => rbtree (n - 1%Z) l ∧ rbtree (n - 1%Z) r end.
Theorem insert'vc (t : tree) (k : Z) (v : Z) (fact0 : bst t) (fact1 : ∃(n : Z), rbtree n t) : (match t with | Leaf => True | Node Red l k' v' r => (if decide (k < k') then (match t with | Leaf => False | Node _ f _ _ f1 => f = l ∨ f1 = l end) ∧ bst l ∧ (∃(n : Z), rbtree n l) else k' < k -> (match t with | Leaf => False | Node _ f _ _ f1 => f = r ∨ f1 = r end) ∧ bst r ∧ (∃(n : Z), rbtree n r)) | Node Black l k' v' r => (if decide (k < k') then ((match t with | Leaf => False | Node _ f _ _ f1 => f = l ∨ f1 = l end) ∧ bst l ∧ (∃(n : Z), rbtree n l)) ∧ (∀(o1 : tree), bst o1 ∧ (∀(n : Z), rbtree n l -> almost_rbtree n o1 ∧ (is_not_red l -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt l k'1 v'1)) -> lt_tree k' o1 ∧ gt_tree k' r ∧ bst o1 ∧ bst r) else k' < k -> ((match t with | Leaf => False | Node _ f _ _ f1 => f = r ∨ f1 = r end) ∧ bst r ∧ (∃(n : Z), rbtree n r)) ∧ (∀(o1 : tree), bst o1 ∧ (∀(n : Z), rbtree n r -> almost_rbtree n o1 ∧ (is_not_red r -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt r k'1 v'1)) -> lt_tree k' l ∧ gt_tree k' o1 ∧ bst l ∧ bst o1)) end) ∧ (∀(result : tree), (match t with | Leaf => result = Node Red Leaf k v Leaf | Node Red l k' v' r => (if decide (k < k') then ∃(o1 : tree), (bst o1 ∧ (∀(n : Z), rbtree n l -> almost_rbtree n o1 ∧ (is_not_red l -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt l k'1 v'1))) ∧ result = Node Red o1 k' v' r else if decide (k' < k) then ∃(o1 : tree), (bst o1 ∧ (∀(n : Z), rbtree n r -> almost_rbtree n o1 ∧ (is_not_red r -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt r k'1 v'1))) ∧ result = Node Red l k' v' o1 else result = Node Red l k' v r) | Node Black l k' v' r => (if decide (k < k') then ∃(o1 : tree), (bst o1 ∧ (∀(n : Z), rbtree n l -> almost_rbtree n o1 ∧ (is_not_red l -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt l k'1 v'1))) ∧ bst result ∧ (∀(n : Z), almost_rbtree n o1 -> rbtree n r -> rbtree (n + 1%Z) result) ∧ (∀(k'1 : Z) (v'1 : Z), memt result k'1 v'1 = (if decide (k'1 = k') then v'1 = v' else memt o1 k'1 v'1 ∨ memt r k'1 v'1)) else if decide (k' < k) then ∃(o1 : tree), (bst o1 ∧ (∀(n : Z), rbtree n r -> almost_rbtree n o1 ∧ (is_not_red r -> rbtree n o1)) ∧ memt o1 k v ∧ (∀(k'1 : Z) (v'1 : Z), memt o1 k'1 v'1 = (if decide (k'1 = k) then v'1 = v else memt r k'1 v'1))) ∧ bst result ∧ (∀(n : Z), almost_rbtree n o1 -> rbtree n l -> rbtree (n + 1%Z) result) ∧ (∀(k'1 : Z) (v'1 : Z), memt result k'1 v'1 = (if decide (k'1 = k') then v'1 = v' else memt l k'1 v'1 ∨ memt o1 k'1 v'1)) else result = Node Black l k' v r) end) -> bst result ∧ (∀(n : Z), rbtree n t -> almost_rbtree n result ∧ (is_not_red t -> rbtree n result)) ∧ memt result k v ∧ (∀(k' : Z) (v' : Z), memt result k' v' = (if decide (k' = k) then v' = v else memt t k' v'))).
Proof.
Admitted.
