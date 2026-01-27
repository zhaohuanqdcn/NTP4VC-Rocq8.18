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
Require Import Why3.int.Fibonacci.
Require Import fibonacci_vcg.fibonacci.SmallestFibAbove.
Open Scope Z_scope.
Program Fixpoint sum (l : list Z) : Z :=
match l with | [] => 0%Z | cons k r => fib k + sum r end.
Admit Obligations.
Program Fixpoint wf (min : Z) (l : list Z) : Prop :=
match l with | [] => True | cons k r => min ≤ k ∧ wf (k + 2%Z) r end.
Admit Obligations.
Theorem zeckendorf_fast'vc (n : Z) (fact0 : 0%Z ≤ n) : if decide (n = 0%Z) then let result : list Z := ([] : list Z) in wf 2%Z result ∧ n = sum result else ((1%Z ≤ 1%Z ∧ (1%Z = fib 1%Z ∧ fib 1%Z ≤ n) ∧ 1%Z = fib (1%Z + 1%Z)) ∧ 1%Z ≤ 1%Z) ∧ (∀(k : Z), (1%Z ≤ k ∧ fib k ≤ n) ∧ 1%Z ≤ fib k ∧ 1%Z ≤ fib (k + 1%Z) -> (if decide (fib (k + 1%Z) ≤ n) then (0%Z ≤ 2%Z * n - (fib k + fib (k + 1%Z)) ∧ 2%Z * n - (fib (k + 1%Z) + (fib k + fib (k + 1%Z))) < 2%Z * n - (fib k + fib (k + 1%Z))) ∧ (1%Z ≤ k + 1%Z ∧ fib (k + 1%Z) ≤ n ∧ fib k + fib (k + 1%Z) = fib (k + 1%Z + 1%Z)) ∧ 1%Z ≤ fib (k + 1%Z) ∧ 1%Z ≤ fib k + fib (k + 1%Z) else let o1 : list Z := cons k ([] : list Z) in let o2 : Z := n - fib k in ((1%Z ≤ k ∧ fib k ≤ n ∧ o2 < fib (k + 1%Z)) ∧ (1%Z ≤ fib k ∧ 1%Z ≤ fib (k + 1%Z)) ∧ (0%Z ≤ o2 ∧ o2 ≤ n) ∧ wf 2%Z o1 ∧ o2 + sum o1 = n ∧ o2 < fib (k - 1%Z)) ∧ (∀(x : Z) (l : list Z) (k1 : Z), (1%Z ≤ k1 ∧ fib k1 ≤ n ∧ x < fib (k1 + 1%Z)) ∧ (1%Z ≤ fib k1 ∧ 1%Z ≤ fib (k1 + 1%Z)) ∧ (0%Z ≤ x ∧ x ≤ n) ∧ wf 2%Z l ∧ x + sum l = n ∧ (match l with | [] => True | cons k2 _ => x < fib (k2 - 1%Z) end) -> (if decide (0%Z < x) then if decide (fib k1 ≤ x) then (0%Z ≤ k1 ∧ k1 - 1%Z < k1) ∧ (1%Z ≤ k1 - 1%Z ∧ (fib (k1 + 1%Z) - fib k1 = fib (k1 - 1%Z) ∧ fib (k1 - 1%Z) ≤ n) ∧ x - fib k1 < fib k1 ∧ fib k1 = fib (k1 - 1%Z + 1%Z)) ∧ (1%Z ≤ fib (k1 + 1%Z) - fib k1 ∧ 1%Z ≤ fib k1) ∧ (0%Z ≤ x - fib k1 ∧ x - fib k1 ≤ n) ∧ wf 2%Z (cons k1 l) ∧ x - fib k1 + sum (cons k1 l) = n ∧ (match cons k1 l with | [] => True | cons k2 _ => x - fib k1 < fib (k2 - 1%Z) end) else (0%Z ≤ k1 ∧ k1 - 1%Z < k1) ∧ (1%Z ≤ k1 - 1%Z ∧ (fib (k1 + 1%Z) - fib k1 = fib (k1 - 1%Z) ∧ fib (k1 - 1%Z) ≤ n) ∧ x < fib k1 ∧ fib k1 = fib (k1 - 1%Z + 1%Z)) ∧ (1%Z ≤ fib (k1 + 1%Z) - fib k1 ∧ 1%Z ≤ fib k1) ∧ (0%Z ≤ x ∧ x ≤ n) ∧ wf 2%Z l ∧ x + sum l = n ∧ (match l with | [] => True | cons k2 _ => x < fib (k2 - 1%Z) end) else wf 2%Z l ∧ n = sum l)))).
Admitted.
