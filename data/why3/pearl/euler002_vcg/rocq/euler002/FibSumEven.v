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
Axiom fib_sum_even : Z -> Z -> Z.
Axiom SumZero : forall  (m : Z), fib_sum_even m 0%Z = 0%Z.
Axiom SumEvenLe : forall  (n : Z) (m : Z) (fact0 : 0%Z ≤ n) (fact1 : fib n ≤ m) (fact2 : Z.quot (fib n) 2%Z = 0%Z), fib_sum_even m (n + 1%Z) = fib_sum_even m n + fib n.
Axiom SumEvenGt : forall  (n : Z) (m : Z) (fact0 : 0%Z ≤ n) (fact1 : m < fib n) (fact2 : Z.quot (fib n) 2%Z = 0%Z), fib_sum_even m (n + 1%Z) = fib_sum_even m n.
Axiom SumOdd : forall  (n : Z) (m : Z) (fact0 : 0%Z ≤ n) (fact1 : ¬ Z.quot (fib n) 2%Z = 0%Z), fib_sum_even m (n + 1%Z) = fib_sum_even m n.
Definition is_fib_sum_even (m : Z) (sum : Z) := ∃(n : Z), sum = fib_sum_even m n ∧ m < fib n.
