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
Definition best (x2 : Z) (y2 : Z) (x : Z) (y : Z) := ∀(y' : Z), Z.abs (x2 * y - x * y2) ≤ Z.abs (x2 * y' - x * y2).
Theorem bresenham'vc (y2 : Z) (x2 : Z) (fact0 : 0%Z ≤ y2) (fact1 : y2 ≤ x2) : let o1 : Z := 2%Z * y2 - x2 in 0%Z ≤ x2 + 1%Z -> (o1 = 2%Z * (0%Z + 1%Z) * y2 - (2%Z * 0%Z + 1%Z) * x2 ∧ 2%Z * (y2 - x2) ≤ o1 ∧ o1 ≤ 2%Z * y2) ∧ (∀(e : Z) (y : Z) (x : Z), (0%Z ≤ x ∧ x ≤ x2) ∧ e = 2%Z * (x + 1%Z) * y2 - (2%Z * y + 1%Z) * x2 ∧ 2%Z * (y2 - x2) ≤ e ∧ e ≤ 2%Z * y2 -> (if decide (e < 0%Z) then e + 2%Z * y2 = 2%Z * (x + 1%Z + 1%Z) * y2 - (2%Z * y + 1%Z) * x2 ∧ 2%Z * (y2 - x2) ≤ e + 2%Z * y2 ∧ e + 2%Z * y2 ≤ 2%Z * y2 else e + 2%Z * (y2 - x2) = 2%Z * (x + 1%Z + 1%Z) * y2 - (2%Z * (y + 1%Z) + 1%Z) * x2 ∧ 2%Z * (y2 - x2) ≤ e + 2%Z * (y2 - x2) ∧ e + 2%Z * (y2 - x2) ≤ 2%Z * y2)).
Admitted.
