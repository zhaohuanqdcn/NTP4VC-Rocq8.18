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
Require Import prover.BacktrackArray.Types.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.Predicates.Pred.
Require Import prover.BacktrackArray.Logic.
Require Import prover.Choice.Choice.
Open Scope Z_scope.
Theorem add'vc {α : Type} `{Inhabited α} (tb : t α) (x : Z) (b : α) (fact0 : correct tb) (fact1 : 0%Z ≤ x) (fact2 : inv tb b = true) : if decide (Z.of_nat (length (buffer tb)) ≤ x) then (correct tb ∧ Z.of_nat (length (buffer tb)) ≤ x) ∧ (∀(tb1 : t α), inv tb1 = inv tb -> x < Z.of_nat (length (buffer tb1)) ∧ precede tb tb1 ∧ correct tb1 ∧ table (current_timestamp tb1) = table (current_timestamp tb) -> ((0%Z ≤ x ∧ x < Z.of_nat (length (buffer tb1))) ∧ correct tb1 ∧ inv tb1 b = true) ∧ (∀(tb2 : t α), length (buffer tb2) = length (buffer tb1) ∧ inv tb2 = inv tb1 -> past_time (current_timestamp tb2) tb2 ∧ correct tb2 ∧ precede tb1 tb2 ∧ (let tb0 : Z -> list α := table (current_timestamp tb1) in table (current_timestamp tb2) = update tb0 x (cons b (tb0 x))) -> past_time (current_timestamp tb2) tb2 ∧ correct tb2 ∧ precede tb tb2 ∧ (let tb0 : Z -> list α := table (current_timestamp tb) in table (current_timestamp tb2) = update tb0 x (cons b (tb0 x))))) else (0%Z ≤ x ∧ x < Z.of_nat (length (buffer tb))) ∧ correct tb ∧ inv tb b = true.
Admitted.
