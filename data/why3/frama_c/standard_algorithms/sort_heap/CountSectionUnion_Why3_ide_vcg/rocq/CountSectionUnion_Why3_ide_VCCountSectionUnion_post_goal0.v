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
Require Import sort_heap.A_Count.A_Count.
Require Import sort_heap.Compound.Compound.
Require Import sort_heap.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (i_2 : Z) (i : Z) (i_4 : Z) (i_1 : Z) (a : addr) (i_3 : Z) (t : addr -> Z) (fact0 : i_2 ≤ i) (fact1 : i_4 ≤ i) (fact2 : i_1 ≤ i_2) (fact3 : i ≤ i_4) (fact4 : i_2 ≤ i_4) (fact5 : region (base a) ≤ 0%Z) (fact6 : is_uint32 i) (fact7 : is_uint32 i_1) (fact8 : is_uint32 i_2) (fact9 : is_uint32 i_4) (fact10 : is_sint32 i_3) (fact11 : ∀(i_5 : Z), is_sint32 i_5 -> l_count_1' t a i_1 i_2 i_5 + l_count_1' t a i_2 i_4 i_5 = l_count_1' t a i_1 i_4 i_5) : l_count_1' t a i_1 i_2 i_3 + l_count_1' t a i_2 i_4 i_3 = l_count_1' t a i_1 i_4 i_3.
Proof.
Admitted.
