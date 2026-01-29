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
Require Import selection_sort.Axiomatic1.Axiomatic1.
Require Import selection_sort.A_Count.A_Count.
Require Import selection_sort.Compound.Compound.
Require Import selection_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (i_2 : Z) (i_3 : Z) (a : addr) (i : Z) (t : addr -> Z) (fact0 : i_1 < i_2) (fact1 : i_3 ≤ i_1) (fact2 : region (base a) ≤ 0%Z) (fact3 : is_uint32 i_2) (fact4 : is_uint32 i_3) (fact5 : is_sint32 i) (fact6 : p_upperbound_1' t a i_3 i_2 i) : t (shift a i_1) ≤ i.
Proof.
Admitted.
