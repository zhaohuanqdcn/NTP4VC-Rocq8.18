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
Open Scope Z_scope.
Axiom table : Type.
Axiom table_inhabited : Inhabited table.
Global Existing Instance table_inhabited.
Axiom table_countable : Countable table.
Global Existing Instance table_countable.
Definition inv (t : Z -> option Z) := ∀(x : Z) (y : Z), t x = Some y -> y = fib x.
Theorem memo_fibo'vc (n : Z) (table1 : Z -> option Z) (fact0 : 0%Z ≤ n) (fact1 : inv table1) : (∀(result : Z), table1 n = Some result -> result = fib n ∧ inv table1) ∧ (table1 n = None -> ((0%Z ≤ 2%Z * n + 1%Z ∧ 2%Z * n < 2%Z * n + 1%Z) ∧ 0%Z ≤ n ∧ inv table1) ∧ (∀(table2 : Z -> option Z), let fn : Z := fib n in inv table2 -> fn = fib n ∧ inv (fun_updt table2 n (Some fn)))).
Admitted.
