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
Theorem goal5 (a : addr) (i : Z) (t : Z -> Z) (t_1 : addr -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := i - 1%Z in 0%Z < i -> region (base a) ≤ 0%Z -> 2%Z ≤ i -> linked t -> is_uint32 i -> p_isheap t_1 a i -> is_sint32 (t_1 a_1) -> valid_rd t a_1 1%Z -> valid_rw t a_1 i -> is_sint32 (t_1 (shift a x)) -> valid_rd t (shift a (to_uint32 x)) 1%Z.
Admitted.
