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
Require Import partial_sum_inv.Compound.Compound.
Require Import partial_sum_inv.Axiomatic1.Axiomatic1.
Require Import partial_sum_inv.A_AccumulateAxiomatic.A_AccumulateAxiomatic.
Require Import partial_sum_inv.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal2 (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let a_4 : addr -> Z := havoc t_1 t_2 a_3 i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> valid_rd t a_2 i -> valid_rw t a_3 i -> valid_rw t a_2 i -> p_accumulatebounds_1' t_2 a_1 (1%Z + i) 0%Z -> separated a_2 i a_3 i -> p_unchanged_1' a_4 t_2 a_1 0%Z i -> p_partialsum a_4 a_1 i a -> valid_rd t a_3 i.
Proof.
Admitted.
