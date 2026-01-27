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
Program Fixpoint sum (l : list Z) : Z :=
match l with | [] => 0%Z | cons x r => x + sum r end.
Admit Obligations.
Theorem list_sum'vc (l : list Z) : Z.of_nat (length l) ≤ Z.of_nat (length l) ∧ 0%Z + sum l = sum l ∧ (∀(y : Z) (l1 : list Z), Z.of_nat (length l1) ≤ Z.of_nat (length l) ∧ y + sum l1 = sum l -> is_Nil l1 = (l1 = ([] : list Z)) -> (if decide (¬ is_Nil l1) then ¬ l1 = ([] : list Z) ∧ (∀(o1 : Z), Some o1 = hd_error l1 -> ¬ l1 = ([] : list Z) ∧ (∀(o2 : list Z), Some o2 = tl_error l1 -> (match l1 with | [] => False | cons _ f => f = o2 end) ∧ Z.of_nat (length o2) ≤ Z.of_nat (length l) ∧ y + o1 + sum o2 = sum l)) else y = sum l)).
Admitted.
