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
Require Import stack_init.Compound.Compound.
Require Import stack_init.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (a_1 : addr) (a : addr) (i : Z) (t_2 : addr -> addr) (t : Z -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a_1 1%Z in let a_3 : addr := shift a_1 0%Z in let a_4 : addr := shift a_1 2%Z in let a_5 : addr := shift a 0%Z in 0%Z < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> is_uint32 i -> valid_rw t a_1 3%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> valid_rw t a_4 1%Z -> valid_rw t a_5 i -> separated a_1 3%Z a_5 i -> p_invariant t (fun_updt t_2 a_3 a) (fun_updt (fun_updt t_1 a_2 i) a_4 0%Z) a_1.
Admitted.
