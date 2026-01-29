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
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_StrStr.A_StrStr.
Open Scope Z_scope.
Theorem goal17 (t_2 : addr -> Z) (a_15 : addr) (a_18 : addr) (i : Z) (a_17 : addr) (a_16 : addr) (t : Z -> Z) (i_1 : Z) (i_2 : Z) (a_14 : addr) (a_11 : addr) (a_10 : addr) (a_9 : addr) (a_8 : addr) (a_12 : addr) (a_13 : addr) (t_1 : addr -> Z) (a_1 : addr) (a : addr) (a_5 : addr) (a_4 : addr) (a_7 : addr) (a_6 : addr) (a_3 : addr) (a_2 : addr) : let x : Z := l_strlen t_2 a_15 in let a_19 : addr := shift a_18 i in let x_1 : Z := offset a_17 in let x_2 : Z := offset a_18 in let x_3 : Z := i + x_2 in t_2 (shift a_15 x) = 0%Z -> region (base a_15) ≤ 0%Z -> region (base a_16) ≤ 0%Z -> linked t -> sconst t_2 -> is_uint64 i -> is_uint64 i_1 -> is_uint64 i_2 -> p_valid_str t t_2 a_15 -> p_valid_str t t_2 a_16 -> is_uint64 x -> (if decide (x = 0%Z) then a_16 = a_14 else a_18 = a_16 ∧ l_strlen t_2 a_18 = i ∧ t_2 a_19 = 0%Z ∧ i_1 + x_1 = x_3 ∧ i_2 + x_1 = x_3 ∧ x_2 ≤ x_1 ∧ 0%Z < x ∧ addr_le a_18 a_17 ∧ p_valid_str t t_2 a_17 ∧ p_valid_str t t_2 a_18 ∧ addr_le a_17 a_19 ∧ (if decide (x_1 + x ≤ x_3) then a_17 = a_14 ∧ (base a_11 = base a_10) = (base a_9 = base a_8) ∧ valid_rd t (shift a_12 0%Z) x ∧ valid_rd t (shift a_13 0%Z) x ∧ ((∃(i_3 : Z), ¬ t_1 (shift a_1 i_3) = t_1 (shift a i_3) ∧ 0%Z ≤ i_3 ∧ i_3 < x) -> (∃(i_3 : Z), ¬ t_1 (shift a_5 i_3) = t_1 (shift a_4 i_3) ∧ t_1 (shift a_7 i_3) = t_1 (shift a_6 i_3) ∧ 0%Z ≤ i_3 ∧ i_3 < x ∧ (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_3 -> t_1 (shift a_3 i_4) = t_1 (shift a_2 i_4)))) else Mk_addr 0%Z 0%Z = a_14) ∧ (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i -> ¬ t_2 (shift a_18 i_3) = 0%Z) ∧ (∀(a_20 : addr), addr_lt a_20 a_17 -> addr_le a_18 a_20 -> ¬ p_strmatch t_2 a_20 a_15)) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < x -> ¬ t_2 (shift a_15 i_3) = 0%Z) -> (∀(a_20 : addr), addr_le a_16 a_20 -> addr_le a_20 (shift a_16 (l_strlen t_2 a_16)) -> ¬ p_strmatch t_2 a_20 a_15) -> Mk_addr 0%Z 0%Z = a_14.
Proof.
Admitted.
