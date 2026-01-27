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
Axiom first_black_tile : list color -> Z.
Axiom first_black_tile'def : forall  (c : list color), if decide (Z.of_nat (length c) = 0%Z) then first_black_tile c = 0%Z else match nth 0%nat c inhabitant with | Black => first_black_tile c = 0%Z | Red => first_black_tile c = 1%Z + first_black_tile (drop 1%nat c) end.
Axiom first_black_tile'spec'2 : forall  (c : list color), 0%Z ≤ first_black_tile c ∧ first_black_tile c ≤ Z.of_nat (length c).
Axiom first_black_tile'spec'1 : forall  (j : Z) (c : list color) (fact0 : 0%Z ≤ j) (fact1 : j < first_black_tile c) (fact2 : first_black_tile c ≤ Z.of_nat (length c)), nth (Z.to_nat j) c inhabitant = Red.
Axiom first_black_tile'spec'0 : forall  (c : list color) (fact0 : first_black_tile c < Z.of_nat (length c)), nth (Z.to_nat (first_black_tile c)) c inhabitant = Black.
Axiom first_black_tile'spec : forall  (c : list color) (fact0 : valid c), first_black_tile c = 0%Z ∨ 3%Z ≤ first_black_tile c.
Axiom addleft : Z -> list color -> list color.
Axiom addleft'def : forall  (nr : Z) (c : list color), if decide (nr ≤ 0%Z) then addleft nr c = cons Black c else addleft nr c = cons Red (addleft (nr - 1%Z) c).
Axiom addleft'spec : forall  (nr : Z) (c : list color) (fact0 : 0%Z ≤ nr), Z.of_nat (length (addleft nr c)) = Z.of_nat (length c) + nr + 1%Z.
Axiom addleft_closure : Z -> list color -> list color.
Axiom addleft_closure_def : forall  (y : Z) (y1 : list color), addleft_closure y y1 = addleft y y1.
Definition mapaddleft (s : gset (list color)) (nr : Z) : gset (list color) := gset_map (addleft_closure nr) s.
Definition reciprocal {β : Type} {α : Type} `{Inhabited β} `{Countable β} `{Inhabited α} `{Countable α} (f : α -> β) (g : β -> α) := ∀(y : α), g (f y) = y.
Definition rmleft (nr : Z) (c : list color) : list color := drop (Z.to_nat (nr + 1%Z)) c.
Axiom fc : Z -> color.
Axiom fc'def : forall  (y0 : Z), fc y0 = Red.
Theorem addleft_result'vc (nr : Z) (c : list color) (fact0 : 0%Z ≤ nr) : addleft nr c = create_list (Z.to_nat nr) (fc ∘ Z.of_nat) ++ cons Black c.
Admitted.
