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
Require Import is_heap.Axiomatic.Axiomatic.
Require Import is_heap.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (i_1 : Z) (a : addr) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let x : Z := l_heapparent i_1 in let a_1 : addr := shift a i_1 in let x_1 : Z := t_1 a_1 in let a_2 : addr := shift a x in let x_2 : Z := t_1 a_2 in Z.quot i_1 2%Z = 0%Z -> i_1 < i -> 0%Z ≤ x -> x < i_1 -> region (base a) ≤ 0%Z -> x_1 ≤ x_2 -> i_1 ≤ 4294967294%Z -> x ≤ 4294967294%Z -> i_1 ≤ 1%Z + i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> p_isheap t_1 a i_1 -> is_uint32 (1%Z + i_1) -> is_sint32 x_1 -> valid_rd t (shift a 0%Z) i -> valid_rd t a_1 1%Z -> is_uint32 (1%Z + x) -> is_sint32 x_2 -> valid_rd t a_2 1%Z -> - 1%Z ≤ x.
Proof.
Admitted.
