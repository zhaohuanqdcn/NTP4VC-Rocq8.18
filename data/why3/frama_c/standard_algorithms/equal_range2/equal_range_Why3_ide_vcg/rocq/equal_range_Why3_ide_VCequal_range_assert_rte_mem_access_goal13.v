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
Require Import equal_range2.Axiomatic.Axiomatic.
Require Import equal_range2.Compound.Compound.
Open Scope Z_scope.
Theorem goal13 (i_2 : Z) (i_3 : Z) (i_1 : Z) (a : addr) (t : Z -> Z) (i : Z) (t_1 : addr -> Z) : let x : Z := i_2 - i_3 in let x_1 : Z := i_3 + to_uint32 (Z.rem (to_uint32 x) 2%Z) in let x_2 : Z := i_3 + Z.rem x 2%Z in i_2 ≤ i_1 -> i_3 ≤ i_2 -> 0%Z ≤ i_3 -> i_3 < i_2 -> region (base a) ≤ 0%Z -> 0%Z ≤ x_1 -> i_2 ≤ 4294967295%Z + i_3 -> x_1 ≤ 4294967295%Z -> linked t -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i -> p_sorted_1' t_1 a 0%Z i_1 -> p_strictupperbound_1' t_1 a 0%Z i_3 i -> p_strictlowerbound_1' t_1 a i_2 i_1 i -> valid_rd t (shift a 0%Z) i_1 -> is_uint32 x_2 -> valid_rd t (shift a x_2) 1%Z.
Proof.
Admitted.
