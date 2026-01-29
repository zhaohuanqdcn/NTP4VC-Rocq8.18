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
Require Import selection_sort.Compound.Compound.
Require Import selection_sort.Axiomatic1.Axiomatic1.
Require Import selection_sort.A_Count.A_Count.
Require Import selection_sort.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (a : addr) (i : Z) (t : addr -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : is_uint32 i) (fact2 : ∀(i_2 : Z) (i_1 : Z), i_1 < i -> 0%Z ≤ i_2 -> i_2 < i_1 -> t (shift a i_2) ≤ t (shift a i_1)) : p_sorted_1' t a 0%Z i.
Proof.
Admitted.
