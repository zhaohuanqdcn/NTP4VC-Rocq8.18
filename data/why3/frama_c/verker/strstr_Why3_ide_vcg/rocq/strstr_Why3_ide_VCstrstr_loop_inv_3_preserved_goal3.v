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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_StrStr.A_StrStr.
Open Scope Z_scope.
Theorem goal3 (t_2 : addr -> Z) (a_16 : addr) (a_18 : addr) (a_17 : addr) (i : Z) (a_13 : addr) (a_12 : addr) (a_11 : addr) (a_10 : addr) (t_1 : addr -> Z) (a_1 : addr) (i_1 : Z) (a : addr) (t : Z -> Z) (a_14 : addr) (a_15 : addr) (a_3 : addr) (a_2 : addr) (a_7 : addr) (a_6 : addr) (a_9 : addr) (a_8 : addr) (a_5 : addr) (a_4 : addr) : let x : Z := l_strlen t_2 a_16 in let x_1 : Z := l_strlen t_2 a_18 in let a_19 : addr := shift a_18 x_1 in let x_2 : Z := offset a_18 in let x_3 : Z := offset a_17 in let a_20 : addr := shift a_17 1%Z in ¬ i = 0%Z -> (base a_13 = base a_12) = (base a_11 = base a_10) -> ¬ x = 0%Z -> ¬ t_1 (shift a_1 i_1) = t_1 (shift a i_1) -> t_2 (shift a_16 x) = 0%Z -> t_2 a_19 = 0%Z -> 0%Z ≤ i_1 -> x_2 ≤ x_3 -> 0%Z < x -> i_1 < x -> region (base a_16) ≤ 0%Z -> region (base a_18) ≤ 0%Z -> x_3 + x ≤ x_2 + x_1 -> linked t -> sconst t_2 -> is_sint32 i -> addr_le a_18 a_17 -> ¬ p_strmatch t_2 a_17 a_16 -> p_valid_str t t_2 a_16 -> p_valid_str t t_2 a_17 -> p_valid_str t t_2 a_18 -> is_uint64 x -> is_uint64 x_1 -> valid_rd t (shift a_14 0%Z) x -> valid_rd t (shift a_15 0%Z) x -> addr_le a_17 a_19 -> is_uint64 (x_2 + x_1 - x_3) -> ((∃(i_2 : Z), ¬ t_1 (shift a_3 i_2) = t_1 (shift a_2 i_2) ∧ 0%Z ≤ i_2 ∧ i_2 < x) -> (∃(i_2 : Z), ¬ t_1 (shift a_7 i_2) = t_1 (shift a_6 i_2) ∧ t_1 (shift a_9 i_2) = i + t_1 (shift a_8 i_2) ∧ 0%Z ≤ i_2 ∧ i_2 < x ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i_2 -> t_1 (shift a_5 i_3) = t_1 (shift a_4 i_3)))) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < x -> ¬ t_2 (shift a_16 i_2) = 0%Z) -> (∀(i_2 : Z), 0%Z ≤ i_2 -> i_2 < x_1 -> ¬ t_2 (shift a_18 i_2) = 0%Z) -> (∀(a_21 : addr), addr_lt a_21 a_17 -> addr_le a_18 a_21 -> ¬ p_strmatch t_2 a_21 a_16) -> addr_le a_18 a_20 ∧ addr_le a_20 a_19.
Admitted.
