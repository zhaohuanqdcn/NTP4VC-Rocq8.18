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
Theorem goal77 (a_18 : addr) (a_17 : addr) (t_3 : addr -> Z) (t_2 : addr -> Z) (a : addr) (a_6 : addr) (a_16 : addr) (a_15 : addr) (t_7 : addr -> addr) (a_3 : addr) (a_9 : addr) (a_2 : addr) (a_8 : addr) (t_8 : addr -> addr) (a_1 : addr) (a_7 : addr) (t_4 : addr -> Z) (t_6 : addr -> Z) (i_1 : Z) (i_2 : Z) (a_10 : addr) (a_4 : addr) (a_13 : addr) (a_12 : addr) (a_14 : addr) (i_3 : Z) (i : Z) (t_1 : Z -> Z) (t_5 : addr -> Z) (a_5 : addr) (a_11 : addr) (t : Z -> Z) : let x : Z := base a_18 in let a_19 : addr := shift a_17 7%Z in let x_1 : Z := t_3 a_19 in let x_2 : Z := t_2 (shift a 9%Z) in let x_3 : Z := t_2 (shift a_6 9%Z) in let x_4 : Z := t_2 (shift a_16 9%Z) in let a_20 : addr := shift a_15 0%Z in let a_21 : addr := shift a_18 0%Z in let a_22 : addr := t_7 (shift a_3 4%Z) in let a_23 : addr := t_7 (shift a_9 4%Z) in let a_24 : addr := t_7 (shift a_2 3%Z) in let a_25 : addr := t_7 (shift a_8 3%Z) in let a_26 : addr := shift a_17 6%Z in let a_27 : addr := t_8 a_26 in let a_28 : addr := shift a_27 0%Z in let a_29 : addr := shift (t_7 (shift a_1 5%Z)) 0%Z in let x_5 : Z := 32%Z + x_2 in let a_30 : addr := shift (t_7 (shift a_7 5%Z)) 0%Z in let x_6 : Z := 32%Z + x_3 in let a_31 : addr -> Z := havoc t_4 t_6 a_20 x_1 in let a_32 : addr := shift a_17 0%Z in ¬ i_1 = 0%Z -> ¬ i_2 = 0%Z -> shift a_10 0%Z = shift a_4 0%Z -> base a_13 = base a_12 -> x = base a_14 -> t_2 (shift a_16 8%Z) = 0%Z -> ¬ x_1 = 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_3 -> x_1 ≤ i -> 0%Z ≤ x_1 -> region (base a_10) ≤ 0%Z -> region x ≤ 0%Z -> framed t_7 -> linked t_1 -> sconst t_5 -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> addr_le a_12 a_13 -> addr_le a_18 a_14 -> is_uint32 x_2 -> is_uint32 x_3 -> is_uint32 x_4 -> is_uint32 x_1 -> p_valid_io_file_pvt t_1 t_7 t_2 a_5 -> p_valid_io_file_pvt t_1 t_7 t_2 a_11 -> addr_le a_14 (shift a_18 i_2) -> valid_rw t a_20 x_1 -> valid_rw t_1 a_21 i_2 -> ¬ invalid t_1 a_20 x_1 -> separated a_21 i_2 a_22 11%Z -> separated a_21 i_2 a_23 11%Z -> separated a_21 i_2 a_24 11%Z -> separated a_21 i_2 a_25 11%Z -> separated a_22 11%Z a_24 11%Z -> separated a_23 11%Z a_25 11%Z -> valid_rw t a_28 x_1 -> separated a_21 i_2 a_29 x_5 -> separated a_21 i_2 a_30 x_6 -> separated a_28 x_1 a_20 x_1 -> separated a_22 11%Z a_29 x_5 -> separated a_23 11%Z a_30 x_6 -> separated a_24 11%Z a_29 x_5 -> separated a_25 11%Z a_30 x_6 -> addr_le a_13 (shift a_12 (32%Z + x_4)) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_1 -> a_31 (shift a_27 i_4) = a_31 (shift a_15 i_4)) -> included a_20 x_1 a_26 1%Z ∨ included a_20 x_1 a_19 1%Z ∨ included a_20 x_1 (shift a_32 1%Z) 1%Z ∨ included a_20 x_1 (shift a_32 2%Z) 1%Z.
Proof.
Admitted.
