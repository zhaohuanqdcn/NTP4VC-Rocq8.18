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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal2 (a_6 : addr) (a_7 : addr) (a_10 : addr) (t_1 : addr -> Z) (a_8 : addr) (i : Z) (a_5 : addr) (t : Z -> Z) (i_1 : Z) (a_3 : addr) (a : addr) (a_1 : addr) (a_4 : addr) (a_2 : addr) (a_9 : addr) : let x : Z := offset a_6 in let x_1 : Z := offset a_7 in let x_2 : Z := base a_10 in let x_3 : Z := t_1 a_8 in let x_4 : Z := i + x_1 - x in base a_7 = base a_5 -> 0%Z ≤ i -> x ≤ x_1 -> region x_2 ≤ 0%Z -> linked t -> is_sint32 i_1 -> is_uint64 i -> addr_le a_3 a_7 -> is_uint8 x_3 -> is_uint64 x_4 -> valid_rd t (shift a 0%Z) x_4 -> valid_rd t (shift a_1 0%Z) x_4 -> addr_le a_7 (shift a_4 x_4) -> i = 0%Z ∨ a_8 = a_7 ∧ x_3 = i_1 -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 + x < x_1 -> ¬ t_1 (shift a_2 i_2) = i_1) -> x_2 = base a_9.
Admitted.
