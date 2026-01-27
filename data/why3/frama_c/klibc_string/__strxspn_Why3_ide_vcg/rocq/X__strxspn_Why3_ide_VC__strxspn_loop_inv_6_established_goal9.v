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
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Open Scope Z_scope.
Theorem goal9 (t_1 : Z -> Z) (i_5 : Z) (a : addr) (a_1 : addr) (t_2 : Z -> Z) (t_3 : addr -> Z) (i : Z) (i_1 : Z) (i_3 : Z) (i_2 : Z) (i_4 : Z) (t : Z -> Z) : let x : Z := t_1 i_5 in 0%Z ≤ i_5 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_5 ≤ 255%Z -> linked t_2 -> sconst t_3 -> is_sint32 i -> is_sint8 (t_3 a_1) -> p_length_of_str_is t_2 t_3 a i_1 -> p_length_of_str_is t_2 t_3 a i_3 -> p_length_of_str_is t_2 t_3 a_1 i_2 -> p_length_of_str_is t_2 t_3 a_1 i_4 -> separated (shift a 0%Z) (1%Z + l_length t_3 a) (shift a_1 0%Z) (1%Z + l_length t_3 a_1) -> i = 0%Z ∨ i = 1%Z -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 ≤ 255%Z -> t_1 i_6 = 0%Z) -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 ≤ 255%Z -> i_6 < 0%Z ∨ 256%Z ≤ i_6 -> t_1 i_6 = t i_6) -> x = 0%Z ∨ x = 1%Z.
Admitted.
