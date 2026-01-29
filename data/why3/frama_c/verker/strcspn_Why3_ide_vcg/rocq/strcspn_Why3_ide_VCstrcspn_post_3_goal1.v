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
Require Import verker.A_StrCSpn.A_StrCSpn.
Require Import verker.A_StrSpn.A_StrSpn.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a_3 : addr) (a_2 : addr) (t_1 : addr -> Z) (a_4 : addr) (a : addr) (a_1 : addr) (t : Z -> Z) (a_5 : addr) (a_6 : addr) (i : Z) (i_1 : Z) (i_2 : Z) : let x : Z := offset a_3 in let x_1 : Z := offset a_2 in let x_2 : Z := l_strlen t_1 a_2 in let x_3 : Z := t_1 a_3 in let x_4 : Z := t_1 a_4 in let a_7 : addr := shift a (l_strlen t_1 a) in let x_5 : Z := t_1 a_1 in x + l_strcspn a_3 a = x_1 + l_strcspn a_2 a -> x_1 ≤ x -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x ≤ x_1 + x_2 -> linked t -> sconst t_1 -> addr_le a a_5 -> addr_le a_2 a_3 -> addr_le a_2 a_6 -> is_sint8 x_3 -> is_sint8 x_4 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> addr_lt a_6 (shift a_2 i) -> is_uint64 (x - x_1) -> addr_lt a_5 a_7 -> addr_le a_3 (shift a_2 x_2) -> (if decide (x_3 = 0%Z) then i_1 = i ∧ i_1 + x_1 = x else a_4 = a_3 ∧ i_2 = i ∧ ¬ x_5 = 0%Z ∧ x_4 = x_5 ∧ i_2 + x_1 = offset a_4 ∧ addr_le a a_1 ∧ p_valid_str t t_1 a_1 ∧ p_in_array t_1 a x_4 ∧ p_in_array t_1 a_1 x_4 ∧ addr_le a_1 a_7 ∧ (∀(a_8 : addr), addr_lt a_8 a_1 -> addr_le a a_8 -> ¬ x_4 = t_1 a_8)) -> (∀(a_9 : addr) (a_8 : addr), addr_lt a_9 a_3 -> addr_le a a_8 -> addr_le a_2 a_9 -> addr_lt a_8 a_7 -> ¬ t_1 a_9 = t_1 a_8) -> ¬ t_1 a_6 = t_1 a_5.
Proof.
Admitted.
