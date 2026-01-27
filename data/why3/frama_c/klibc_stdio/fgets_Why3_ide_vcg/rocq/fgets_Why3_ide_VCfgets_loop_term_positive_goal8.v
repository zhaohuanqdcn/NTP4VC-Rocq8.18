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
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal8 (a_2 : addr) (a_14 : addr) (a_15 : addr) (t_2 : addr -> Z) (a_12 : addr) (t_1 : addr -> Z) (a_5 : addr) (a_4 : addr) (a_6 : addr) (a_7 : addr) (a_10 : addr) (t_4 : addr -> Z) (t_6 : addr -> addr) (a_11 : addr) (i_2 : Z) (a : addr) (a_16 : addr) (i : Z) (t : Z -> Z) (t_3 : addr -> Z) (i_1 : Z) (a_1 : addr) (a_3 : addr) (a_13 : addr) (t_5 : addr -> addr) (a_9 : addr) (a_8 : addr) : let a_17 : addr := shift a_2 0%Z in let a_18 : addr := shift a_14 0%Z in let x : Z := base a_15 in let x_1 : Z := t_2 (shift a_12 7%Z) in let x_2 : Z := t_1 (shift a_5 7%Z) in let x_3 : Z := t_2 (shift a_4 7%Z) in let x_4 : Z := t_2 (shift a_6 7%Z) in let x_5 : Z := t_2 (shift a_7 7%Z) in let x_6 : Z := t_2 (shift a_10 7%Z) in let x_7 : Z := t_4 (t_6 (shift a_11 6%Z)) in ¬ i_2 = - 1%Z -> ¬ i_2 = 10%Z -> ¬ a_17 = Mk_addr 0%Z 0%Z -> a_17 = shift a 0%Z -> ¬ a_18 = Mk_addr 0%Z 0%Z -> a_18 = a_17 -> base a_16 = x -> ¬ x_1 = 0%Z -> region (base a_14) ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> framed t_6 -> linked t -> sconst t_3 -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> addr_le a_16 a_15 -> is_uint32 x_2 -> is_uint32 x_3 -> is_uint32 x_4 -> is_uint32 x_5 -> is_uint32 x_6 -> is_uint32 x_1 -> p_valid_io_file_pvt t t_6 t_2 a_1 -> p_valid_io_file_pvt t t_6 t_2 a_3 -> p_valid_io_file_pvt t t_6 t_2 a_13 -> addr_le a_15 (shift a_16 i_1) -> is_sint8 x_7 -> p_valid_file t t_2 a_17 -> (0%Z < x_6 -> x_7 = i_2) -> (0%Z < x_5 -> t_5 (shift a_9 6%Z) = shift (t_6 (shift a_8 6%Z)) 1%Z) -> (0%Z < x_3 -> x_4 = 1%Z + x_2) -> 0%Z ≤ i.
Admitted.
