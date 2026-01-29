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
Require Import random_shuffle.Compound.Compound.
Require Import random_shuffle.Axiomatic.Axiomatic.
Require Import random_shuffle.Axiomatic1.Axiomatic1.
Require Import random_shuffle.A_Count.A_Count.
Open Scope Z_scope.
Theorem goal7 (a : addr) (i_2 : Z) (i : Z) (t_1 : addr -> Z) (t_2 : addr -> Z) (i_1 : Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr := shift a i_2 in let a_3 : addr := shift a (to_uint32 (1%Z + i)) in let a_4 : addr -> Z := havoc t_1 t_2 a_1 i_1 in 0%Z < i_1 -> 0%Z < i_2 -> 0%Z ≤ i -> i < i_2 -> i_2 ≤ i_1 -> i_2 < i_1 -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> valid_rw t a_1 i_1 -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> p_unchanged_1' a_4 t_2 a i_2 i_1 -> p_multisetunchanged_1' a_4 t_2 a 0%Z i_2 -> (¬ invalid t a_2 1%Z -> included a_2 1%Z a_1 i_1) ∧ (¬ invalid t a_3 1%Z -> included a_3 1%Z a_1 i_1).
Proof.
Admitted.
