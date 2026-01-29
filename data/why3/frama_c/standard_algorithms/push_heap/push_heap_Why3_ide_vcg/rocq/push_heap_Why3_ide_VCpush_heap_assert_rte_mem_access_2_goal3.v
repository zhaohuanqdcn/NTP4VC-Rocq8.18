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
Require Import push_heap.Compound.Compound.
Require Import push_heap.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal3 (i : Z) (a : addr) (t : Z -> Z) (t_1 : addr -> Z) : let x : Z := i - 1%Z in let x_1 : Z := l_heapparent x in 0%Z < i -> region (base a) ≤ 0%Z -> 2%Z ≤ i -> linked t -> is_uint32 i -> valid_rw t (shift a 0%Z) i -> is_uint32 x_1 -> p_isheap t_1 a x -> is_sint32 (t_1 (shift a x)) -> valid_rd t (shift a (to_uint32 x)) 1%Z -> valid_rd t (shift a x_1) 1%Z.
Proof.
Admitted.
