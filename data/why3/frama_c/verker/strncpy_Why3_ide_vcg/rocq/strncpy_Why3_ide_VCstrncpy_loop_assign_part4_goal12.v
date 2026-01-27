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
Theorem goal12 (a_3 : addr) (a_2 : addr) (i : Z) (a : addr) (t_3 : addr -> Z) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (t : Z -> Z) : let x : Z := base a_3 in let x_1 : Z := base a_2 in let x_2 : Z := offset a_3 in let x_3 : Z := i + x_2 in let x_4 : Z := offset a in let a_4 : addr := shift a_3 0%Z in let x_6 : Z := i + x_2 - x_4 in let x_7 : Z := t_3 a_1 in ¬ x = x_1 -> ¬ x_3 = x_4 -> havoc t_1 t_2 a_4 (1%Z + l_strnlen t_3 a_2 x_6) = t_3 -> x_2 ≤ x_4 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> x_4 ≤ x_3 -> linked t -> sconst t_2 -> is_uint64 i -> addr_le a_2 a_1 -> addr_le a_3 a -> is_sint8 x_7 -> ¬ invalid t a 1%Z -> p_valid_str t t_2 a_2 -> p_valid_str t t_3 a_1 -> p_valid_strn t t_2 a_2 i -> addr_le a (shift a_3 i) -> is_uint64 x_6 -> addr_le a_1 (shift a_2 (l_strnlen t_3 a_2 i)) -> valid_rw t a_4 (1%Z + l_strnlen t_2 a_2 i) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 + offset a_2 < offset a_1 -> t_3 (shift a_3 i_1) = t_3 (shift a_2 i_1)) -> included a 1%Z a_4 (1%Z + l_strnlen (fun_updt t_3 a x_7) a_2 (to_uint64 (i + x_2 - 1%Z - x_4))).
Admitted.
