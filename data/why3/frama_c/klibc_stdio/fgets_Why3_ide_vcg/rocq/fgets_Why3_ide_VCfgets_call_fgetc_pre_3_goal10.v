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
Theorem goal10 (a_2 : addr) (a_5 : addr) (a : addr) (a_6 : addr) (i : Z) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (i_1 : Z) (t_1 : addr -> Z) (a_1 : addr) (a_3 : addr) (a_4 : addr) : let a_7 : addr := shift a_2 0%Z in let x : Z := base a_5 in ¬ a_7 = Mk_addr 0%Z 0%Z -> a_7 = shift a 0%Z -> base a_6 = x -> region (base a_2) ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> framed t_3 -> linked t -> sconst t_2 -> is_sint32 i -> is_sint32 i_1 -> addr_le a_6 a_5 -> p_valid_io_file_pvt t t_3 t_1 a_1 -> p_valid_io_file_pvt t t_3 t_1 a_3 -> addr_le a_5 (shift a_6 i_1) -> p_valid_file t t_1 a_7 -> p_valid_io_file_pvt t t_3 t_1 a_4.
Proof.
Admitted.
