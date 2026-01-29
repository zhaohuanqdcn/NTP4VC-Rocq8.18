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
Require Import klibc_stdio.Globals.Globals.
Require Import Why3.Cint.Cint.
Require Import klibc_stdio.Axiomatic.Axiomatic.
Require Import klibc_stdio.Axiomatic3.Axiomatic3.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (t_1 : addr -> Z) (a_2 : addr) (a_3 : addr) (t : Z -> Z) (a_5 : addr) (a_6 : addr) (t_3 : addr -> addr) (t_2 : addr -> Z) (i : Z) (i_3 : Z) (i_4 : Z) (i_1 : Z) (i_2 : Z) (a : addr) (a_4 : addr) : let a_7 : addr := shift a_1 0%Z in let x : Z := t_1 (shift a_7 0%Z) in let x_1 : Z := t_1 (shift a_2 10%Z) in let x_2 : Z := t_1 (shift a_3 10%Z) in let m : Z -> Z := fun_updt t 38235%Z 1%Z in ¬ a_7 = Mk_addr 0%Z 0%Z -> t_1 (Mk_addr 38235%Z 0%Z) = 438%Z -> region (base a_5) ≤ 0%Z -> region (base a_6) ≤ 0%Z -> 0%Z ≤ x -> framed t_3 -> linked t -> sconst t_2 -> is_uint32 x_1 -> is_uint32 x_2 -> p_length_of_str_is t t_2 a_5 i -> p_length_of_str_is t t_2 a_5 i_3 -> p_length_of_str_is t t_2 a_5 i_4 -> p_length_of_str_is t t_2 a_6 i_1 -> p_length_of_str_is t t_2 a_6 i_2 -> p_valid_io_file_pvt m t_3 t_1 a -> is_sint32 x -> x_1 = 1%Z ∨ x_2 = 2%Z -> Mk_addr 0%Z 0%Z = a_5 ∨ (∃(i_5 : Z), p_length_of_str_is m t_2 a_5 i_5) -> p_valid_file m t_1 a_7 ∧ p_valid_io_file_pvt m t_3 t_1 a_4.
Proof.
Admitted.
