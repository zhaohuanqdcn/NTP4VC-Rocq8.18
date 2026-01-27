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
Require Import axiom_pop_of_push.Axiomatic.Axiomatic.
Require Import axiom_pop_of_push.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (a : addr) (t_1 : addr -> Z) (t_2 : addr -> addr) (i : Z) (i_1 : Z) (i_2 : Z) (t : Z -> Z) : let a_1 : addr := shift a 2%Z in let x : Z := t_1 a_1 in let m : addr -> Z := fun_updt t_1 (shift (t_2 (shift a 0%Z)) x) i in let m_1 : addr -> Z := fun_updt m a_1 i_1 in let x_1 : Z := l_capacity m_1 a in let m_2 : addr -> Z := fun_updt m a_1 i_2 in let x_2 : Z := l_size m_2 a in let x_3 : Z := l_size t_1 a in let a_2 : addr := l_storage t_2 a in x_1 = l_capacity t_1 a -> l_capacity m_2 a = x_1 -> x_2 = x_3 -> 1%Z + x_3 = l_size m_1 a -> region (base a) ≤ 0%Z -> framed t_2 -> linked t -> ¬ p_full t_1 a -> valid_rw t a 3%Z -> is_uint32 x -> p_invariant t t_2 t_1 a -> ¬ p_empty m_1 a -> ¬ p_full m_2 a -> p_unchanged_1' m_1 t_1 a_2 0%Z x_3 -> p_invariant t t_2 m_1 a -> p_invariant t t_2 m_2 a -> is_sint32 (l_top t_2 m_1 a) -> p_unchanged_1' m_2 m_1 a_2 0%Z x_2 -> p_equal t_2 m_2 t_2 t_1 a a.
Admitted.
