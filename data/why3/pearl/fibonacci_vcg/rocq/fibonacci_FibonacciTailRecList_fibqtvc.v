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
Require Import Why3.int.Fibonacci.
Open Scope Z_scope.
Axiom sum_fib : list Z -> Z.
Axiom sum_fib'def : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), match l with | [] => sum_fib l = 0%Z | cons x r => sum_fib l = fib x + sum_fib r end.
Axiom sum_pow : list Z -> Z.
Axiom sum_pow'def : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), match l with | [] => sum_pow l = 0%Z | cons x r => sum_pow l = Z.pow 2%Z x + sum_pow r end.
Axiom sum_pow'spec : forall  (l : list Z) (fact0 : ∀(n : Z), n ∈ l -> 0%Z ≤ n), 0%Z ≤ sum_pow l.
Theorem fib'vc (n : Z) (fact0 : 0%Z ≤ n) : let o1 : list Z := cons n ([] : list Z) in (∀(n1 : Z), n1 ∈ o1 -> 0%Z ≤ n1) ∧ 0%Z + sum_fib o1 = fib n.
Admitted.
