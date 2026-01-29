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
Require Import verker.A_StrPBrk.A_StrPBrk.
Require Import verker.A_StrSpn.A_StrSpn.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal21 (t_1 : addr -> Z) (a_1 : addr) (a_3 : addr) (a_4 : addr) (a : addr) (a_2 : addr) (a_7 : addr) (a_6 : addr) (t : Z -> Z) (a_9 : addr) (a_8 : addr) (a_5 : addr) : let x : Z := t_1 a_1 in let a_10 : addr := shift a_3 (l_strlen t_1 a_3) in let a_11 : addr := shift a_4 (l_strlen t_1 a_4) in let x_1 : Z := t_1 a in let x_2 : Z := t_1 a_2 in t_1 a_7 = t_1 a_6 -> l_strpbrk a_4 a_3 = l_strpbrk a_1 a_3 -> region (base a_3) ≤ 0%Z -> region (base a_4) ≤ 0%Z -> linked t -> sconst t_1 -> addr_lt a_9 a_2 -> addr_le a_3 a_6 -> addr_le a_3 a_8 -> addr_le a_4 a_1 -> addr_le a_4 a_7 -> addr_le a_4 a_9 -> is_sint8 x -> p_valid_str t t_1 a_1 -> p_valid_str t t_1 a_3 -> p_valid_str t t_1 a_4 -> addr_lt a_6 a_10 -> addr_lt a_7 a_11 -> addr_lt a_8 a_10 -> addr_le a_1 a_11 -> (if decide (x = 0%Z) then Mk_addr 0%Z 0%Z = a_2 else a_2 = a_1 ∧ a_5 = a_4 ∧ ¬ x_1 = 0%Z ∧ x_2 = x_1 ∧ addr_le a_3 a ∧ addr_le a_5 a_2 ∧ p_valid_str t t_1 a ∧ addr_lt a a_10 ∧ addr_lt a_2 (shift a_5 (l_strlen t_1 a_5)) ∧ addr_le a a_10 ∧ (p_in_array t_1 a_3 x_2 -> p_in_array t_1 a x_2) ∧ (∀(a_12 : addr), addr_lt a_12 a -> addr_le a_3 a_12 -> ¬ x_2 = t_1 a_12) ∧ (∀(a_13 : addr) (a_12 : addr), addr_lt a_13 a_2 -> addr_le a_3 a_12 -> addr_le a_5 a_13 -> addr_lt a_12 a_10 -> ¬ t_1 a_13 = t_1 a_12)) -> (∀(a_13 : addr) (a_12 : addr), addr_lt a_13 a_1 -> addr_le a_3 a_12 -> addr_le a_4 a_13 -> addr_lt a_12 a_10 -> ¬ t_1 a_13 = t_1 a_12) -> ¬ t_1 a_9 = t_1 a_8.
Proof.
Admitted.
