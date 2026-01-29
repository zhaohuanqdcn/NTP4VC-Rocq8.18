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
Theorem goal4 (i_3 : Z) (i_5 : Z) (a : addr) (t_1 : addr -> Z) (i_4 : Z) (i_6 : Z) (a_1 : addr) (i_2 : Z) (t : Z -> Z) (i : Z) (i_1 : Z) (t_2 : addr -> Z) : let x_1 : Z := i_3 - i_5 in let x_2 : Z := i_5 + to_uint32 (Z.rem (to_uint32 x_1) 2%Z) in let x_3 : Z := i_5 + Z.rem x_1 2%Z in let a_2 : addr := shift a x_3 in let x_4 : Z := t_1 a_2 in let x_5 : Z := Z.rem (i_4 - i_5) 2%Z in let x_6 : Z := i_6 + Z.rem (i_3 - i_6) 2%Z in let a_3 : addr := shift a_1 x_6 in i_3 ≤ i_2 -> i_5 ≤ i_3 -> 0%Z ≤ i_5 -> i_5 < i_3 -> region (base a) ≤ 0%Z -> 0%Z ≤ x_2 -> i_3 ≤ 4294967295%Z + i_5 -> x_2 ≤ 4294967295%Z -> linked t -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> is_uint32 i_5 -> is_uint32 i_6 -> is_sint32 i -> is_sint32 i_1 -> p_sorted_1' t_1 a 0%Z i_2 -> p_strictupperbound_1' t_1 a 0%Z i_5 i -> p_strictlowerbound_1' t_1 a i_3 i_2 i -> valid_rd t (shift a 0%Z) i_2 -> is_uint32 x_3 -> is_sint32 x_4 -> valid_rd t a_2 1%Z -> (if decide (x_4 < i) then i_4 = i_3 ∧ 1%Z + i_5 + x_5 = i_6 ∧ i_5 + x_5 ≤ 4294967294%Z else i_1 = i ∧ i_6 = i_5 ∧ a_1 = a ∧ t_2 = t_1 ∧ x_6 = i_4 ∧ i_1 < t_2 a_3 ∧ valid_rd t a_3 1%Z) -> i_4 ≤ i_2 ∧ i_6 ≤ i_4 ∧ 0%Z ≤ i_6.
Proof.
Admitted.
