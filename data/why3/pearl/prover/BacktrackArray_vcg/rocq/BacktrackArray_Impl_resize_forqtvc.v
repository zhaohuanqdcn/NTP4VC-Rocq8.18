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
Theorem resize_for'vc {α : Type} `{Inhabited α} (tb : t α) (x : Z) (fact0 : correct tb) (fact1 : Z.of_nat (length (buffer tb)) ≤ x) : let o1 : list (list α) := buffer tb in ∀(o2 : list (list α)), length o2 = length o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o2) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat i) o1 inhabitant) -> (let tbc : t α := t'mk (history tb) (current_time tb) o2 (inv tb) in (∀(tbc1 : t α) (tb1 : t α), inv tbc1 = inv tb -> inv tb1 = inv tb -> (0%Z < Z.of_nat (length (buffer tbc1)) ∧ Z.of_nat (length (buffer tbc1)) ≤ x) ∧ correct tbc1 ∧ history tbc1 = history tb1 ∧ current_time tbc1 = current_time tb1 ∧ func_of_array (buffer tbc1) ([] : list α) = func_of_array (buffer tb1) ([] : list α) -> (∀(tb2 : t α), buffer tb2 = buffer tb1 ∧ inv tb2 = inv tb1 -> history tb2 = cons (- 1%Z) (history tb1) ∧ current_time tb2 = current_time tb1 + 1%Z -> (∀(tbc2 : t α), buffer tbc2 = buffer tbc1 ∧ inv tbc2 = inv tbc1 -> history tbc2 = cons (- 1%Z) (history tbc1) ∧ current_time tbc2 = current_time tbc1 + 1%Z -> (let size2 : Z := 2%Z * Z.of_nat (length (buffer tbc1)) in 0%Z ≤ size2 ∧ (∀(buf2 : list (list α)), (∀(i : Z), 0%Z ≤ i ∧ i < size2 -> nth (Z.to_nat i) buf2 inhabitant = ([] : list α)) ∧ Z.of_nat (length buf2) = size2 -> (let buf1 : list (list α) := buffer tbc2 in ((0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length (buffer tbc1)) ∧ 0%Z + Z.of_nat (length (buffer tbc1)) ≤ Z.of_nat (length buf1)) ∧ 0%Z ≤ 0%Z ∧ 0%Z + Z.of_nat (length (buffer tbc1)) ≤ Z.of_nat (length buf2)) ∧ (∀(buf21 : list (list α)), length buf21 = length buf2 -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + Z.of_nat (length (buffer tbc1)) ≤ i ∧ i < Z.of_nat (length buf21) -> nth (Z.to_nat i) buf21 inhabitant = nth (Z.to_nat i) buf2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + Z.of_nat (length (buffer tbc1)) -> nth (Z.to_nat i) buf21 inhabitant = nth (Z.to_nat (0%Z + i - 0%Z)) buf1 inhabitant) -> (∀(tbc3 : t α), history tbc3 = history tbc2 ∧ current_time tbc3 = current_time tbc2 ∧ buffer tbc3 = buf21 ∧ inv tbc3 = inv tbc2 -> (if decide (x < size2) then correct tbc3 ∧ (history tbc3 = history tb2 ∧ current_time tbc3 = current_time tb2 ∧ func_of_array (buffer tbc3) ([] : list α) = func_of_array (buffer tb2) ([] : list α)) ∧ Z.of_nat (length (buffer tbc3)) = size2 ∧ x < size2 ∧ Z.of_nat (length (buffer tbc1)) ≤ size2 ∧ precede tbc1 tbc3 else ((0%Z ≤ x - Z.of_nat (length (buffer tbc1)) ∧ x - size2 < x - Z.of_nat (length (buffer tbc1))) ∧ (0%Z < size2 ∧ size2 ≤ x) ∧ correct tbc3 ∧ (history tbc3 = history tb2 ∧ current_time tbc3 = current_time tb2 ∧ func_of_array (buffer tbc3) ([] : list α) = func_of_array (buffer tb2) ([] : list α)) ∧ Z.of_nat (length (buffer tbc3)) = size2) ∧ (∀(tbc4 : t α) (tb3 : t α), inv tbc4 = inv tbc3 -> buffer tb3 = buffer tb2 ∧ inv tb3 = inv tb2 -> correct tbc4 ∧ (history tbc4 = history tb3 ∧ current_time tbc4 = current_time tb3 ∧ func_of_array (buffer tbc4) ([] : list α) = func_of_array (buffer tb3) ([] : list α)) ∧ x < Z.of_nat (length (buffer tbc4)) ∧ size2 ≤ Z.of_nat (length (buffer tbc4)) ∧ precede tbc3 tbc4 -> correct tbc4 ∧ (history tbc4 = history tb3 ∧ current_time tbc4 = current_time tb3 ∧ func_of_array (buffer tbc4) ([] : list α) = func_of_array (buffer tb3) ([] : list α)) ∧ x < Z.of_nat (length (buffer tbc4)) ∧ Z.of_nat (length (buffer tbc1)) ≤ Z.of_nat (length (buffer tbc4)) ∧ precede tbc1 tbc4)))))))))) ∧ (let len : Z := Z.of_nat (length (buffer tb)) in ((0%Z < len ∧ len ≤ x) ∧ correct tbc ∧ func_of_array o2 ([] : list α) = func_of_array (buffer tb) ([] : list α) ∧ Z.of_nat (length o2) = len) ∧ (∀(tbc1 : t α) (tb1 : t α), inv tbc1 = inv tb -> buffer tb1 = buffer tb ∧ inv tb1 = inv tb -> correct tbc1 ∧ (history tbc1 = history tb1 ∧ current_time tbc1 = current_time tb1 ∧ func_of_array (buffer tbc1) ([] : list α) = func_of_array (buffer tb1) ([] : list α)) ∧ x < Z.of_nat (length (buffer tbc1)) ∧ len ≤ Z.of_nat (length (buffer tbc1)) ∧ precede tbc tbc1 -> 0%Z ≤ Z.of_nat (length (buffer tbc1)) ∧ (∀(buf2 : list (list α)), (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (buffer tbc1)) -> nth (Z.to_nat i) buf2 inhabitant = ([] : list α)) ∧ length buf2 = length (buffer tbc1) -> (let buf1 : list (list α) := buffer tb1 in ((0%Z ≤ 0%Z ∧ 0%Z ≤ len ∧ 0%Z + len ≤ Z.of_nat (length buf1)) ∧ 0%Z ≤ 0%Z ∧ 0%Z + len ≤ Z.of_nat (length buf2)) ∧ (∀(buf21 : list (list α)), length buf21 = length buf2 -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + len ≤ i ∧ i < Z.of_nat (length buf21) -> nth (Z.to_nat i) buf21 inhabitant = nth (Z.to_nat i) buf2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + len -> nth (Z.to_nat i) buf21 inhabitant = nth (Z.to_nat (0%Z + i - 0%Z)) buf1 inhabitant) -> (∀(tb2 : t α), history tb2 = history tb1 ∧ current_time tb2 = current_time tb1 ∧ buffer tb2 = buf21 ∧ inv tb2 = inv tb1 -> x < Z.of_nat (length (buffer tb2)) ∧ precede tb tb2 ∧ correct tb2 ∧ table (current_timestamp tb2) = table (current_timestamp tb)))))))).
Admitted.
