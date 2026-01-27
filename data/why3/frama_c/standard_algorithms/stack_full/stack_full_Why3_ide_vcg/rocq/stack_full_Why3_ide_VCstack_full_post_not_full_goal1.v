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
Require Import stack_full.Axiomatic.Axiomatic.
Require Import stack_full.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (t_1 : addr -> Z) (a : addr) (t_2 : addr -> addr) (t : Z -> Z) : let x : Z := l_size t_1 a in let a_1 : addr := shift a 1%Z in let x_1 : Z := t_1 a_1 in region (base a) ≤ 0%Z -> framed t_2 -> linked t -> valid_rw t a 3%Z -> is_uint32 x -> is_uint32 x_1 -> p_invariant t t_2 t_1 a -> valid_rd t a_1 1%Z -> (¬ p_full t_1 a) = (¬ x_1 = x).
Admitted.
