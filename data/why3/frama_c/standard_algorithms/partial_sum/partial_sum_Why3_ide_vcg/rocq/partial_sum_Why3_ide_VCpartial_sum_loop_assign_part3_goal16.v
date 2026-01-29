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
Theorem goal16 (a : addr) (a_1 : addr) (t_2 : addr -> Z) (i : Z) (t_1 : addr -> Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let x : Z := t_2 a_3 in let a_4 : addr := shift a 1%Z in let x_1 : Z := i - 1%Z in let a_5 : addr -> Z := havoc t_1 (fun_updt t_2 a_2 x) a_4 x_1 in let x_2 : Z := i_1 - 1%Z in let a_6 : Z := a_5 (shift a x_2) in let a_7 : addr := shift a_1 i_1 in let a_8 : Z := a_5 a_7 in let a_9 : addr := shift a (to_uint32 x_2) in let a_10 : Z := a_5 a_9 in let a_11 : Z := a_8 + a_10 in let a_12 : addr := shift a i_1 in a_6 = l_accumulate_1' a_5 a_1 i_1 0%Z -> 0%Z < i -> 0%Z < i_1 -> i_1 ≤ i -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ 4294967294%Z -> - 2147483648%Z ≤ a_11 -> a_11 ≤ 2147483647%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x -> valid_rd t a_3 1%Z -> valid_rd t a_3 i -> valid_rd t a_7 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_2 i -> valid_rw t a_12 1%Z -> ¬ invalid t a_12 1%Z -> p_accumulatebounds_1' t_2 a_1 (1%Z + i) 0%Z -> separated a_3 i a_2 i -> valid_rd t a_9 1%Z -> is_sint32 a_8 -> is_sint32 a_6 -> is_sint32 a_10 -> p_unchanged_1' a_5 t_2 a_1 0%Z i -> p_partialsum a_5 a_1 i_1 a -> included a_12 1%Z a_4 x_1.
Proof.
Admitted.
