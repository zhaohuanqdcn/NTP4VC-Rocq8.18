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
Require Import pop_heap.Axiomatic.Axiomatic.
Require Import pop_heap.Compound.Compound.
Open Scope Z_scope.
Theorem goal2 (t : addr -> Z) (a : addr) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := t (shift a 0%Z) in 0%Z < i -> i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> i_2 ≤ i_1 -> 0%Z ≤ i_2 -> region (base a) ≤ 0%Z -> i_1 ≤ 4294967294%Z -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> p_isheap t a i -> is_uint32 (1%Z + i_1) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_1 -> t (shift a i_3) ≤ x) -> t (shift a i_2) ≤ x.
Proof.
Admitted.
