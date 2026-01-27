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
Require Import push_heap.Compound.Compound.
Require Import push_heap.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal23 (i : Z) (a : addr) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := i - 1%Z in let x_1 : Z := l_heapparent x in let a_1 : addr := shift a x_1 in let x_2 : Z := t_1 a_1 in let a_2 : addr := shift a x in let x_3 : Z := t_1 a_2 in let a_3 : addr := shift a 0%Z in let a_4 : addr := shift a (to_uint32 x) in 0%Z < i -> region (base a) ≤ 0%Z -> x_2 < x_3 -> 2%Z ≤ i -> linked t -> is_uint32 i -> valid_rw t a_3 i -> is_uint32 x_1 -> p_isheap t_1 a x -> is_sint32 x_3 -> ¬ invalid t a_2 1%Z -> is_sint32 x_2 -> valid_rd t a_4 1%Z -> valid_rd t a_1 1%Z -> valid_rw t a_4 1%Z -> included a_2 1%Z a_3 i.
Admitted.
