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
Require Import stack_equal.Compound.Compound.
Require Import stack_equal.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (a_1 : addr) (t_1 : addr -> Z) (a : addr) (t_2 : addr -> addr) (t : Z -> Z) : let a_2 : addr := shift a_1 2%Z in let x : Z := t_1 a_2 in let a_3 : addr := shift a 2%Z in let x_1 : Z := t_1 a_3 in let a_4 : addr := shift a_1 0%Z in x = x_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> valid_rw t a 3%Z -> valid_rw t a_1 3%Z -> is_uint32 x_1 -> is_uint32 x -> p_invariant t t_2 t_1 a -> p_invariant t t_2 t_1 a_1 -> valid_rd t (shift a 0%Z) 1%Z -> valid_rd t a_4 1%Z -> valid_rd t a_3 1%Z -> valid_rd t a_2 1%Z -> valid_rd t (shift (t_2 a_4) 0%Z) x.
Admitted.
