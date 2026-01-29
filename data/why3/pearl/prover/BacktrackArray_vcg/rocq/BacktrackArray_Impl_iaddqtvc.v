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
Theorem iadd'vc {α : Type} `{Inhabited α} (x : Z) (tb : t α) (b : α) (fact0 : 0%Z ≤ x) (fact1 : x < Z.of_nat (length (buffer tb))) (fact2 : correct tb) (fact3 : inv tb b = true) : let buf : list (list α) := buffer tb in (0%Z ≤ x ∧ x < Z.of_nat (length buf)) ∧ (let o1 : list α := cons b (nth (Z.to_nat x) buf inhabitant) in (0%Z ≤ x ∧ x < Z.of_nat (length buf)) ∧ (length (set_list buf (Z.to_nat x) o1) = length buf -> length (set_list buf (Z.to_nat x) o1) = length (buffer tb) -> nth_i (set_list buf (Z.to_nat x) o1) = fun_updt (nth_i buf) x o1 -> (∀(tb1 : t α), buffer tb1 = buffer (t'mk (history tb) (current_time tb) (set_list buf (Z.to_nat x) o1) (inv tb)) ∧ inv tb1 = inv (t'mk (history tb) (current_time tb) (set_list buf (Z.to_nat x) o1) (inv tb)) -> history tb1 = cons x (history (t'mk (history tb) (current_time tb) (set_list buf (Z.to_nat x) o1) (inv tb))) ∧ current_time tb1 = current_time (t'mk (history tb) (current_time tb) (set_list buf (Z.to_nat x) o1) (inv tb)) + 1%Z -> past_time (current_timestamp tb1) tb1 ∧ correct tb1 ∧ precede tb tb1 ∧ (let tb0 : Z -> list α := table (current_timestamp tb) in table (current_timestamp tb1) = update tb0 x (cons b (tb0 x)))))).
Proof.
Admitted.
