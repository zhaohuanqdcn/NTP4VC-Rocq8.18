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
Theorem zeckendorf'vc (n : Z) (fact0 : 0%Z ≤ n) : 0%Z ≤ n ∧ n ≤ n ∧ wf 2%Z ([] : list Z) ∧ n + sum ([] : list Z) = n ∧ (∀(l : list Z) (x : Z), (0%Z ≤ x ∧ x ≤ n) ∧ wf 2%Z l ∧ x + sum l = n ∧ (match l with | [] => True | cons k _ => x < fib (k - 1%Z) end) -> (if decide (0%Z < x) then 0%Z < x ∧ (∀(k : Z), 2%Z ≤ k ∧ 1%Z ≤ fib k ∧ fib k ≤ x ∧ x < fib (k + 1%Z) -> (0%Z ≤ x ∧ x - fib k < x) ∧ (0%Z ≤ x - fib k ∧ x - fib k ≤ n) ∧ wf 2%Z (cons k l) ∧ x - fib k + sum (cons k l) = n ∧ (match cons k l with | [] => True | cons k1 _ => x - fib k < fib (k1 - 1%Z) end)) else wf 2%Z l ∧ n = sum l)).
Proof.
Admitted.
