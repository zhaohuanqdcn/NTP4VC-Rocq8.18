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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal9 (a_4 : addr) (a_3 : addr) (i_1 : Z) (a : addr) (t_3 : addr -> Z) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (a_2 : addr) (t : Z -> Z) : let x : Z := base a_4 in let x_1 : Z := base a_3 in let x_2 : Z := offset a_4 in let x_3 : Z := i_1 + x_2 in let x_4 : Z := offset a in let a_5 : addr := shift a_4 0%Z in let x_5 : Z := i_1 + x_2 - x_4 in let x_6 : Z := offset a_3 in let x_7 : Z := t_3 a_1 in let m : addr -> Z := fun_updt t_3 a x_7 in ¬ x = x_1 -> ¬ x_3 = x_4 -> havoc t_1 t_2 a_5 (1%Z + l_strnlen t_3 a_3 x_5) = t_3 -> 0%Z ≤ i -> x_2 ≤ x_4 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> i + x_6 < offset a_2 -> x_4 ≤ x_3 -> linked t -> sconst t_2 -> is_uint64 i_1 -> addr_le a_3 a_1 -> addr_le a_4 a -> is_sint8 x_7 -> p_valid_str t t_2 a_3 -> p_valid_str t t_3 a_1 -> p_valid_strn t t_2 a_3 i_1 -> addr_le a (shift a_4 i_1) -> is_uint64 x_5 -> addr_le a_1 (shift a_3 (l_strnlen t_3 a_3 i_1)) -> valid_rw t a_5 (1%Z + l_strnlen t_2 a_3 i_1) -> (if decide (x_7 = 0%Z) then a_2 = a_1 else shift a_1 1%Z = a_2) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x_6 < offset a_1 -> t_3 (shift a_4 i_2) = t_3 (shift a_3 i_2)) -> m (shift a_4 i) = m (shift a_3 i).
Admitted.
