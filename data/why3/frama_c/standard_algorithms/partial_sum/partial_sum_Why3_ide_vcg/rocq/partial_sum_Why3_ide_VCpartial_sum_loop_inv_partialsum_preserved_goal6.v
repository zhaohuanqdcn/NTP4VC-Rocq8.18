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
Require Import partial_sum.Compound.Compound.
Require Import partial_sum.Axiomatic1.Axiomatic1.
Require Import partial_sum.A_AccumulateAxiomatic.A_AccumulateAxiomatic.
Require Import partial_sum.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (a : addr) (a_1 : addr) (t_2 : addr -> Z) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let x : Z := t_2 a_3 in let a_4 : addr -> Z := havoc t_1 (fun_updt t_2 a_2 x) (shift a 1%Z) (i - 1%Z) in let x_1 : Z := i_1 - 1%Z in let a_5 : Z := a_4 (shift a x_1) in let a_6 : addr := shift a_1 i_1 in let a_7 : Z := a_4 a_6 in let a_8 : addr := shift a (to_uint32 x_1) in let a_9 : Z := a_4 a_8 in let a_10 : Z := a_7 + a_9 in let x_2 : Z := 1%Z + i_1 in let a_11 : addr := shift a i_1 in let a_12 : Z := a_7 + a_5 in a_5 = l_accumulate_1' a_4 a_1 i_1 0%Z -> 0%Z < i -> 0%Z < i_1 -> i_1 ≤ i -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 4294967294%Z -> - 2147483648%Z ≤ a_10 -> a_10 ≤ 2147483647%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x_2 -> is_sint32 x -> valid_rd t a_3 1%Z -> valid_rd t a_3 i -> valid_rd t a_6 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_2 i -> valid_rw t a_11 1%Z -> p_accumulatebounds_1' t_2 a_1 (1%Z + i) 0%Z -> separated a_3 i a_2 i -> valid_rd t a_8 1%Z -> is_sint32 a_7 -> is_sint32 a_5 -> is_sint32 a_9 -> p_unchanged_1' a_4 t_2 a_1 0%Z i -> p_partialsum a_4 a_1 i_1 a -> is_sint32 a_12 -> p_partialsum (fun_updt a_4 a_11 a_12) a_1 x_2 a.
Proof.
Admitted.
