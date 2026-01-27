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
Require Import Why3.exn.Exn.
Open Scope Z_scope.
Axiom Trans : forall  (x : Z) (y : Z) (z : Z) (fact0 : x < y) (fact1 : y < z), x < z.
Inductive sorted : list Z -> Prop :=
 | Sorted_Nil : sorted ([] : list Z)
 | Sorted_One (x : Z) : sorted (cons x ([] : list Z))
 | Sorted_Two (x : Z) (y : Z) (l : list Z) : x < y -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> x < y) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list Z) (l2 : list Z), (sorted l1 ∧ sorted l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> x < y)) = sorted (l1 ++ l2).
Axiom Trans1 : forall  (x : Z) (y : Z) (z : Z) (fact0 : x ≤ y) (fact1 : y ≤ z), x ≤ z.
Inductive sorted1 : list Z -> Prop :=
 | Sorted_Nil1 : sorted1 ([] : list Z)
 | Sorted_One1 (x : Z) : sorted1 (cons x ([] : list Z))
 | Sorted_Two1 (x : Z) (y : Z) (l : list Z) : x ≤ y -> sorted1 (cons y l) -> sorted1 (cons x (cons y l)).
Axiom sorted_mem1 : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> x ≤ y) ∧ sorted1 l) = sorted1 (cons x l).
Axiom sorted_append1 : forall  (l1 : list Z) (l2 : list Z), (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> x ≤ y)) = sorted1 (l1 ++ l2).
Inductive sorted2 : list Z -> Prop :=
 | Sorted_Nil2 : sorted2 ([] : list Z)
 | Sorted_One2 (x : Z) : sorted2 (cons x ([] : list Z))
 | Sorted_Two2 (y : Z) (x : Z) (l : list Z) : y ≤ x -> sorted2 (cons y l) -> sorted2 (cons x (cons y l)).
Axiom sorted_mem2 : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> y ≤ x) ∧ sorted2 l) = sorted2 (cons x l).
Axiom sorted_append2 : forall  (l1 : list Z) (l2 : list Z), (sorted2 l1 ∧ sorted2 l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> y ≤ x)) = sorted2 (l1 ++ l2).
Definition compat (s : list Z) (t : list Z) := match (s, t) with | (cons x _, cons y _) => x ≤ y | (_, _) => True end.
Axiom rev_append_sorted_incr : forall  (s : list Z) (t : list Z), sorted1 (rev_append s t) = (sorted2 s ∧ sorted1 t ∧ compat s t).
Axiom rev_append_sorted_decr : forall  (s : list Z) (t : list Z), sorted2 (rev_append s t) = (sorted1 s ∧ sorted2 t ∧ compat t s).
Definition eqb (b1 : bool) (b2 : bool) : bool := implb b1 b2 && implb b2 b1.
Axiom eqb'spec : forall  (b1 : bool) (b2 : bool), (eqb b1 b2 = true) = (b1 = b2).
Axiom list_seq : Type.
Axiom list_seq_inhabited : Inhabited list_seq.
Global Existing Instance list_seq_inhabited.
Axiom list_seq_countable : Countable list_seq.
Global Existing Instance list_seq_countable.
Axiom list : list_seq -> Datatypes.list Z.
Axiom seq : list_seq -> Datatypes.list Z.
Axiom list_seq'invariant : forall  (self : list_seq), seq self = rev (list self).
Definition list_seq'eq (a : list_seq) (b : list_seq) := list a = list b ∧ seq a = seq b.
Axiom list_seq'inj : forall  (a : list_seq) (b : list_seq) (fact0 : list_seq'eq a b), a = b.
Axiom nil : list_seq.
Axiom nil'def : list nil = ([] : Datatypes.list Z) ∧ seq nil = ([] : Datatypes.list Z).
Axiom order : Datatypes.list Z -> Datatypes.list Z.
Axiom order'def : forall  (l : Datatypes.list Z) (fact0 : sorted l ∨ sorted2 l), match l with | [] => order l = l | cons _ [] => order l = l | cons h1 (cons h2 _) => (if decide (h1 < h2) then order l = l else order l = rev l) end.
Axiom order'spec'0 : forall  (l : Datatypes.list Z) (fact0 : sorted l ∨ sorted2 l), sorted1 (order l).
Axiom order'spec : forall  (l : Datatypes.list Z) (fact0 : sorted l ∨ sorted2 l), l ≡ₚ order l.
Axiom infix_plpl_closure : forall {α : Type} `{Inhabited α}, Datatypes.list α -> Datatypes.list α -> Datatypes.list α.
Axiom infix_plpl_closure_def : forall  {α : Type} `{Inhabited α} (y : Datatypes.list α) (y1 : Datatypes.list α), infix_plpl_closure y y1 = y ++ y1.
Theorem merge_pair'vc (ls : Datatypes.list (Datatypes.list Z)) (fact0 : ∀(l : Datatypes.list Z), l ∈ ls -> sorted1 l) : (match ls with | [] => True | cons _ [] => True | cons l1 (cons l2 r) => ((0%Z ≤ Z.of_nat (length ls) ∧ Z.of_nat (length r) < Z.of_nat (length ls)) ∧ (∀(l : Datatypes.list Z), l ∈ r -> sorted1 l)) ∧ (∀(o1 : Datatypes.list (Datatypes.list Z)), Z.of_nat (length o1) ≤ Z.of_nat (length r) ∧ (1%Z < Z.of_nat (length r) -> 0%Z < Z.of_nat (length o1) ∧ Z.of_nat (length o1) < Z.of_nat (length r)) ∧ (∀(l : Datatypes.list Z), l ∈ o1 -> sorted1 l) ∧ foldr' infix_plpl_closure o1 ([] : Datatypes.list Z) ≡ₚ foldr' infix_plpl_closure r ([] : Datatypes.list Z) -> sorted1 l1 ∧ sorted1 l2) end) ∧ (∀(result : Datatypes.list (Datatypes.list Z)), (match ls with | [] => result = ls | cons _ [] => result = ls | cons l1 (cons l2 r) => (∃(o1 : Datatypes.list (Datatypes.list Z)), (Z.of_nat (length o1) ≤ Z.of_nat (length r) ∧ (1%Z < Z.of_nat (length r) -> 0%Z < Z.of_nat (length o1) ∧ Z.of_nat (length o1) < Z.of_nat (length r)) ∧ (∀(l : Datatypes.list Z), l ∈ o1 -> sorted1 l) ∧ foldr' infix_plpl_closure o1 ([] : Datatypes.list Z) ≡ₚ foldr' infix_plpl_closure r ([] : Datatypes.list Z)) ∧ (∃(o2 : Datatypes.list Z), (sorted1 o2 ∧ o2 ≡ₚ l1 ++ l2) ∧ result = cons o2 o1)) end) -> Z.of_nat (length result) ≤ Z.of_nat (length ls) ∧ (1%Z < Z.of_nat (length ls) -> 0%Z < Z.of_nat (length result) ∧ Z.of_nat (length result) < Z.of_nat (length ls)) ∧ (∀(l : Datatypes.list Z), l ∈ result -> sorted1 l) ∧ foldr' infix_plpl_closure result ([] : Datatypes.list Z) ≡ₚ foldr' infix_plpl_closure ls ([] : Datatypes.list Z)).
Admitted.
