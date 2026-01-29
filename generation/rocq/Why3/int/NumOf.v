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
Axiom numof : (Z -> bool) -> Z -> Z -> Z.
Axiom numof'def : forall  (b : Z) (a : Z) (p : Z -> bool), if decide (b ≤ a) then numof p a b = 0%Z else if decide (p (b - 1%Z) = true) then numof p a b = 1%Z + numof p a (b - 1%Z) else numof p a b = numof p a (b - 1%Z).
Axiom Numof_bounds : forall  (a : Z) (b : Z) (p : Z -> bool) (fact0 : a < b), 0%Z ≤ numof p a b ∧ numof p a b ≤ b - a.
Axiom Numof_append : forall  (a : Z) (b : Z) (c : Z) (p : Z -> bool) (fact0 : a ≤ b) (fact1 : b ≤ c), numof p a c = numof p a b + numof p b c.
Axiom Numof_left_no_add : forall  (a : Z) (b : Z) (p : Z -> bool) (fact0 : a < b) (fact1 : ¬ p a = true), numof p a b = numof p (a + 1%Z) b.
Axiom Numof_left_add : forall  (a : Z) (b : Z) (p : Z -> bool) (fact0 : a < b) (fact1 : p a = true), numof p a b = 1%Z + numof p (a + 1%Z) b.
Axiom Empty : forall  (a : Z) (b : Z) (p : Z -> bool) (fact0 : ∀(n : Z), a ≤ n ∧ n < b -> ¬ p n = true), numof p a b = 0%Z.
Axiom Full : forall  (a : Z) (b : Z) (p : Z -> bool) (fact0 : a ≤ b) (fact1 : ∀(n : Z), a ≤ n ∧ n < b -> p n = true), numof p a b = b - a.
Axiom numof_increasing : forall  (i : Z) (j : Z) (k : Z) (p : Z -> bool) (fact0 : i ≤ j) (fact1 : j ≤ k), numof p i j ≤ numof p i k.
Axiom numof_strictly_increasing : forall  (i : Z) (j : Z) (k : Z) (l : Z) (p : Z -> bool) (fact0 : i ≤ j) (fact1 : j ≤ k) (fact2 : k < l) (fact3 : p k = true), numof p i j < numof p i l.
Axiom numof_change_any : forall  (a : Z) (b : Z) (p1 : Z -> bool) (p2 : Z -> bool) (fact0 : ∀(j : Z), a ≤ j ∧ j < b -> p1 j = true -> p2 j = true), numof p1 a b ≤ numof p2 a b.
Axiom numof_change_some : forall  (a : Z) (i : Z) (b : Z) (p1 : Z -> bool) (p2 : Z -> bool) (fact0 : a ≤ i) (fact1 : i < b) (fact2 : ∀(j : Z), a ≤ j ∧ j < b -> p1 j = true -> p2 j = true) (fact3 : ¬ p1 i = true) (fact4 : p2 i = true), numof p1 a b < numof p2 a b.
Axiom numof_change_equiv : forall  (a : Z) (b : Z) (p1 : Z -> bool) (p2 : Z -> bool) (fact0 : ∀(j : Z), a ≤ j ∧ j < b -> (p1 j = true) = (p2 j = true)), numof p2 a b = numof p1 a b.
