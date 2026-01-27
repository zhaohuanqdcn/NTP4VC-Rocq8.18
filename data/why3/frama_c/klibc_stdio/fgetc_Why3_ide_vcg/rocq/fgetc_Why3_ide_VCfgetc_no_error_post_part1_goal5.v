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
Theorem goal5 (a_2 : addr) (a_7 : addr) (t_1 : addr -> Z) (a_4 : addr) (a_6 : addr) (t_2 : addr -> Z) (t_3 : addr -> addr) (a_5 : addr) (a : addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) : let a_8 : addr := shift a_2 0%Z in let a_9 : addr := shift a_7 7%Z in let x : Z := t_1 a_9 in let x_1 : Z := t_1 (shift a_4 7%Z) in let x_2 : Z := t_1 (shift a_6 7%Z) in let x_3 : Z := t_2 (t_3 (shift a_7 6%Z)) in let x_4 : Z := fun_updt t_1 a_9 (to_uint32 (x - 1%Z)) (shift a_5 7%Z) in ¬ a_8 = Mk_addr 0%Z 0%Z -> a_8 = shift a 0%Z -> ¬ x = 0%Z -> 0%Z < x_1 -> region (base a_2) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 x_1 -> is_uint32 x_2 -> is_uint32 x -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> is_sint8 x_3 -> is_sint32 x_3 -> is_uint32 x_4 -> x_2 = 1%Z + x_4.
Admitted.
