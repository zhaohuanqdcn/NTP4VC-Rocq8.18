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
Require Import Why3.matrix.Matrix.
Open Scope Z_scope.
Inductive direction :=
  | Left_bottom : direction
  | Right_bottom : direction
  | Bottom : direction
  | Right : direction.
Axiom direction_inhabited : Inhabited direction.
Global Existing Instance direction_inhabited.
Axiom direction_countable : Countable direction.
Global Existing Instance direction_countable.
Definition left_diag (m : matrix Z) (i : Z) (j : Z) : option Z := if decide (i < rows m ∧ 0%Z ≤ j ∧ 3%Z ≤ i ∧ j < columns m - 3%Z) then Some (elts m i j * elts m (i - 1%Z) (j + 1%Z) * elts m (i - 2%Z) (j + 2%Z) * elts m (i - 3%Z) (j + 3%Z)) else None.
Definition right_diag (m : matrix Z) (i : Z) (j : Z) : option Z := if decide (i < rows m - 3%Z ∧ 0%Z ≤ i ∧ j < columns m - 3%Z ∧ 0%Z ≤ j) then Some (elts m i j * elts m (i + 1%Z) (j + 1%Z) * elts m (i + 2%Z) (j + 2%Z) * elts m (i + 3%Z) (j + 3%Z)) else None.
Definition line (m : matrix Z) (i : Z) (j : Z) : option Z := if decide ((0%Z ≤ j ∧ j < columns m) ∧ 0%Z ≤ i ∧ i < rows m - 3%Z) then Some (elts m i j * elts m (i + 1%Z) j * elts m (i + 2%Z) j * elts m (i + 3%Z) j) else None.
Definition column (m : matrix Z) (i : Z) (j : Z) : option Z := if decide ((0%Z ≤ i ∧ i < rows m) ∧ 0%Z ≤ j ∧ j < columns m - 3%Z) then Some (elts m i j * elts m i (j + 1%Z) * elts m i (j + 2%Z) * elts m i (j + 3%Z)) else None.
Theorem right_diag_c'vc (i : Z) (m : matrix Z) (j : Z) (o1 : bool) (fact0 : if decide (i < rows m - 3%Z) then if decide (0%Z ≤ i) then if decide (j < columns m - 3%Z) then o1 = (if decide (0%Z ≤ j) then true else false) else o1 = false else o1 = false else o1 = false) : (o1 = true -> valid_index m (i + 3%Z) (j + 3%Z) ∧ valid_index m (i + 2%Z) (j + 2%Z) ∧ valid_index m (i + 1%Z) (j + 1%Z) ∧ valid_index m i j) ∧ (∀(result : option Z), (if decide (o1 = true) then result = Some (elts m i j * elts m (i + 1%Z) (j + 1%Z) * elts m (i + 2%Z) (j + 2%Z) * elts m (i + 3%Z) (j + 3%Z)) else result = None) -> result = right_diag m i j).
Admitted.
