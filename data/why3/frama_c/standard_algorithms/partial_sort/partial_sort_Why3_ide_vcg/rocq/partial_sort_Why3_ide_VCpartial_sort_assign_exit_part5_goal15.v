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
Require Import partial_sort.Compound.Compound.
Require Import partial_sort.Axiomatic.Axiomatic.
Require Import partial_sort.Axiomatic1.Axiomatic1.
Require Import partial_sort.A_Count.A_Count.
Open Scope Z_scope.
Theorem goal15 (a : addr) (t_1 : addr -> Z) (t_4 : addr -> Z) (i_3 : Z) (t_2 : addr -> Z) (i_2 : Z) (t_3 : addr -> Z) (i_4 : Z) (t_5 : addr -> Z) (t : Z -> Z) (i_1 : Z) (i : Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr -> Z := havoc t_1 t_4 a_1 i_3 in let a_3 : addr -> Z := havoc t_2 a_2 a_1 i_2 in let a_4 : addr -> Z := havoc t_3 a_3 a_1 i_3 in let x : Z := i_3 - 1%Z in let a_5 : addr := shift a x in let a_6 : Z := a_4 a_5 in let a_7 : Z := a_3 a_1 in let a_8 : addr := shift a i_4 in let a_9 : Z := a_3 a_8 in let x_1 : Z := t_5 a_8 in let x_2 : Z := t_5 a_5 in a_6 = a_7 -> 0%Z < i_3 -> i_3 ≤ i_2 -> i_4 ≤ i_2 -> 0%Z ≤ i_3 -> i_4 < i_2 -> i_3 ≤ i_4 -> region (base a) ≤ 0%Z -> a_9 < a_7 -> linked t -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_sint32 i_1 -> is_sint32 x_1 -> valid_rd t a_1 1%Z -> valid_rd t a_8 1%Z -> valid_rw t a_1 i_2 -> valid_rw t a_1 i_3 -> is_sint32 x_2 -> is_sint32 (a_2 a_1) -> p_isheap a_2 a i_3 -> p_multisetunchanged_1' a_2 t_4 a 0%Z i_3 -> is_sint32 a_7 -> is_sint32 a_9 -> p_isheap a_3 a i_3 -> p_multisetunchanged_1' a_3 t_4 a 0%Z i_4 -> p_unchanged_1' a_3 t_4 a i_4 i_2 -> p_upperbound_1' a_3 a 0%Z i_3 a_7 -> p_lowerbound_1' a_3 a i_3 i_4 a_7 -> is_sint32 a_6 -> p_isheap a_4 a x -> p_multisetunchanged_1' a_4 t_4 a 0%Z (1%Z + i_4) -> p_multisetunchanged_1' a_4 a_3 a 0%Z i_3 -> p_maxelement a_4 a i_3 x -> valid_rw t a_8 1%Z ∧ valid_rw t a_5 1%Z ∨ fun_updt (fun_updt t_5 a_8 i) a_5 x_1 a_8 = x_2 ∧ a_4 = t_5 ∧ valid_rw t a_8 1%Z ∧ valid_rw t a_5 1%Z -> (¬ invalid t a_8 1%Z -> included a_8 1%Z a_1 i_2) ∧ (¬ invalid t a_5 1%Z -> included a_5 1%Z a_1 i_2).
Proof.
Admitted.
