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
Require Import verker.A_StrPBrk.A_StrPBrk.
Require Import verker.A_StrSpn.A_StrSpn.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal20 (t_1 : addr -> Z) (a_2 : addr) (a_4 : addr) (a_5 : addr) (a_1 : addr) (a : addr) (a_8 : addr) (a_7 : addr) (t : Z -> Z) (a_3 : addr) (a_6 : addr) : let x : Z := t_1 a_2 in let a_9 : addr := shift a_4 (l_strlen t_1 a_4) in let a_10 : addr := shift a_5 (l_strlen t_1 a_5) in let x_1 : Z := t_1 a_1 in let x_2 : Z := t_1 a in t_1 a_8 = t_1 a_7 -> l_strpbrk a_5 a_4 = l_strpbrk a_2 a_4 -> region (base a_4) ≤ 0%Z -> region (base a_5) ≤ 0%Z -> linked t -> sconst t_1 -> addr_le a_4 a_7 -> addr_le a_5 a_2 -> addr_le a_5 a_8 -> is_sint8 x -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_4 -> p_valid_str t t_1 a_5 -> addr_lt a_7 a_9 -> addr_lt a_8 a_10 -> addr_le a_2 a_10 -> (if decide (x = 0%Z) then Mk_addr 0%Z 0%Z = a else a_2 = a ∧ a_3 = a ∧ a_3 = a_2 ∧ a_6 = a_5 ∧ ¬ x_1 = 0%Z ∧ x_1 = x_2 ∧ addr_le a_4 a_1 ∧ addr_le a_6 a ∧ p_valid_str t t_1 a_1 ∧ addr_lt a (shift a_6 (l_strlen t_1 a_6)) ∧ addr_lt a_1 a_9 ∧ addr_le a_1 a_9 ∧ (p_in_array t_1 a_4 x_2 -> p_in_array t_1 a_1 x_2) ∧ (∀(a_11 : addr), addr_lt a_11 a_1 -> addr_le a_4 a_11 -> ¬ x_2 = t_1 a_11) ∧ (∀(a_12 : addr) (a_11 : addr), addr_lt a_12 a -> addr_le a_4 a_11 -> addr_le a_6 a_12 -> addr_lt a_11 a_9 -> ¬ t_1 a_12 = t_1 a_11)) -> (∀(a_12 : addr) (a_11 : addr), addr_lt a_12 a_2 -> addr_le a_4 a_11 -> addr_le a_5 a_12 -> addr_lt a_11 a_9 -> ¬ t_1 a_12 = t_1 a_11) -> (∃(a_11 : addr), x_2 = t_1 a_11 ∧ addr_le a_4 a_11 ∧ addr_le a_11 a_9).
Admitted.
