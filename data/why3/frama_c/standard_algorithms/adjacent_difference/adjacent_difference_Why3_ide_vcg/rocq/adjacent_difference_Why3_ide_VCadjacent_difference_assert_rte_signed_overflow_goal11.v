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
Require Import adjacent_difference.Axiomatic1.Axiomatic1.
Require Import adjacent_difference.Compound.Compound.
Require Import adjacent_difference.A_DifferenceAxiomatic.A_DifferenceAxiomatic.
Require Import adjacent_difference.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal11 (a_1 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 0%Z in let a_3 : addr := shift a 0%Z in let a_4 : addr -> Z := havoc t_1 (fun_updt t_2 a_3 (t_2 a_2)) (shift a 1%Z) (i - 1%Z) in let a_5 : Z := a_4 (shift a_1 i_1) in let a_6 : Z := a_4 (shift a_1 (to_uint32 (i_1 - 1%Z))) in 0%Z < i -> 0%Z < i_1 -> i_1 ≤ i -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> p_adjacentdifferencebounds t_2 a_1 i -> valid_rd t a_2 1%Z -> valid_rd t a_2 i -> valid_rw t a_3 1%Z -> valid_rw t a_3 i -> separated a_2 i a_3 i -> is_sint32 a_5 -> is_sint32 a_6 -> p_unchanged_1' a_4 t_2 a_1 0%Z i -> p_adjacentdifference a_4 a_1 i_1 a -> a_6 ≤ 2147483648%Z + a_5.
Proof.
Admitted.
