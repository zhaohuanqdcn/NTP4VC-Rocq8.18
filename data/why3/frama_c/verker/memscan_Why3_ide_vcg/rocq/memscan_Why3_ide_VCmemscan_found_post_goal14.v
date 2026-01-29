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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal14 (a_7 : addr) (a_10 : addr) (i : Z) (t_1 : addr -> Z) (a_2 : addr) (i_1 : Z) (a_6 : addr) (a_12 : addr) (t : Z -> Z) (a_4 : addr) (a : addr) (a_1 : addr) (a_5 : addr) (a_3 : addr) (a_11 : addr) (a_9 : addr) (a_8 : addr) : let x : Z := offset a_7 in let x_1 : Z := offset a_10 in let x_2 : Z := i + x_1 in let x_3 : Z := t_1 (shift a_2 i_1) in let x_4 : Z := i + x_1 - x in base a_10 = base a_6 -> 0%Z ≤ i -> 0%Z ≤ i_1 -> x ≤ x_1 -> region (base a_12) ≤ 0%Z -> i_1 + x < x_2 -> linked t -> is_uint64 i -> addr_le a_4 a_10 -> is_sint32 x_3 -> is_uint64 x_4 -> valid_rd t (shift a 0%Z) x_4 -> valid_rd t (shift a_1 0%Z) x_4 -> addr_le a_10 (shift a_5 x_4) -> i = 0%Z ∨ x_3 = t_1 a_10 -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x < x_1 -> ¬ t_1 (shift a_3 i_2) = x_3) -> (∃(i_2 : Z), shift a_12 i_2 = a_11 ∧ t_1 (shift a_9 i_2) = x_3 ∧ 0%Z ≤ i_2 ∧ i_2 + x < x_2 ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_2 -> ¬ t_1 (shift a_8 i_3) = x_3)).
Proof.
Admitted.
