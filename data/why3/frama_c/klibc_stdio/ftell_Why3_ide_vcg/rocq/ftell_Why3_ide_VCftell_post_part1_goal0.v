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
Theorem goal0 (a_2 : addr) (t_1 : addr -> Z) (a_6 : addr) (a_4 : addr) (a_5 : addr) (a : addr) (i : Z) (t_2 : addr -> addr) (t : Z -> Z) (a_1 : addr) (a_3 : addr) : let a_7 : addr := shift a_2 0%Z in let x : Z := t_1 (shift (shift a_6 0%Z) 0%Z) in let x_1 : Z := t_1 (shift a_6 8%Z) in let x_2 : Z := to_sint32 x_1 in let x_3 : Z := t_1 (shift a_6 7%Z) in let x_4 : Z := to_sint32 x_3 in let x_5 : Z := t_1 (shift a_4 7%Z) in let x_6 : Z := t_1 (shift a_5 8%Z) in a_7 = shift a 0%Z -> region (base a_2) ≤ 0%Z -> 0%Z ≤ x -> x_2 ≤ i + x_4 -> framed t_2 -> linked t -> is_sint64 i -> is_uint32 x_5 -> is_uint32 x_3 -> is_uint32 x_6 -> is_uint32 x_1 -> p_valid_io_file_pvt t t_2 t_1 a_1 -> p_valid_io_file_pvt t t_2 t_1 a_3 -> p_valid_file t t_1 a_7 -> is_sint32 x -> is_sint64 (i + x_4 - x_2) -> i = - 1%Z ∨ i ≤ 0%Z ∨ to_sint32 x_6 ≤ i + to_sint32 x_5.
Proof.
Admitted.
