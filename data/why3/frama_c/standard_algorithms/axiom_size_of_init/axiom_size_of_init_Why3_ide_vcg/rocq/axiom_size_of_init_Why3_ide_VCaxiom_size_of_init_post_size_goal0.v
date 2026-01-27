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
Require Import axiom_size_of_init.Axiomatic.Axiomatic.
Require Import axiom_size_of_init.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (t_1 : addr -> Z) (a_1 : addr) (i : Z) (i_1 : Z) (t_2 : addr -> addr) (a : addr) (t : Z -> Z) : let m : addr -> Z := fun_updt (fun_updt t_1 (shift a_1 2%Z) i) (shift a_1 1%Z) i_1 in let x : Z := l_capacity m a_1 in let m_1 : addr -> addr := fun_updt t_2 (shift a_1 0%Z) a in let a_2 : addr := l_storage m_1 a_1 in let x_1 : Z := l_size m a_1 in let a_3 : addr := shift a_2 0%Z in region (base a_1) ≤ 0%Z -> 0%Z < x -> region (base a_2) ≤ 0%Z -> framed t_2 -> linked t -> valid_rw t a_1 3%Z -> p_empty m a_1 -> is_uint32 x -> is_uint32 x_1 -> p_invariant t m_1 m a_1 -> valid_rw t a_3 x -> separated a_1 3%Z a_3 x -> x_1 = 0%Z.
Admitted.
