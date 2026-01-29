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
Require Import prover.BacktrackArray.Types.
Require Import prover.Functions.Config.
Require Import prover.Functions.Func.
Require Import prover.Predicates.Pred.
Require Import prover.BacktrackArray.Logic.
Require Import prover.Choice.Choice.
Open Scope Z_scope.
Theorem get'vc {α : Type} `{Inhabited α} (tb : t α) (x : Z) (fact0 : correct tb) (fact1 : 0%Z ≤ x) : let o1 : Z := Z.of_nat (length (buffer tb)) in (¬ o1 ≤ x -> 0%Z ≤ x ∧ x < Z.of_nat (length (buffer tb))) ∧ (∀(result : list α), (if decide (o1 ≤ x) then result = ([] : list α) else result = nth (Z.to_nat x) (buffer tb) inhabitant) -> result = table (current_timestamp tb) x ∧ list_forall (inv tb) result).
Proof.
Admitted.
