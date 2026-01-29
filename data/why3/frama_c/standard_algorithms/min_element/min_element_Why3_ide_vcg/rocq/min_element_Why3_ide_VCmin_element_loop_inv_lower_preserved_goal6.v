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
Require Import Why3.Cint.Cint.
Require Import min_element.Compound.Compound.
Require Import min_element.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal6 (i_3 : Z) (a : addr) (i_1 : Z) (t_1 : addr -> Z) (i_2 : Z) (i : Z) (t : Z -> Z) : let x : Z := 1%Z + i_3 in let a_1 : addr := shift a 0%Z in let a_2 : addr := shift a i_1 in let x_1 : Z := t_1 a_2 in let x_2 : Z := t_1 (shift a i_2) in let a_3 : addr := shift a i_3 in let x_3 : Z := t_1 a_3 in 0%Z < i -> i_3 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> 0%Z ≤ i_3 -> i_3 < i -> region (base a) ≤ 0%Z -> i_3 ≤ 4294967294%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 x -> is_sint32 (t_1 a_1) -> is_sint32 x_1 -> is_sint32 x_2 -> is_sint32 x_3 -> valid_rd t a_1 i -> valid_rd t a_2 1%Z -> valid_rd t a_3 1%Z -> p_lowerbound_1' t_1 a 0%Z i_3 x_1 -> p_strictlowerbound_1' t_1 a 0%Z i_1 x_1 -> (if decide (x_3 < x_1) then i_3 = i_2 else i_2 = i_1) -> p_lowerbound_1' t_1 a 0%Z x x_2.
Proof.
Admitted.
