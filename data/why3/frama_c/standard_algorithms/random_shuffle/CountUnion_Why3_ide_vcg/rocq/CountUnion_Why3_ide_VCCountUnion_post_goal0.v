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
Require Import random_shuffle.Axiomatic1.Axiomatic1.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (i : Z) (a : addr) (i_2 : Z) (t : addr -> Z) (fact0 : i_1 ≤ i) (fact1 : 0%Z ≤ i_1) (fact2 : region (base a) ≤ 0%Z) (fact3 : is_uint32 i) (fact4 : is_uint32 i_1) (fact5 : is_sint32 i_2) (fact6 : ∀(i_3 : Z), is_sint32 i_3 -> l_count_1' t a 0%Z i_1 i_3 + l_count_1' t a i_1 i i_3 = l_count_1' t a 0%Z i i_3) : l_count_1' t a 0%Z i_1 i_2 + l_count_1' t a i_1 i i_2 = l_count_1' t a 0%Z i i_2.
Proof.
Admitted.
