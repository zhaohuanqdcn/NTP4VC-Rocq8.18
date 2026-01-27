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
Theorem goal184 (a_2 : addr) (t_1 : addr -> Z) (a_1 : addr) (i : Z) (a : addr) (t_4 : addr -> addr) (t_2 : addr -> Z) (t_3 : addr -> Z) (i_4 : Z) (i_2 : Z) (i_5 : Z) (i_1 : Z) (t : Z -> Z) (i_3 : Z) : let x : Z := base a_2 in let x_1 : Z := t_1 (shift a_1 9%Z) in let x_2 : Z := to_uint32 (x_1 - i) in let a_3 : addr := shift a 0%Z in let a_4 : addr := t_4 (shift a_1 5%Z) in let a_5 : addr := shift a_4 i in let a_6 : addr -> Z := havoc t_2 t_3 a_5 x_2 in let a_7 : addr := shift a_1 0%Z in ¬ i = 0%Z -> ¬ i_4 = 0%Z -> x = base a -> t_1 (shift a_1 7%Z) = 0%Z -> ¬ x_2 = 0%Z -> 0%Z ≤ i_2 -> 0%Z ≤ i_4 -> i_2 ≤ i_4 -> 0%Z ≤ i_5 -> i_4 ≤ i_5 -> i < x_1 -> region (base a_1) ≤ 0%Z -> region x ≤ 0%Z -> x_2 ≤ i_4 -> - 1%Z ≤ i_1 -> framed t_4 -> linked t -> sconst t_3 -> is_uint32 i -> is_uint32 i_2 -> is_uint32 i_4 -> is_uint32 i_5 -> is_sint32 i_1 -> is_sint32 i_3 -> addr_le a_2 a -> is_uint32 x_1 -> p_valid_io_file_pvt t t_4 t_1 a_1 -> addr_le a (shift a_2 i_5) -> valid_rw t (shift a_2 0%Z) i_5 -> valid_rw t a_3 x_2 -> valid_rw t a_5 x_2 -> ¬ invalid t a_5 x_2 -> separated a_3 x_2 a_5 x_2 -> (i_1 = - 1%Z -> i_3 = 4%Z ∨ i_3 = 11%Z) -> (∀(i_6 : Z), 0%Z ≤ i_6 -> i_6 < x_2 -> a_6 (shift a_4 (i_6 + i)) = a_6 (shift a i_6)) -> included a_5 x_2 (shift a_1 8%Z) 1%Z ∨ included a_5 x_2 (shift a_7 1%Z) 1%Z ∨ included a_5 x_2 (shift a_7 2%Z) 1%Z.
Admitted.
