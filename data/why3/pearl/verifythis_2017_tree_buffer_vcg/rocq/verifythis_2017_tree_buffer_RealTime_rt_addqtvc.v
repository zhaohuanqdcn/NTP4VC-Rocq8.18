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
Require Import verifythis_2017_tree_buffer_vcg.verifythis_2017_tree_buffer.Spec.
Require Import Why3.queue.Queue.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom rt : Type.
Axiom rt_inhabited : Inhabited rt.
Global Existing Instance rt_inhabited.
Axiom rt_countable : Countable rt.
Global Existing Instance rt_countable.
Axiom ch : rt -> Z.
Axiom xs : rt -> list elt.
Axiom xs_len : rt -> Z.
Axiom ys : rt -> list elt.
Axiom b : rt -> buf elt.
Axiom rt'invariant : forall  (self : rt), h (b self) = ch self ∧ xs_len self = Z.of_nat (length (xs self)) ∧ Z.of_nat (length (xs self)) < ch self ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ ch self -> Spec.take len (xs self ++ ys self) = Spec.take len (Spec.xs (b self))).
Definition rt'eq (a : rt) (b1 : rt) := ch a = ch b1 ∧ xs a = xs b1 ∧ xs_len a = xs_len b1 ∧ ys a = ys b1 ∧ b a = b b1.
Axiom rt'inj : forall  (a : rt) (b1 : rt) (fact0 : rt'eq a b1), a = b1.
Theorem rt_add'vc (c : rt) (to_delete1 : t (list elt)) (x : elt) : if decide (xs_len c = ch c - 1%Z) then ∀(to_delete : t (list elt)), seq to_delete = seq to_delete1 ++ [ys c] -> (let o1 : buf elt := add x (b c) in let o2 : list elt := cons x (xs c) in let o3 : list elt := ([] : list elt) in let o4 : Z := ch c in (h o1 = o4 ∧ (0%Z = Z.of_nat (length o3) ∧ Z.of_nat (length o3) < o4) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ o4 -> Spec.take len (o3 ++ o2) = Spec.take len (Spec.xs o1))) ∧ (∀(result : rt), ch result = o4 ∧ xs result = o3 ∧ xs_len result = 0%Z ∧ ys result = o2 ∧ b result = o1 -> b result = add x (b c))) else let o1 : buf elt := add x (b c) in let o2 : list elt := ys c in let o3 : Z := 1%Z + xs_len c in let o4 : list elt := cons x (xs c) in let o5 : Z := ch c in (h o1 = o5 ∧ (o3 = Z.of_nat (length o4) ∧ Z.of_nat (length o4) < o5) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ o5 -> Spec.take len (o4 ++ o2) = Spec.take len (Spec.xs o1))) ∧ (∀(result : rt), ch result = o5 ∧ xs result = o4 ∧ xs_len result = o3 ∧ ys result = o2 ∧ b result = o1 -> b result = add x (b c)).
Proof.
Admitted.
