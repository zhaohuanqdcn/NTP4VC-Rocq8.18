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
Require Import klibc_string.Compound.Compound.
Require Import klibc_string.A_Length.A_Length.
Require Import klibc_string.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal12 (a_1 : addr) (t_1 : addr -> Z) (a : addr) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 0%Z in let x : Z := l_length t_1 a in let x_1 : Z := 1%Z + x in ¬ a_1 = a -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i ≤ 2000%Z -> i_1 ≤ 2000%Z -> linked t -> sconst t_1 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> p_length_of_str_is t t_1 a i -> p_length_of_str_is t t_1 a i_1 -> valid_rw t a_2 x_1 -> separated (shift a 0%Z) x_1 a_2 x_1 -> addr_le a (shift a x).
Proof.
Admitted.
