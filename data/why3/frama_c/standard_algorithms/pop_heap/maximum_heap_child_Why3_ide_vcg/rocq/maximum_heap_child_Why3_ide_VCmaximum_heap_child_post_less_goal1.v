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
Require Import pop_heap.Axiomatic.Axiomatic.
Require Import pop_heap.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (i : Z) (a : addr) (i_1 : Z) (t : Z -> Z) (i_2 : Z) (t_1 : addr -> Z) (p : bool) : let x : Z := 2%Z * i in let x_1 : Z := 1%Z + x in let a_1 : addr := shift a x_1 in let x_2 : Z := 2%Z + x in let a_2 : addr := shift a x_2 in 0%Z ≤ i -> region (base a) ≤ 0%Z -> 2%Z ≤ i_1 -> 2%Z + i ≤ i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> p_isheap t_1 a i_1 -> valid_rw t (shift a 0%Z) i_1 -> (if decide (i ≤ 2147483646%Z) then 0%Z < i_1 ∧ i ≤ 2147483647%Z ∧ to_uint32 x ≤ 4294967293%Z ∧ (if decide (4%Z + x ≤ i_1) then p = false ∧ valid_rd t a_1 1%Z ∧ valid_rd t a_2 1%Z ∧ (if decide (t_1 a_2 ≤ t_1 a_1) then x_1 = i_2 else x_2 = i_2) else x_1 = i_2) else i_2 = i_1) -> i < i_2.
Admitted.
