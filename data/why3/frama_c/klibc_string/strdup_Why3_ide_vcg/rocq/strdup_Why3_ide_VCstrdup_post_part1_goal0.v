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
Require Import Why3.Cint.Cint.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Require Import klibc_string.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (t_2 : addr -> Z) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (i_3 : Z) (t : Z -> Z) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := l_length t_2 a_1 in let x_1 : Z := 1%Z + x in let x_2 : Z := to_uint32 x_1 in let a_2 : addr := shift a 0%Z in let a_3 : addr -> Z := havoc t_1 t_2 a_2 x_2 in let a_4 : addr := shift a_1 0%Z in ¬ Mk_addr 0%Z 0%Z = a -> ¬ x_2 = 0%Z -> 0%Z ≤ i_3 -> region (base a_1) ≤ 0%Z -> i_3 ≤ l_length a_3 a_1 -> linked t -> sconst t_2 -> is_sint32 x -> p_length_of_str_is t t_2 a_1 i -> p_length_of_str_is t t_2 a_1 i_1 -> p_length_of_str_is t t_2 a_1 i_2 -> is_sint32 x_1 -> valid_rw t a_2 x_2 -> valid_rw t a_4 x_2 -> separated a_4 x_2 a_2 x_2 -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_2 -> a_3 (shift a_1 i_4) = a_3 (shift a i_4)) -> a_3 (shift a_1 i_3) = a_3 (shift a i_3).
Proof.
Admitted.
