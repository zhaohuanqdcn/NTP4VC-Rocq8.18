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
Program Fixpoint snoc (l : list Z) (x : Z) : list Z :=
match l with | [] => cons x ([] : list Z) | cons y q => cons y (snoc q x) end.
Admit Obligations.
Theorem zeckendorf_unique'vc (l1 : list Z) (l2 : list Z) (fact0 : wf 2%Z l1) (fact1 : wf 2%Z l2) (fact2 : sum l1 = sum l2) : l1 = l2.
Admitted.
