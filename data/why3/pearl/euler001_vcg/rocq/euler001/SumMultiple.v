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
Require Import Why3.int.Div2.
Require Import euler001_vcg.euler001.DivModHints.
Require Import euler001_vcg.euler001.TriangularNumbers.
Open Scope Z_scope.
Axiom sum_multiple_3_5_lt : Z -> Z.
Axiom SumEmpty : sum_multiple_3_5_lt 0%Z = 0%Z.
Axiom SumNo : forall  (n : Z) (fact0 : 0%Z ≤ n) (fact1 : ¬ Z.quot n 3%Z = 0%Z) (fact2 : ¬ Z.quot n 5%Z = 0%Z), sum_multiple_3_5_lt (n + 1%Z) = sum_multiple_3_5_lt n.
Axiom SumYes : forall  (n : Z) (fact0 : 0%Z ≤ n) (fact1 : Z.quot n 3%Z = 0%Z ∨ Z.quot n 5%Z = 0%Z), sum_multiple_3_5_lt (n + 1%Z) = sum_multiple_3_5_lt n + n.
Definition closed_formula_aux (n : Z) : Z := let n3 : Z := Z.rem n 3%Z in let n5 : Z := Z.rem n 5%Z in let n15 : Z := Z.rem n 15%Z in 3%Z * tr n3 + 5%Z * tr n5 - 15%Z * tr n15.
Definition p (n : Z) := sum_multiple_3_5_lt (n + 1%Z) = closed_formula_aux n.
Axiom Induction : forall  (n : Z) (fact0 : ∀(n : Z), 0%Z ≤ n -> (∀(k : Z), 0%Z ≤ k ∧ k < n -> p k) -> p n) (fact1 : 0%Z ≤ n), p n.
Axiom Induction_bound : forall  (n : Z) (fact0 : ∀(n : Z), 0%Z ≤ n -> (∀(k : Z), 0%Z ≤ k ∧ k < n -> p k) -> p n) (fact1 : 0%Z ≤ n), p n.
Definition closed_formula (n : Z) : Z := let n3 : Z := Z.rem n 3%Z in let n5 : Z := Z.rem n 5%Z in let n15 : Z := Z.rem n 15%Z in Z.rem (3%Z * (n3 * (n3 + 1%Z)) + 5%Z * (n5 * (n5 + 1%Z)) - 15%Z * (n15 * (n15 + 1%Z))) 2%Z.
