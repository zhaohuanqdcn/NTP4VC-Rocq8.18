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
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom space : char.
Axiom newline : char.
Definition at_least_line_length (s : list char) (line_length : Z) := ∀(i : Z) (j : Z), - 1%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> i = - 1%Z ∨ i ≤ 0%Z ∧ nth (Z.to_nat i) s inhabitant = newline -> nth (Z.to_nat j) s inhabitant = newline -> line_length ≤ j - i.
Theorem wrap_lines'vc (s : list char) (line_length : Z) (fact0 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = newline) : let o1 : char := space in (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length s)) ∧ (∀(o2 : Z), o2 = - 1%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> ¬ nth (Z.to_nat i) s inhabitant = o1) ∨ (0%Z ≤ o2 ∧ o2 < Z.of_nat (length s)) ∧ nth (Z.to_nat o2) s inhabitant = o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < o2 -> ¬ nth (Z.to_nat i) s inhabitant = o1) -> ((- 1%Z ≤ - 1%Z ∧ - 1%Z < Z.of_nat (length s)) ∧ (o2 = - 1%Z ∨ (- 1%Z < o2 ∧ o2 < Z.of_nat (length s)) ∧ nth (Z.to_nat o2) s inhabitant = space) ∧ (∀(i : Z), - 1%Z < i ∧ i < o2 -> ¬ nth (Z.to_nat i) s inhabitant = newline) ∧ at_least_line_length s line_length) ∧ (∀(last_sp : Z) (last_nl : Z) (s1 : list char), length s1 = length s -> (- 1%Z ≤ last_nl ∧ last_nl < Z.of_nat (length s1)) ∧ (last_sp = - 1%Z ∨ (last_nl < last_sp ∧ last_sp < Z.of_nat (length s1)) ∧ nth (Z.to_nat last_sp) s1 inhabitant = space) ∧ (∀(i : Z), last_nl < i ∧ i < Z.of_nat (length s1) -> nth (Z.to_nat i) s1 inhabitant = nth (Z.to_nat i) s inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s1) -> ¬ nth (Z.to_nat i) s1 inhabitant = nth (Z.to_nat i) s inhabitant -> nth (Z.to_nat i) s inhabitant = space ∧ nth (Z.to_nat i) s1 inhabitant = newline) ∧ (∀(i : Z), last_nl < i ∧ i < last_sp -> ¬ nth (Z.to_nat i) s1 inhabitant = newline) ∧ at_least_line_length s1 line_length -> (if decide (¬ last_sp = - 1%Z) then if decide (line_length < last_sp - last_nl) then let o3 : char := newline in (0%Z ≤ last_sp ∧ last_sp < Z.of_nat (length s1)) ∧ (length (set_list s1 (Z.to_nat last_sp) o3) = length s1 -> nth_i (set_list s1 (Z.to_nat last_sp) o3) = fun_updt (nth_i s1) last_sp o3 -> (let o4 : Z := last_sp + 1%Z in let o5 : char := space in (0%Z ≤ o4 ∧ o4 ≤ Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3))) ∧ (∀(o6 : Z), o6 = - 1%Z ∧ (∀(i : Z), o4 ≤ i ∧ i < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3)) -> ¬ nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = o5) ∨ (o4 ≤ o6 ∧ o6 < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3))) ∧ nth (Z.to_nat o6) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = o5 ∧ (∀(i : Z), o4 ≤ i ∧ i < o6 -> ¬ nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = o5) -> (0%Z ≤ (if decide (last_sp = - 1%Z) then 0%Z else Z.of_nat (length s1) - last_sp) ∧ (if decide (o6 = - 1%Z) then 0%Z else Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3)) - o6) < (if decide (last_sp = - 1%Z) then 0%Z else Z.of_nat (length s1) - last_sp)) ∧ (- 1%Z ≤ last_sp ∧ last_sp < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3))) ∧ (o6 = - 1%Z ∨ (last_sp < o6 ∧ o6 < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3))) ∧ nth (Z.to_nat o6) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = space) ∧ (∀(i : Z), last_sp < i ∧ i < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3)) -> nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = nth (Z.to_nat i) s inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length (set_list s1 (Z.to_nat last_sp) o3)) -> ¬ nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = nth (Z.to_nat i) s inhabitant -> nth (Z.to_nat i) s inhabitant = space ∧ nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = newline) ∧ (∀(i : Z), last_sp < i ∧ i < o6 -> ¬ nth (Z.to_nat i) (set_list s1 (Z.to_nat last_sp) o3) inhabitant = newline) ∧ at_least_line_length (set_list s1 (Z.to_nat last_sp) o3) line_length))) else let o3 : Z := last_sp + 1%Z in let o4 : char := space in (0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length s1)) ∧ (∀(o5 : Z), o5 = - 1%Z ∧ (∀(i : Z), o3 ≤ i ∧ i < Z.of_nat (length s1) -> ¬ nth (Z.to_nat i) s1 inhabitant = o4) ∨ (o3 ≤ o5 ∧ o5 < Z.of_nat (length s1)) ∧ nth (Z.to_nat o5) s1 inhabitant = o4 ∧ (∀(i : Z), o3 ≤ i ∧ i < o5 -> ¬ nth (Z.to_nat i) s1 inhabitant = o4) -> (0%Z ≤ (if decide (last_sp = - 1%Z) then 0%Z else Z.of_nat (length s1) - last_sp) ∧ (if decide (o5 = - 1%Z) then 0%Z else Z.of_nat (length s1) - o5) < (if decide (last_sp = - 1%Z) then 0%Z else Z.of_nat (length s1) - last_sp)) ∧ (- 1%Z ≤ last_nl ∧ last_nl < Z.of_nat (length s1)) ∧ (o5 = - 1%Z ∨ (last_nl < o5 ∧ o5 < Z.of_nat (length s1)) ∧ nth (Z.to_nat o5) s1 inhabitant = space) ∧ (∀(i : Z), last_nl < i ∧ i < Z.of_nat (length s1) -> nth (Z.to_nat i) s1 inhabitant = nth (Z.to_nat i) s inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s1) -> ¬ nth (Z.to_nat i) s1 inhabitant = nth (Z.to_nat i) s inhabitant -> nth (Z.to_nat i) s inhabitant = space ∧ nth (Z.to_nat i) s1 inhabitant = newline) ∧ (∀(i : Z), last_nl < i ∧ i < o5 -> ¬ nth (Z.to_nat i) s1 inhabitant = newline) ∧ at_least_line_length s1 line_length) else (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s1) -> ¬ nth (Z.to_nat i) s1 inhabitant = nth (Z.to_nat i) s inhabitant -> nth (Z.to_nat i) s inhabitant = space ∧ nth (Z.to_nat i) s1 inhabitant = newline) ∧ at_least_line_length s1 line_length))).
Admitted.
