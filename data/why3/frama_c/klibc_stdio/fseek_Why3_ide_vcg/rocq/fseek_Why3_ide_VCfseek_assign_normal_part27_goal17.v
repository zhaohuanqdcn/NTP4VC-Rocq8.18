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
Theorem goal17 (a_2 : addr) (t_1 : addr -> Z) (a_8 : addr) (i_1 : Z) (a : addr) (i : Z) (t_2 : addr -> addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) (a_7 : addr) (a_4 : addr) (a_6 : addr) (a_5 : addr) : let a_9 : addr := shift a_2 0%Z in let x : Z := t_1 (shift a_8 8%Z) in let a_10 : addr := shift a_8 0%Z in let x_1 : Z := t_1 (shift a_10 0%Z) in let a_11 : addr := shift a_10 2%Z in ¬ i_1 = 1%Z -> a_9 = shift a 0%Z -> ¬ x = 0%Z -> 0%Z ≤ i -> region (base a_2) ≤ 0%Z -> 0%Z ≤ x_1 -> framed t_2 -> linked t -> is_sint32 i_1 -> is_sint64 i -> is_uint32 x -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> p_valid_io_file_pvt t t_2 t_1 a_8 -> is_sint32 x_1 -> ¬ invalid t a_11 1%Z -> i_1 = 0%Z ∨ i_1 = 2%Z -> a_11 = shift a_7 7%Z ∨ a_11 = shift a_4 8%Z ∨ a_11 = shift a_9 1%Z ∨ a_11 = shift (shift a_6 0%Z) 1%Z ∨ a_11 = shift a_9 2%Z ∨ a_11 = shift (shift a_5 0%Z) 2%Z.
Admitted.
