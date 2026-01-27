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
Theorem goal102 (a_3 : addr) (t_1 : addr -> Z) (a_2 : addr) (a_1 : addr) (i_2 : Z) (a : addr) (i_1 : Z) (i_3 : Z) (i : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) : let x : Z := base a_3 in let x_1 : Z := t_1 (shift a_2 9%Z) in let a_4 : addr := shift a_2 0%Z in let x_2 : Z := t_1 (shift a_4 0%Z) in let a_5 : addr := shift a_4 1%Z in let a_6 : addr := shift a_1 0%Z in ¬ i_2 = 0%Z -> x = base a -> t_1 (shift a_2 7%Z) = 0%Z -> 0%Z ≤ i_1 -> 0%Z ≤ i_2 -> i_1 ≤ i_2 -> 0%Z ≤ i_3 -> i_2 ≤ i_3 -> 0%Z < x_1 -> x_1 ≤ i_2 -> region (base a_2) ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_2 -> - 1%Z ≤ i -> - 1%Z ≤ i_2 -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i -> addr_le a_3 a -> is_uint32 x_1 -> p_valid_io_file_pvt t t_3 t_1 a_2 -> addr_le a (shift a_3 i_3) -> valid_rw t (shift a 0%Z) i_2 -> valid_rw t (shift a_3 0%Z) i_3 -> is_sint32 x_2 -> ¬ invalid t a_5 1%Z -> a_5 = shift a_1 8%Z ∨ a_5 = shift a_6 1%Z ∨ shift a_6 2%Z = a_5.
Admitted.
