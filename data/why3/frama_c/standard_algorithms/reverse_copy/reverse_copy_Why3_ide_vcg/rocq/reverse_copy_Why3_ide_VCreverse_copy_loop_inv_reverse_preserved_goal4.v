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
Require Import reverse_copy.Compound.Compound.
Require Import reverse_copy.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (i : Z) (i_1 : Z) (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (t : Z -> Z) : let x : Z := to_uint32 (i - 1%Z) in let x_1 : Z := 1%Z + i_1 in let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let a_4 : addr := shift a i_1 in let a_5 : addr -> Z := havoc t_1 t_2 a_3 i in let x_3 : Z := i - 1%Z - i_1 in 0%Z < i -> i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_1 ≤ x -> i_1 ≤ 4294967294%Z -> x ≤ 4294967295%Z + i_1 -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x_1 -> valid_rd t a_2 i -> valid_rw t a_3 i -> valid_rw t a_4 1%Z -> separated a_2 i a_3 i -> p_reverse_2' t_2 a_5 a 0%Z i_1 a_1 (i - i_1) -> valid_rd t (shift a_1 (to_uint32 (x - i_1))) 1%Z -> p_reverse_2' t_2 (fun_updt a_5 a_4 (a_5 (shift a_1 x_3))) a 0%Z x_1 a_1 x_3.
Admitted.
