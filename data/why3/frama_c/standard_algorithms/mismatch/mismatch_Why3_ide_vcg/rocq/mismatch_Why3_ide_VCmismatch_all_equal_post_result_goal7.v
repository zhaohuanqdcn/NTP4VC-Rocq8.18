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
Require Import mismatch.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import mismatch.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal7 (a_1 : addr) (i_1 : Z) (t_1 : addr -> Z) (a : addr) (i : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_1 in let x : Z := t_1 a_2 in let a_3 : addr := shift a i_1 in let x_1 : Z := t_1 a_3 in ¬ x = x_1 -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x_1 -> is_sint32 x -> p_equalranges_1' t_1 t_1 a_1 i a -> p_equalranges_1' t_1 t_1 a_1 i_1 a -> valid_rd t (shift a 0%Z) i -> valid_rd t a_3 1%Z -> valid_rd t (shift a_1 0%Z) i -> ¬ valid_rd t a_2 1%Z.
Proof.
Admitted.
