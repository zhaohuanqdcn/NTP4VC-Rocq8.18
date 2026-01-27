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
Axiom infix_sl : Z -> Z -> Z.
Axiom infix_sl'def : forall  (y : Z) (x : Z) (fact0 : ¬ y = 0%Z), infix_sl x y = ZEuclid.div x y.
Theorem comb'vc (k : Z) (n : Z) (o1 : bool) (fact0 : 0%Z ≤ k) (fact1 : k ≤ n) (fact2 : if decide (k = 0%Z) then o1 = true else o1 = (if decide (k = n) then true else false)) : (¬ o1 = true -> (let o2 : Z := k - 1%Z in let o3 : Z := n - 1%Z in ((0%Z ≤ n ∧ o3 < n) ∧ 0%Z ≤ o2 ∧ o2 ≤ o3) ∧ (∀(o4 : Z), 1%Z ≤ o4 -> (let o5 : Z := n - 1%Z in (0%Z ≤ n ∧ o5 < n) ∧ 0%Z ≤ k ∧ k ≤ o5)))) ∧ (∀(result : Z), (if decide (o1 = true) then result = 1%Z else ∃(o2 : Z), 1%Z ≤ o2 ∧ (∃(o3 : Z), 1%Z ≤ o3 ∧ result = o3 + o2)) -> 1%Z ≤ result).
Admitted.
