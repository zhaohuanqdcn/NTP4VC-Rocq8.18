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
Open Scope Z_scope.
Axiom table : Type.
Axiom table_inhabited : Inhabited table.
Global Existing Instance table_inhabited.
Axiom table_countable : Countable table.
Global Existing Instance table_countable.
Definition inv (t : Z -> option Z) := ∀(x : Z) (y : Z), t x = Some y -> y = fib x.
Theorem memo_fibo'vc (n : Z) (table1 : Z -> option Z) (fact0 : 0%Z ≤ n) (fact1 : inv table1) : (∀(result : Z), table1 n = Some result -> result = fib n ∧ inv table1) ∧ (table1 n = None -> ((0%Z ≤ 2%Z * n + 1%Z ∧ 2%Z * n < 2%Z * n + 1%Z) ∧ 0%Z ≤ n ∧ inv table1) ∧ (∀(table2 : Z -> option Z), let fn : Z := fib n in inv table2 -> fn = fib n ∧ inv (fun_updt table2 n (Some fn)))).
Proof.
Admitted.
