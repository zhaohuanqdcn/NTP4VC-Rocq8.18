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
Open Scope Z_scope.
Inductive color :=
  | Red : color
  | Black : color.
Axiom color_inhabited : Inhabited color.
Global Existing Instance color_inhabited.
Axiom color_countable : Countable color.
Global Existing Instance color_countable.
Axiom coloring : Type.
Axiom coloring_inhabited : Inhabited coloring.
Global Existing Instance coloring_inhabited.
Axiom coloring_countable : Countable coloring.
Global Existing Instance coloring_countable.
Definition tworedneighbors (c : list color) (i : Z) := nth (Z.to_nat (i - 2%Z)) c inhabitant = Red ∧ nth (Z.to_nat (i - 1%Z)) c inhabitant = Red ∧ 2%Z ≤ i ∨ nth (Z.to_nat (i - 1%Z)) c inhabitant = Red ∧ nth (Z.to_nat (i + 1%Z)) c inhabitant = Red ∧ 1%Z ≤ i ∧ i ≤ Z.of_nat (length c) - 2%Z ∨ nth (Z.to_nat (i + 1%Z)) c inhabitant = Red ∧ nth (Z.to_nat (i + 2%Z)) c inhabitant = Red ∧ i ≤ Z.of_nat (length c) - 3%Z.
Definition valid (c : list color) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length c) -> nth (Z.to_nat i) c inhabitant = Red -> tworedneighbors c i.
Theorem first_black_tile'vc (c : list color) : let o1 : Z := Z.of_nat (length c) in (¬ o1 = 0%Z -> (match nth 0%nat c inhabitant with | Black => True | Red => (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length c)) ∧ 0%Z ≤ Z.of_nat (length c) ∧ Z.of_nat (length (drop 1%nat c)) < Z.of_nat (length c) end)) ∧ (∀(result : Z), (if decide (o1 = 0%Z) then result = 0%Z else match nth 0%nat c inhabitant with | Black => result = 0%Z | Red => (let o2 : list color := drop 1%nat c in ∃(r : Z), ((0%Z ≤ r ∧ r ≤ Z.of_nat (length o2)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < r ∧ r ≤ Z.of_nat (length o2) -> nth (Z.to_nat j) o2 inhabitant = Red) ∧ (r < Z.of_nat (length o2) -> nth (Z.to_nat r) o2 inhabitant = Black) ∧ (valid o2 -> r = 0%Z ∨ 3%Z ≤ r)) ∧ result = 1%Z + r) end) -> (0%Z ≤ result ∧ result ≤ Z.of_nat (length c)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < result ∧ result ≤ Z.of_nat (length c) -> nth (Z.to_nat j) c inhabitant = Red) ∧ (result < Z.of_nat (length c) -> nth (Z.to_nat result) c inhabitant = Black) ∧ (valid c -> result = 0%Z ∨ 3%Z ≤ result)).
Proof.
Admitted.
