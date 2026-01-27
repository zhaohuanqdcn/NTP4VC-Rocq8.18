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
Theorem goal33 (a_2 : addr) (t_1 : addr -> Z) (a_1 : addr) (i_4 : Z) (i_7 : Z) (a : addr) (i_5 : Z) (i_8 : Z) (i_3 : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i_6 : Z) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := base a_2 in let x_1 : Z := t_1 (shift a_1 7%Z) in let x_2 : Z := t_1 (shift a_1 9%Z) in let a_3 : addr := shift a_1 0%Z in let x_3 : Z := t_1 (shift a_3 0%Z) in ¬ i_4 = - 1%Z -> ¬ i_4 = 0%Z -> ¬ i_7 = 0%Z -> x = base a -> ¬ x_1 = 0%Z -> 0%Z ≤ i_5 -> 0%Z ≤ i_7 -> i_4 ≤ i_7 -> i_5 ≤ i_7 -> 0%Z ≤ i_8 -> i_7 ≤ i_8 -> x_2 ≤ i_7 -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_3 -> - 1%Z ≤ i_3 -> - 1%Z ≤ i_4 -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i_5 -> is_uint32 i_7 -> is_uint32 i_8 -> is_sint32 i_3 -> is_sint32 i_4 -> is_sint32 i_6 -> addr_le a_2 a -> is_uint32 x_2 -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> addr_le a (shift a_2 i_8) -> valid_rw t (shift a 0%Z) i_7 -> valid_rw t (shift a_2 0%Z) i_8 -> is_sint32 x_3 -> p_valid_io_file_pvt t t_3 (fun_updt (fun_updt (fun_updt t_1 (shift a_1 8%Z) i) (shift a_3 1%Z) i_1) (shift a_3 2%Z) i_2) a_1 -> (i_3 = - 1%Z -> i_6 = 4%Z ∨ i_6 = 11%Z) -> addr_le a_2 (shift a i_4).
Admitted.
