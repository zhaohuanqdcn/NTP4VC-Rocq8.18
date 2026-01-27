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
Open Scope Z_scope.
Axiom tower : Type.
Axiom tower_inhabited : Inhabited tower.
Global Existing Instance tower_inhabited.
Axiom tower_countable : Countable tower.
Global Existing Instance tower_countable.
Axiom rod : tower -> list Z.
Axiom tower'invariant : forall  (self : tower), Sorted Z.le (rod self).
Definition tower'eq (a : tower) (b : tower) := rod a = rod b.
Axiom tower'inj : forall  (a : tower) (b : tower) (fact0 : tower'eq a b), a = b.
Axiom prepend : Z -> list Z -> list Z.
Axiom prepend_def_zero : forall  (n : Z) (s : list Z) (fact0 : n ≤ 0%Z), prepend n s = s.
Axiom prepend_def_succ : forall  (n : Z) (s : list Z) (fact0 : 0%Z < n), prepend n s = prepend (n - 1%Z) (cons n s).
Theorem tower_of_hanoi'vc (a : tower) (b : tower) (c : tower) (fact0 : rod a = prepend (Z.of_nat (length (rod a))) ([] : list Z)) (fact1 : rod b = rod c) (fact2 : rod c = ([] : list Z)) : let o1 : list Z := ([] : list Z) in let o2 : Z := Z.of_nat (length (rod a)) in (rod a = prepend o2 o1 ∧ (match rod b with | [] => True | cons x _ => o2 < x end) ∧ (match rod c with | [] => True | cons x _ => o2 < x end)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod b1 = prepend o2 (rod b) ∧ rod c1 = rod c -> rod b1 = rod a ∧ rod a1 = rod c1 ∧ rod c1 = ([] : list Z)).
Admitted.
