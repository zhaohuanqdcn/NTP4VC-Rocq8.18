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
Theorem goal0 (t_1 : addr -> Z) (a_4 : addr) (a_5 : addr) (a_6 : addr) (a_7 : addr) (a_8 : addr) (a_9 : addr) (a_2 : addr) (a : addr) (i : Z) (a_10 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (a_1 : addr) (a_3 : addr) : let x : Z := t_1 (shift a_4 10%Z) in let x_1 : Z := t_1 (shift a_5 10%Z) in let x_2 : Z := t_1 (shift a_6 10%Z) in let x_3 : Z := t_1 (shift a_7 10%Z) in let x_4 : Z := t_1 (shift a_8 10%Z) in let x_5 : Z := t_1 (shift a_9 10%Z) in shift a_2 0%Z = shift a 0%Z -> 0%Z ≤ i -> region (base a_2) ≤ 0%Z -> region (base a_10) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 x -> is_uint32 x_1 -> is_uint32 x_2 -> is_uint32 x_3 -> is_uint32 x_4 -> is_uint32 x_5 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> valid_rw t (shift a_10 0%Z) i -> x_3 = 0%Z ∨ x_4 = 1%Z ∨ x_5 = 2%Z ∨ ¬ x = 2%Z ∧ ¬ x_1 = 1%Z ∧ ¬ x_2 = 0%Z.
Admitted.
