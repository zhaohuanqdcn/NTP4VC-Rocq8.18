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
Theorem goal15 (t_1 : addr -> Z) (a : addr) (a_6 : addr) (a_14 : addr) (t_3 : addr -> addr) (a_3 : addr) (a_9 : addr) (a_2 : addr) (a_8 : addr) (a_1 : addr) (a_7 : addr) (i : Z) (a_10 : addr) (a_4 : addr) (a_13 : addr) (t : Z -> Z) (t_2 : addr -> Z) (a_5 : addr) (a_11 : addr) (a_12 : addr) : let x : Z := t_1 (shift a 9%Z) in let x_1 : Z := t_1 (shift a_6 9%Z) in let a_15 : addr := shift a_14 0%Z in let a_16 : addr := t_3 (shift a_3 4%Z) in let a_17 : addr := t_3 (shift a_9 4%Z) in let a_18 : addr := t_3 (shift a_2 3%Z) in let a_19 : addr := t_3 (shift a_8 3%Z) in let a_20 : addr := shift (t_3 (shift a_1 5%Z)) 0%Z in let x_2 : Z := 32%Z + x in let a_21 : addr := shift (t_3 (shift a_7 5%Z)) 0%Z in let x_3 : Z := 32%Z + x_1 in ¬ i = 0%Z -> shift a_10 0%Z = shift a_4 0%Z -> t_1 (shift a_13 8%Z) = 0%Z -> 0%Z ≤ i -> region (base a_10) ≤ 0%Z -> region (base a_14) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 x -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_5 -> p_valid_io_file_pvt t t_3 t_1 a_11 -> valid_rw t a_15 i -> separated a_15 i a_16 11%Z -> separated a_15 i a_17 11%Z -> separated a_15 i a_18 11%Z -> separated a_15 i a_19 11%Z -> separated a_16 11%Z a_18 11%Z -> separated a_17 11%Z a_19 11%Z -> separated a_15 i a_20 x_2 -> separated a_15 i a_21 x_3 -> separated a_16 11%Z a_20 x_2 -> separated a_17 11%Z a_21 x_3 -> separated a_18 11%Z a_20 x_2 -> separated a_19 11%Z a_21 x_3 -> base (t_3 (shift a_13 6%Z)) = base a_12.
Proof.
Admitted.
