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
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import verker.A_StrCmp.A_StrCmp.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal15 (a_2 : addr) (a_3 : addr) (t_1 : addr -> Z) (a : addr) (t_2 : addr -> Z) (a_1 : addr) (t : Z -> Z) (i_3 : Z) (i_1 : Z) (i_2 : Z) (i : Z) : let x : Z := offset a_2 in let x_1 : Z := offset a_3 in let x_2 : Z := l_strlen t_1 a_3 in let x_3 : Z := t_1 a in let x_4 : Z := t_1 a_2 in let x_5 : Z := to_uint8 x_4 in let x_6 : Z := x - x_1 in let x_7 : Z := t_2 (shift a_3 x_6) in let x_8 : Z := t_2 (shift a_1 x_6) in let x_9 : Z := to_uint8 (t_2 a) in l_strcmp t_1 a_3 a_1 = l_strcmp t_1 a_2 a -> offset a_1 + x = offset a + x_1 -> x_1 + x_2 = x + l_strlen t_1 a_2 -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint8 i_3 -> is_sint32 i_1 -> addr_le a_1 a -> addr_le a_3 a_2 -> is_sint8 x_3 -> is_sint8 x_4 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> addr_le a (shift a_1 (l_strlen t_1 a_1)) -> addr_le a_2 (shift a_3 x_2) -> (if decide (x_5 = to_uint8 x_3) then i_1 = 0%Z ∧ x_5 = 0%Z else i_2 = i ∧ t_2 = t_1 ∧ to_uint8 (t_2 a_2) = i_3 ∧ ¬ x_7 = x_8 ∧ x_1 ≤ x ∧ x ≤ x_1 + l_strlen t_2 a_3 ∧ (if decide (i_3 < x_9) then i_1 = - 1%Z else i_1 = 1%Z) ∧ (if decide (i_3 < x_9) then i_2 = - 1%Z else i_2 = 1%Z) ∧ (if decide (to_uint8 x_7 < to_uint8 x_8) then i_2 = - 1%Z else i_2 = 1%Z) ∧ (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_1 < x -> t_2 (shift a_3 i_4) = t_2 (shift a_1 i_4))) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 ≤ x_2 -> t_1 (shift a_3 i_4) = t_1 (shift a_1 i_4)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 + x_1 < x -> t_1 (shift a_3 i_4) = t_1 (shift a_1 i_4)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 ≤ x_2 -> to_uint8 (t_1 (shift a_3 i_4)) = to_uint8 (t_1 (shift a_1 i_4))) -> i_1 = 0%Z.
Proof.
Admitted.
