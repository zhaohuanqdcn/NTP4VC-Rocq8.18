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
Theorem goal19 (a_3 : addr) (t_1 : addr -> Z) (a : addr) (a_2 : addr) (t_2 : addr -> addr) (t : Z -> Z) (a_1 : addr) : let a_4 : addr := shift a_3 0%Z in let a_5 : addr := shift a_3 7%Z in let x : Z := t_1 a_5 in let a_6 : addr := shift a 8%Z in a_4 = shift a_2 0%Z -> ¬ x = 0%Z -> region (base a_3) ≤ 0%Z -> framed t_2 -> linked t -> is_uint32 x -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> ¬ invalid t a_6 1%Z -> a_6 = a_5 ∨ shift a_3 8%Z = a_6 ∨ shift a_4 1%Z = a_6 ∨ shift a_4 2%Z = a_6.
Admitted.
