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
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.A_StrCmp.A_StrCmp.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> Z) (a_3 : addr) (a_1 : addr) (a_2 : addr) (a : addr) (t : Z -> Z) (i_3 : Z) (i_1 : Z) (p : bool) (p_1 : bool) (i_2 : Z) (i : Z) : let x : Z := l_strcmp t_1 a_3 a_1 in let x_1 : Z := offset a_2 in let x_2 : Z := offset a_3 in let x_3 : Z := l_strlen t_1 a_3 in let x_4 : Z := x_2 + x_3 in let x_5 : Z := t_1 a in let x_6 : Z := t_1 a_2 in let x_7 : Z := to_uint8 x_6 in let x_8 : Z := to_uint8 x_5 in let x_9 : Z := x_1 - x_2 in let x_10 : Z := t_1 (shift a_3 x_9) in let x_11 : Z := t_1 (shift a_1 x_9) in x = l_strcmp t_1 a_2 a -> offset a_1 + x_1 = offset a + x_2 -> x_4 = x_1 + l_strlen t_1 a_2 -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 ≤ x_3 -> to_uint8 (t_1 (shift a_3 i_4)) = to_uint8 (t_1 (shift a_1 i_4))) = (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 ≤ x_3 -> t_1 (shift a_3 i_4) = t_1 (shift a_1 i_4)) -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint8 i_3 -> is_sint32 i_1 -> addr_le a_1 a -> addr_le a_3 a_2 -> is_sint8 x_5 -> is_sint8 x_6 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> addr_le a (shift a_1 (l_strlen t_1 a_1)) -> addr_le a_2 (shift a_3 x_3) -> (if decide (x_7 = x_8) then i_1 = 0%Z ∧ x_7 = 0%Z else p = false ∧ p_1 = false ∧ i_2 = i ∧ x_7 = i_3 ∧ ¬ x_10 = x_11 ∧ x_2 ≤ x_1 ∧ x_1 ≤ x_4 ∧ (if decide (i_3 < x_8) then i_1 = - 1%Z else i_1 = 1%Z) ∧ (if decide (i_3 < x_8) then i_2 = - 1%Z else i_2 = 1%Z) ∧ (if decide (to_uint8 x_10 < to_uint8 x_11) then i_2 = - 1%Z else i_2 = 1%Z)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_2 < x_1 -> t_1 (shift a_3 i_4) = t_1 (shift a_1 i_4)) -> x = i_1.
Admitted.
