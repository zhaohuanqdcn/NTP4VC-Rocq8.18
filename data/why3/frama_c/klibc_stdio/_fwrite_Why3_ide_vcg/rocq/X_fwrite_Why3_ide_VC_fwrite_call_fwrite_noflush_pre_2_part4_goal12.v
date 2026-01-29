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
Theorem goal12 (i : Z) (i_1 : Z) (a_4 : addr) (a_2 : addr) (a : addr) (t_1 : addr -> Z) (a_5 : addr) (t_2 : addr -> Z) (t_3 : addr -> addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) : let x : Z := i + i_1 in let a_6 : addr := shift a_4 0%Z in ¬ i_1 = 0%Z -> shift a_2 0%Z = shift a 0%Z -> t_1 (shift a_5 10%Z) = 1%Z -> t_2 (shift a_4 (to_uint32 (i_1 - 1%Z))) = 10%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> 0%Z ≤ x -> region (base a_2) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> valid_rw t a_6 x -> (∀(i_2 : Z), i_1 < i_2 -> i_2 ≤ x -> ¬ t_2 (shift a_4 (i_2 - 1%Z)) = 10%Z) -> valid_rw t a_6 i_1.
Proof.
Admitted.
