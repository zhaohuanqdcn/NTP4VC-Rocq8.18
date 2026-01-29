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
Require Import pop_heap.Axiomatic1.Axiomatic1.
Require Import pop_heap.A_Count.A_Count.
Open Scope Z_scope.
Theorem goal18 (i_2 : Z) (i : Z) (a : addr) (t_2 : addr -> Z) (t_1 : addr -> Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) : let x : Z := l_heapparent i_2 in let x_1 : Z := i - 1%Z in let a_1 : addr := shift a x_1 in let x_2 : Z := t_2 a_1 in let a_2 : addr := shift a 0%Z in let x_3 : Z := t_2 a_2 in let a_3 : addr -> Z := havoc t_1 t_2 a_2 x_1 in let a_4 : Z := a_3 a_1 in let a_5 : addr := shift a i_2 in let a_6 : Z := a_3 a_5 in let a_7 : Z := a_3 (shift a (l_heapparent x)) in let a_8 : addr := shift a x in let a_9 : addr -> Z := fun_updt a_3 a_8 a_6 in 0%Z < i -> 0%Z < i_1 -> 0%Z ≤ i_2 -> i_2 < i_3 -> 0%Z ≤ x -> x < i_2 -> region (base a) ≤ 0%Z -> x_2 < x_3 -> a_4 < a_6 -> a_4 < a_7 -> 2%Z ≤ i -> 2%Z + i_2 ≤ i -> 2%Z + x ≤ i -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 x -> p_isheap t_2 a i -> is_sint32 x_3 -> p_heapmaximumchild t_2 a i 0%Z i_1 -> valid_rd t a_2 1%Z -> valid_rd t a_5 1%Z -> valid_rw t a_2 i -> is_sint32 (t_2 (shift a (l_heapparent 0%Z))) -> valid_rw t a_8 1%Z -> is_sint32 x_2 -> is_sint32 a_6 -> is_sint32 a_4 -> is_sint32 a_7 -> valid_rd t (shift a (to_uint32 x_1)) 1%Z -> p_isheap a_3 a i -> is_sint32 (a_9 a_1) -> p_isheap a_9 a i -> p_upperbound_1' a_3 a 0%Z i x_3 -> p_heapmaximumchild a_3 a i x i_2 -> p_heapmaximumchild a_9 a i i_2 i_3 -> (2%Z + i_1 ≤ i -> l_heapparent i_1 = 0%Z) -> (2%Z + i_3 ≤ i -> l_heapparent i_3 = i_2) -> x ≤ i.
Proof.
Admitted.
