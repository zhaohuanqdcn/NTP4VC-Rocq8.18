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
Require Import stack_pop.Compound.Compound.
Require Import stack_pop.Axiomatic.Axiomatic.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal7 (a : addr) (t_1 : addr -> Z) (t_2 : addr -> addr) (t : Z -> Z) : let a_1 : addr := shift a 2%Z in let x : Z := t_1 a_1 in let m : addr -> Z := fun_updt t_1 a_1 (x - 1%Z) in 0%Z < x -> region (base a) ≤ 0%Z -> framed t_2 -> linked t -> ¬ p_empty t_1 a -> valid_rw t a 3%Z -> is_uint32 x -> p_invariant t t_2 t_1 a -> valid_rd t a_1 1%Z -> valid_rw t a_1 1%Z -> p_unchanged_1' m t_1 (l_storage t_2 a) 0%Z (l_size m a).
Proof.
Admitted.
