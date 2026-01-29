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
Require Import Why3.Memory.Memory.
Require Import klibc_stdio.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal102 (a_18 : addr) (t_2 : addr -> Z) (a_16 : addr) (t_3 : addr -> Z) (a_17 : addr) (a : addr) (a_6 : addr) (t_5 : addr -> addr) (a_3 : addr) (a_9 : addr) (a_2 : addr) (a_8 : addr) (a_1 : addr) (a_7 : addr) (i_1 : Z) (i_2 : Z) (a_10 : addr) (a_4 : addr) (a_13 : addr) (a_12 : addr) (a_14 : addr) (i_3 : Z) (i : Z) (i_4 : Z) (t : Z -> Z) (t_4 : addr -> Z) (a_5 : addr) (a_11 : addr) (t_1 : Z -> Z) (a_15 : addr) : let x : Z := base a_18 in let x_1 : Z := t_2 (shift a_16 8%Z) in let x_2 : Z := t_3 (shift a_17 7%Z) in let x_3 : Z := t_2 (shift a 9%Z) in let x_4 : Z := t_2 (shift a_6 9%Z) in let x_5 : Z := t_2 (shift a_16 9%Z) in let a_19 : addr := shift a_18 0%Z in let a_20 : addr := t_5 (shift a_3 4%Z) in let a_21 : addr := t_5 (shift a_9 4%Z) in let a_22 : addr := t_5 (shift a_2 3%Z) in let a_23 : addr := t_5 (shift a_8 3%Z) in let a_24 : addr := shift (t_5 (shift a_1 5%Z)) 0%Z in let x_6 : Z := 32%Z + x_3 in let a_25 : addr := shift (t_5 (shift a_7 5%Z)) 0%Z in let x_7 : Z := 32%Z + x_4 in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> shift a_10 0%Z = shift a_4 0%Z -> base a_13 = base a_12 -> x = base a_14 -> ¬ x_1 = 0%Z -> ¬ x_2 = 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> x_2 ≤ i -> region (base a_10) ≤ 0%Z -> region x ≤ 0%Z -> - 1%Z ≤ i_4 -> framed t_5 -> linked t -> sconst t_4 -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i_4 -> addr_le a_12 a_13 -> addr_le a_18 a_14 -> is_uint32 x_3 -> is_uint32 x_4 -> is_uint32 x_5 -> is_uint32 x_1 -> is_uint32 x_2 -> p_valid_io_file_pvt t t_5 t_2 a_5 -> p_valid_io_file_pvt t t_5 t_2 a_11 -> p_valid_io_file_pvt t t_5 t_2 a_16 -> addr_le a_14 (shift a_18 i_2) -> valid_rw t a_19 i_2 -> separated a_19 i_2 a_20 11%Z -> separated a_19 i_2 a_21 11%Z -> separated a_19 i_2 a_22 11%Z -> separated a_19 i_2 a_23 11%Z -> separated a_20 11%Z a_22 11%Z -> separated a_21 11%Z a_23 11%Z -> separated a_19 i_2 a_24 x_6 -> separated a_19 i_2 a_25 x_7 -> separated a_20 11%Z a_24 x_6 -> separated a_21 11%Z a_25 x_7 -> separated a_22 11%Z a_24 x_6 -> separated a_23 11%Z a_25 x_7 -> addr_le a_13 (shift a_12 (32%Z + x_5)) -> valid_rw t_1 (shift a_15 0%Z) x_2.
Proof.
Admitted.
