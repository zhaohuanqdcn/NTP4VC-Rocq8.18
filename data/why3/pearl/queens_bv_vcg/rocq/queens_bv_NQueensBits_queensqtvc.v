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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import queens_bv_vcg.queens_bv.S.
Require Import queens_bv_vcg.queens_bv.Solution.
Require Import queens_bv_vcg.queens_bv.BitsSpec.
Open Scope Z_scope.
Theorem queens'vc (q : bv 32%N) (o1 : t) (o2 : t) (col : Z -> Z) (sol1 : Z -> Z -> Z) (fact0 : bv_unsigned q = n) (fact1 : bv_ule q w32_size_bv) (fact2 : mdl o1 = ∅) (fact3 : mdl o2 = ∅) : bv_ule q (32%bv : bv 32%N) ∧ (∀(o3 : t), mdl o3 = gset_interval 0%Z (bv_unsigned q) -> (n ≤ 32%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z + Z.of_nat (size (mdl o3)) = n ∧ 0%Z ≤ 0%Z ∧ (∀(i : Z), (i ∈ mdl o3) = ((0%Z ≤ i ∧ i < n) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ col j = i))) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 32%Z -> (¬ i ∈ mdl o2) = (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ i - col j = 0%Z - j)) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 32%Z -> (¬ i ∈ mdl o1) = (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ i - col j = j - 0%Z)) ∧ partial_solution 0%Z col) ∧ (∀(s : Z) (sol : Z -> Z -> Z) (col1 : Z -> Z), let result : Z := s - 0%Z in 0%Z ≤ s - 0%Z ∧ sorted sol 0%Z s ∧ (∀(i : Z), 0%Z ≤ i ∧ i < s -> partial_solution n (sol i) ∧ eq_prefix col1 (sol i) 0%Z) ∧ (∀(u : Z -> Z), partial_solution n u ∧ eq_prefix col1 u 0%Z -> (∃(i : Z), (0%Z ≤ i ∧ i < s) ∧ eq_prefix u (sol i) n)) ∧ eq_prefix col col1 0%Z ∧ eq_prefix sol1 sol 0%Z -> result = s ∧ sorted sol 0%Z s ∧ (∀(u : Z -> Z), partial_solution n u = (∃(i : Z), (0%Z ≤ i ∧ i < result) ∧ eq_prefix u (sol i) n)))).
Admitted.
