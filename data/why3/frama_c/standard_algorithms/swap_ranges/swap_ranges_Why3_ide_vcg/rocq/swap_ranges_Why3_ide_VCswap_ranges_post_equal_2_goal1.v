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
Require Import swap_ranges.Compound.Compound.
Require Import swap_ranges.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal1 (a : addr) (a_1 : addr) (t_2 : addr -> Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr -> Z := havoc t_2 (havoc t_1 t_3 a_2 i) a_3 i in i_1 ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> valid_rw t a_2 i -> valid_rw t a_3 i -> separated a_3 i a_2 i -> p_equalranges_1' a_4 t_3 a i_1 a_1 -> p_equalranges_1' a_4 t_3 a_1 i_1 a -> p_unchanged_1' a_4 t_3 a i_1 i -> p_unchanged_1' a_4 t_3 a_1 i_1 i -> p_equalranges_1' (havoc t_2 (havoc t_1 t_3 a_2 i_1) a_3 i_1) t_3 a i_1 a_1.
Proof.
Admitted.
