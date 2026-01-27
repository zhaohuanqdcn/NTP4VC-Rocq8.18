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
Require Import max_element2.Compound.Compound.
Require Import max_element2.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal7 (a : addr) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let x : Z := t_1 a_1 in 0%Z < i -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_sint32 x -> valid_rd t a_1 i -> p_upperbound_1' t_1 a 0%Z 0%Z x.
Admitted.
