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
Inductive sorted : list Z -> Prop :=
 | Sorted_Nil : sorted ([] : list Z)
 | Sorted_One (x : Z) : sorted (cons x ([] : list Z))
 | Sorted_Two (x : Z) (y : Z) (l : list Z) : x < y -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> x < y) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list Z) (l2 : list Z), (sorted l1 ∧ sorted l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> x < y)) = sorted (l1 ++ l2).
Inductive sorted1 : list Z -> Prop :=
 | Sorted_Nil1 : sorted1 ([] : list Z)
 | Sorted_One1 (x : Z) : sorted1 (cons x ([] : list Z))
 | Sorted_Two1 (y : Z) (x : Z) (l : list Z) : y < x -> sorted1 (cons y l) -> sorted1 (cons x (cons y l)).
Axiom sorted_mem1 : forall  (l : list Z) (x : Z), ((∀(y : Z), y ∈ l -> y < x) ∧ sorted1 l) = sorted1 (cons x l).
Axiom sorted_append1 : forall  (l1 : list Z) (l2 : list Z), (sorted1 l1 ∧ sorted1 l2 ∧ (∀(x : Z) (y : Z), x ∈ l1 -> y ∈ l2 -> y < x)) = sorted1 (l1 ++ l2).
Definition compat (s : list Z) (t : list Z) := match (s, t) with | (cons x _, cons y _) => x < y | (_, _) => True end.
Axiom rev_append_sorted_incr : forall  (s : list Z) (t : list Z), sorted (rev_append s t) = (sorted1 s ∧ sorted t ∧ compat s t).
Axiom rev_append_sorted_decr : forall  (s : list Z) (t : list Z), sorted1 (rev_append s t) = (sorted s ∧ sorted1 t ∧ compat t s).
Axiom tower : Type.
Axiom tower_inhabited : Inhabited tower.
Global Existing Instance tower_inhabited.
Axiom tower_countable : Countable tower.
Global Existing Instance tower_countable.
Axiom rod : tower -> list Z.
Axiom tower'invariant : forall  (self : tower), sorted (rod self).
Definition tower'eq (a : tower) (b : tower) := rod a = rod b.
Axiom tower'inj : forall  (a : tower) (b : tower) (fact0 : tower'eq a b), a = b.
Theorem move'vc (a : tower) (x : Z) (s : list Z) (b : tower) (fact0 : rod a = cons x s) (fact1 : match rod b with | [] => True | cons y _ => x < y end) : match rod a with | cons x1 r => (∀(a1 : tower) (b1 : tower), sorted r ∧ (r = rod a1 -> sorted (cons x1 (rod b)) ∧ (cons x1 (rod b) = rod b1 -> rod a1 = s ∧ rod b1 = cons x (rod b)))) | [] => False end.
Proof.
Admitted.
