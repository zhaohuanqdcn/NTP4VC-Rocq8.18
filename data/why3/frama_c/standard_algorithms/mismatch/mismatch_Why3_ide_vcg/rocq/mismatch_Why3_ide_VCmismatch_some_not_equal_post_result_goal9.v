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
Require Import mismatch.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import mismatch.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal9 (t_1 : addr -> Z) (a : addr) (i_1 : Z) (a_1 : addr) (i : Z) (t : Z -> Z) : let x : Z := t_1 (shift a i_1) in let x_1 : Z := t_1 (shift a_1 i_1) in i_1 ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_sint32 x -> is_sint32 x_1 -> ¬ p_equalranges_1' t_1 t_1 a_1 i a -> p_equalranges_1' t_1 t_1 a_1 i_1 a -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i -> ¬ x_1 = x.
Admitted.
