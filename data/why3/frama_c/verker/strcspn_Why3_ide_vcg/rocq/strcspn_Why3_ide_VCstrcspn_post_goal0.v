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
Require Import verker.A_StrCSpn.A_StrCSpn.
Require Import verker.A_StrSpn.A_StrSpn.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (a_3 : addr) (a_2 : addr) (a : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (a_4 : addr) (i : Z) (a_1 : addr) (t : Z -> Z) : let x : Z := offset a_3 in let x_1 : Z := offset a_2 in let x_2 : Z := l_strcspn a_2 a in let x_3 : Z := l_strlen t_1 a_2 in let x_4 : Z := t_1 a_3 in let x_5 : Z := t_2 a_4 in let x_6 : Z := i + x_1 in let x_7 : Z := t_2 a_1 in x + l_strcspn a_3 a = x_1 + x_2 -> x_1 ≤ x -> region (base a) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> x ≤ x_1 + x_3 -> linked t -> sconst t_1 -> is_uint64 i -> addr_le a_2 a_3 -> is_sint8 x_4 -> is_sint8 x_5 -> p_valid_str t t_1 a -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> is_uint64 (x - x_1) -> addr_le a_3 (shift a_2 x_3) -> (if decide (x_4 = 0%Z) then x_6 = x else a_4 = a_3 ∧ t_2 = t_1 ∧ ¬ x_7 = 0%Z ∧ x_5 = x_7 ∧ x_6 = offset a_4 ∧ addr_le a a_1 ∧ p_valid_str t t_2 a_1 ∧ p_in_array t_2 a x_5 ∧ p_in_array t_2 a_1 x_5 ∧ addr_le a_1 (shift a (l_strlen t_2 a)) ∧ (∀(a_5 : addr), addr_lt a_5 a_1 -> addr_le a a_5 -> ¬ x_5 = t_2 a_5)) -> (∀(a_6 : addr) (a_5 : addr), addr_lt a_6 a_3 -> addr_le a a_5 -> addr_le a_2 a_6 -> addr_lt a_5 (shift a (l_strlen t_1 a)) -> ¬ t_1 a_6 = t_1 a_5) -> x_2 = i.
Admitted.
