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
Axiom fc : Z -> color.
Axiom fc1 : Z -> color.
Axiom fc'def : forall  (y0 : Z), fc y0 = Red.
Axiom fc'def1 : forall  (y0 : Z), fc1 y0 = Black.
Theorem colo_3'vc (c : list color) (fact0 : Z.of_nat (length c) = 3%Z) : valid c = (c ∈ ({[create_list 3%nat (fc ∘ Z.of_nat); create_list 3%nat (fc1 ∘ Z.of_nat)]} : gset _)).
Proof.
Admitted.
