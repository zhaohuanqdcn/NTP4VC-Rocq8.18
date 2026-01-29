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
Require Import queens_vcg.queens.S.
Require Import queens_vcg.queens.Solution.
Open Scope Z_scope.
Theorem queens3'vc (o1 : gset Z) (o2 : gset Z) (o3 : gset Z) (col : Z -> Z) (sol1 : Z -> Z -> Z) (fact0 : 0%Z ≤ n) (fact1 : o1 = (∅ : gset Z)) (fact2 : Z.of_nat (size o1) = 0%Z) (fact3 : o2 = (∅ : gset Z)) (fact4 : Z.of_nat (size o2) = 0%Z) (fact5 : o3 = gset_interval 0%Z n) (fact6 : Z.of_nat (size o3) = (if decide (0%Z ≤ n) then n - 0%Z else 0%Z)) : 0%Z ≤ 0%Z ∧ 0%Z + Z.of_nat (size o3) = n ∧ 0%Z ≤ 0%Z ∧ (∀(i : Z), (i ∈ o3) = ((0%Z ≤ i ∧ i < n) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ col j = i))) ∧ (∀(i : Z), 0%Z ≤ i -> (¬ i ∈ o2) = (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ col j = i + j - 0%Z)) ∧ (∀(i : Z), 0%Z ≤ i -> (¬ i ∈ o1) = (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ col j = i + 0%Z - j)) ∧ partial_solution 0%Z col ∧ (∀(s : Z) (sol : Z -> Z -> Z) (col1 : Z -> Z), let result : Z := s - 0%Z in 0%Z ≤ s - 0%Z ∧ sorted sol 0%Z s ∧ (∀(t : Z -> Z), (partial_solution n t ∧ eq_prefix col1 t 0%Z) = (∃(i : Z), (0%Z ≤ i ∧ i < s) ∧ eq_prefix t (sol i) n)) ∧ eq_prefix col col1 0%Z ∧ eq_prefix sol1 sol 0%Z -> result = s ∧ sorted sol 0%Z s ∧ (∀(t : Z -> Z), partial_solution n t = (∃(i : Z), (0%Z ≤ i ∧ i < result) ∧ eq_prefix t (sol i) n))).
Proof.
Admitted.
