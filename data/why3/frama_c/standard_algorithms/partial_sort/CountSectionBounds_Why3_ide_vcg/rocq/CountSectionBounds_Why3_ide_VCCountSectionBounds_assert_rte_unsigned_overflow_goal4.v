From Stdlib Require Import Strings.String.
From Stdlib Require Import String Ascii.
From Stdlib Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Stdlib Require Classical.
From Stdlib Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Stdlib Require Import Sorting.Sorted.
From Stdlib Require Import Reals.Rbasic_fun.
From Stdlib Require Import Reals.Abstract.ConstructiveAbs.
From Stdlib Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Stdlib Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Stdlib Require Import ZArith.Zeuclid.
From Stdlib Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Stdlib Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import partial_sort.A_Count.A_Count.
Require Import partial_sort.Compound.Compound.
Require Import partial_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (i_1 : Z) (i : Z) (i_2 : Z) (a : addr) (t : addr -> Z) (fact0 : i_1 ≤ i) (fact1 : i_2 ≤ i) (fact2 : i_2 < i) (fact3 : i_1 ≤ i_2) (fact4 : region (base a) ≤ 0%Z) (fact5 : is_uint32 i) (fact6 : is_uint32 i_1) (fact7 : is_uint32 i_2) (fact8 : ∀(i_3 : Z), let x : Z := l_count_1' t a i_1 i_2 i_3 in is_sint32 i_3 -> 0%Z ≤ x ∧ i_1 + x ≤ i_2) : i_2 ≤ 4294967294%Z.
Admitted.
