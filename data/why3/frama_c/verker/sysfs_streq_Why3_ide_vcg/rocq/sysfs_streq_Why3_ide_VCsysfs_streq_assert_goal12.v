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
Require Import verker.A_StrnCmp.A_StrnCmp.
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal12 (a_3 : addr) (i : Z) (t_1 : addr -> Z) (a_2 : addr) (i_2 : Z) (i_1 : Z) (t : Z -> Z) (p : bool) (a_1 : addr) (a : addr) : let a_4 : addr := shift a_3 i in let x : Z := t_1 a_4 in let a_5 : addr := shift a_2 i in let x_1 : Z := t_1 (shift a_2 i_2) in let x_2 : Z := t_1 (shift a_3 i_2) in let x_3 : Z := t_1 (shift a_2 i_1) in let x_4 : Z := t_1 (shift a_3 i_1) in i ≤ l_strlen t_1 a_2 -> i ≤ l_strlen t_1 a_3 -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> linked t -> sconst t_1 -> is_uint64 i -> p_valid_str t t_1 a_2 -> p_valid_str t t_1 a_3 -> p_strnequal t_1 a_3 a_2 i -> is_sint8 x -> p_valid_str t t_1 a_5 -> p_valid_str t t_1 a_4 -> (if decide (x = 0%Z) then p = false ∧ 0%Z ≤ i_1 ∧ i_1 < i ∧ is_uint64 i_1 else p = true ∧ ¬ t_1 a_1 = t_1 a ∧ a_5 = a ∧ a_4 = a_1 ∧ 0%Z ≤ i_2 ∧ i_2 < i ∧ is_uint64 i_2) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i -> t_1 (shift a_3 i_3) = t_1 (shift a_2 i_3)) -> (if decide (p = true) then ¬ x_1 = 0%Z ∧ ¬ x_2 = 0%Z ∧ x_2 = x_1 else ¬ x_3 = 0%Z ∧ ¬ x_4 = 0%Z ∧ x_4 = x_3).
Admitted.
