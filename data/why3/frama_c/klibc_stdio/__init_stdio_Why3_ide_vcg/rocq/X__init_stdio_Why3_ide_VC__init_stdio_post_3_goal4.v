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
Require Import klibc_stdio.Compound.Compound.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal4 (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (a_6 : addr) (a_7 : addr) (a_10 : addr) (a_11 : addr) (a_14 : addr) (a_17 : addr) (a_18 : addr) (a_12 : addr) (a_13 : addr) (a_15 : addr) (a_16 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i : Z) (i_1 : Z) (i_2 : Z) (a_1 : addr) (a_5 : addr) (a_9 : addr) (a : addr) (a_4 : addr) (a_8 : addr) : let x : Z := t_1 (shift a_2 10%Z) in let x_1 : Z := t_1 (shift a_3 10%Z) in let x_2 : Z := t_1 (shift a_6 10%Z) in let x_3 : Z := t_1 (shift a_7 10%Z) in let x_4 : Z := t_1 (shift a_10 10%Z) in let x_5 : Z := t_1 (shift a_11 10%Z) in let a_19 : addr := shift a_14 0%Z in let x_6 : Z := t_1 a_19 in let a_20 : addr := shift a_17 0%Z in let x_7 : Z := t_1 a_20 in let a_21 : addr := shift a_18 0%Z in let x_8 : Z := t_1 a_21 in let m : addr -> Z := fun_updt t_1 (shift a_12 10%Z) 0%Z in let x_9 : Z := m a_19 in region (base a_13) ≤ 0%Z -> region (base a_15) ≤ 0%Z -> region (base a_16) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> is_sint32 i_1 -> is_sint32 i_2 -> valid_rw t a_13 3%Z -> valid_rw t a_15 3%Z -> valid_rw t a_16 3%Z -> is_uint32 x -> is_uint32 x_1 -> is_uint32 x_2 -> is_uint32 x_3 -> is_uint32 x_4 -> is_uint32 x_5 -> is_sint32 x_6 -> is_sint32 x_7 -> is_sint32 x_8 -> is_sint32 x_9 -> is_sint32 (m a_20) -> is_sint32 (m a_21) -> (Mk_addr 0%Z 0%Z = a_17 -> i = 12%Z) -> (Mk_addr 0%Z 0%Z = a_18 -> i_1 = 12%Z) -> (Mk_addr 0%Z 0%Z = a_14 -> i_2 = 12%Z) -> (¬ Mk_addr 0%Z 0%Z = a_17 -> shift a_1 0%Z = a_17) -> (¬ Mk_addr 0%Z 0%Z = a_14 -> shift a_5 0%Z = a_14) -> (¬ Mk_addr 0%Z 0%Z = a_18 -> shift a_9 0%Z = a_18) -> (¬ Mk_addr 0%Z 0%Z = a_14 -> x_6 = 1%Z) -> (¬ Mk_addr 0%Z 0%Z = a_17 -> x_7 = 0%Z) -> (¬ Mk_addr 0%Z 0%Z = a_18 -> x_8 = 2%Z) -> (¬ Mk_addr 0%Z 0%Z = a_17 -> p_valid_io_file_pvt t t_3 t_1 a) -> (¬ Mk_addr 0%Z 0%Z = a_14 -> p_valid_io_file_pvt t t_3 t_1 a_4) -> (¬ Mk_addr 0%Z 0%Z = a_18 -> p_valid_io_file_pvt t t_3 t_1 a_8) -> (¬ Mk_addr 0%Z 0%Z = a_17 -> x = 1%Z ∨ x_1 = 2%Z) -> (¬ Mk_addr 0%Z 0%Z = a_14 -> x_2 = 1%Z ∨ x_3 = 2%Z) -> (¬ Mk_addr 0%Z 0%Z = a_18 -> x_4 = 1%Z ∨ x_5 = 2%Z) -> x_9 = 1%Z.
Admitted.
