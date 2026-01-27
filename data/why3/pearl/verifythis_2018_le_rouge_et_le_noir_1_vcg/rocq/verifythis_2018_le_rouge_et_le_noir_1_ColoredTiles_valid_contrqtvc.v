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
Theorem valid_contr'vc (c : list color) (i : Z) (fact0 : valid c) (fact1 : 0%Z ≤ i) (fact2 : i < Z.of_nat (length c)) (fact3 : ¬ tworedneighbors c i) : nth (Z.to_nat i) c inhabitant = Black.
Admitted.
