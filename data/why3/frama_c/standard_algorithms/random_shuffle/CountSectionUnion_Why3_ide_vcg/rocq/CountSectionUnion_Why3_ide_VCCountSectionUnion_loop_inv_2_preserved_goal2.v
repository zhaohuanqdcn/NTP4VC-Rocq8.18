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
Require Import random_shuffle.A_Count.A_Count.
Require Import random_shuffle.Compound.Compound.
Require Import random_shuffle.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal2 (i_3 : Z) (i_1 : Z) (i : Z) (i_2 : Z) (a : addr) (i_4 : Z) (t : addr -> Z) : let x : Z := to_uint32 (1%Z + i_3) in i_1 ≤ i -> i_3 ≤ i -> i_2 ≤ i_1 -> i_3 < i -> i_1 ≤ i_3 -> region (base a) ≤ 0%Z -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i_4 -> (∀(i_5 : Z), is_sint32 i_5 -> l_count_1' t a i_1 i_3 i_5 + l_count_1' t a i_2 i_1 i_5 = l_count_1' t a i_2 i_3 i_5) -> l_count_1' t a i_2 i_1 i_4 + l_count_1' t a i_1 x i_4 = l_count_1' t a i_2 x i_4.
Proof.
Admitted.
