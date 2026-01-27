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
Require Import stack_push_wd.Axiomatic.Axiomatic.
Require Import stack_push_wd.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> addr) (i : Z) (i_1 : Z) (a : addr) (i_2 : Z) (i_3 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 2%Z in let x : Z := t_1 a_2 in let m : addr -> Z := fun_updt (fun_updt t_1 (shift (t_2 (shift a_1 0%Z)) x) i) a_2 i_1 in let x_1 : Z := l_size t_1 a_1 in let a_3 : addr := shift a 2%Z in let x_2 : Z := m a_3 in let x_3 : Z := l_top t_2 m a_1 in let m_1 : addr -> Z := fun_updt (fun_updt m (shift (t_2 (shift a 0%Z)) x_2) i_2) a_3 i_3 in let x_4 : Z := l_capacity m_1 a in let x_5 : Z := l_capacity m a in let x_6 : Z := l_size m_1 a in let x_7 : Z := l_size m a in let a_4 : addr := l_storage t_2 a in l_capacity m a_1 = l_capacity t_1 a_1 -> 1%Z + x_1 = l_size m a_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> ¬ p_full t_1 a -> ¬ p_full t_1 a_1 -> valid_rw t a 3%Z -> valid_rw t a_1 3%Z -> is_uint32 (t_1 a_3) -> is_uint32 x -> p_invariant t t_2 t_1 a -> p_invariant t t_2 t_1 a_1 -> p_separated t_2 t_1 a_1 a -> p_equal t_2 t_1 t_2 t_1 a_1 a -> is_uint32 x_2 -> ¬ p_empty m a_1 -> p_unchanged_1' m t_1 (l_storage t_2 a_1) 0%Z x_1 -> p_invariant t t_2 m a -> p_invariant t t_2 m a_1 -> is_sint32 x_3 -> (p_empty m_1 a -> p_full m a) -> (p_full m a -> p_full m_1 a) -> (p_full m a -> x_4 = x_5) -> (¬ p_full m a -> x_4 = x_5) -> (p_full m a -> x_6 = x_7) -> (¬ p_full m a -> 1%Z + x_7 = x_6) -> (¬ p_full m a -> l_top t_2 m_1 a = x_3) -> (¬ p_full m a -> p_unchanged_1' m_1 m a_4 0%Z x_7) -> (p_full m a -> p_invariant t t_2 m_1 a) -> (¬ p_full m a -> p_invariant t t_2 m_1 a) -> (p_full m a -> p_unchanged_1' m_1 m a_4 0%Z x_6) -> p_equal t_2 m_1 t_2 m_1 a_1 a.
Admitted.
