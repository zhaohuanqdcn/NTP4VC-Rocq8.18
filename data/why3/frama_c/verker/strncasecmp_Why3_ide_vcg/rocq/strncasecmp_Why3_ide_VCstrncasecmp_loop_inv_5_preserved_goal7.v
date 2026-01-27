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
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal7 (t_2 : addr -> Z) (a : addr) (a_1 : addr) (a_2 : addr) (i_2 : Z) (a_3 : addr) (t : Z -> Z) (i_4 : Z) (i_5 : Z) (i : Z) (i_1 : Z) (i_3 : Z) (t_3 : addr -> Z) (t_1 : Z -> Z) : let x : Z := t_2 a in let x_1 : Z := to_uint8 x in let x_2 : Z := t_2 a_1 in let x_3 : Z := to_uint8 x_2 in let x_4 : Z := offset a_2 in let x_5 : Z := offset a in let x_7 : Z := to_uint64 (i_2 + x_4 - 1%Z - x_5) in let x_8 : Z := i_2 + x_4 - x_5 in let x_9 : Z := l_strnlen t_2 a_2 i_2 in let x_10 : Z := l_strnlen t_2 a_3 i_2 in let x_11 : Z := i_2 + x_4 in ¬ i_2 = 0%Z -> ¬ x_1 = 0%Z -> ¬ x_3 = 0%Z -> offset a_1 + x_4 = x_5 + offset a_3 -> ¬ x_7 = 0%Z -> x_4 + l_strnlen t_2 a x_8 = x_5 + x_9 -> x_4 + l_strnlen t_2 a_1 x_8 = x_5 + x_10 -> x_4 ≤ x_5 -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x_5 ≤ x_11 -> linked t -> sconst t_2 -> is_uint8 i_4 -> is_uint8 i_5 -> is_sint8 i -> is_sint8 i_1 -> is_uint64 i_2 -> is_uint64 i_3 -> addr_le a_2 a -> addr_le a_3 a_1 -> is_sint8 x -> is_sint8 x_2 -> p_valid_strn t t_2 a_2 i_2 -> p_valid_strn t t_2 a_3 i_2 -> is_uint64 x_8 -> addr_le a (shift a_2 x_9) -> addr_le a_1 (shift a_3 x_10) -> p_valid_strn t t_2 a x_8 -> p_valid_strn t t_2 a_1 x_8 -> (if decide (x_3 = x_1) then t_3 = t_2 ∧ t_1 = t else i_5 = i_4 ∧ to_uint8 i = i_5 ∧ to_uint8 i_1 = i_5 ∧ l_tolower x = i ∧ l_tolower x_2 = i_1 ∧ i_3 + x_5 = x_11) -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 + x_4 < x_5 -> l_tolower (t_2 (shift a_3 i_6)) = l_tolower (t_2 (shift a_2 i_6))) -> p_valid_strn t_1 t_3 (shift a 1%Z) x_7 ∧ p_valid_strn t_1 t_3 (shift a_1 1%Z) x_7.
Admitted.
