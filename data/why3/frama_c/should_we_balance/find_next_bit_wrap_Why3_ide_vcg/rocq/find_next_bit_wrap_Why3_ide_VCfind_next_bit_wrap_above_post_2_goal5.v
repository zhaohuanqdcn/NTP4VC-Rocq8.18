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
Require Import Why3.Memory.Memory.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import Why3.Cint.Cint.
Require Import should_we_balance.Compound.Compound.
Open Scope Z_scope.
Theorem goal5 (t_1 : addr -> Z) (a : addr) (i_3 : Z) (i_4 : Z) (i_5 : Z) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) (i_6 : Z) : let x : Z := t_1 (shift a i_3) in let x_1 : Z := t_1 (shift a i_4) in let x_2 : Z := t_1 (shift a i_5) in let a_1 : addr := shift a 0%Z in let x_3 : Z := to_uint32 i_4 in ¬ t_1 (shift a i_2) = 0%Z -> i_1 < i -> i_2 < i -> i_1 ≤ i_2 -> i ≤ l_size -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_3 -> is_uint32 i_6 -> is_sint32 i_4 -> is_sint32 i_5 -> is_uint8 x -> is_uint8 x_1 -> is_uint8 x_2 -> valid_rd t a_1 i -> (if decide (x_3 < i) then x_3 = i_3 else to_uint32 i_5 = i_6 ∧ i_1 ≤ l_size ∧ valid_rd t a_1 i_1 ∧ (if decide (i_6 < i_1) then i_6 = i_3 else i_3 = i) ∧ ((∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 < i_1 -> t_1 (shift a i_7) = 0%Z) -> i_5 = i_1) ∧ ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ 0%Z ≤ i_7 ∧ i_7 < i_1) -> ¬ x_2 = 0%Z) ∧ ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ 0%Z ≤ i_7 ∧ i_7 < i_1) -> 0%Z ≤ i_5 ∧ i_5 < i_1) ∧ ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ 0%Z ≤ i_7 ∧ i_7 < i_1) -> (∀(i_7 : Z), 0%Z ≤ i_7 -> i_7 < i_5 -> t_1 (shift a i_7) = 0%Z))) -> ((∀(i_7 : Z), i_7 < i -> i_1 ≤ i_7 -> t_1 (shift a i_7) = 0%Z) -> i_4 = i) -> ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ i_7 < i ∧ i_1 ≤ i_7) -> ¬ x_1 = 0%Z) -> ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ i_7 < i ∧ i_1 ≤ i_7) -> i_4 < i) -> ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ i_7 < i ∧ i_1 ≤ i_7) -> i_4 < i ∧ i_1 ≤ i_4) -> ((∃(i_7 : Z), ¬ t_1 (shift a i_7) = 0%Z ∧ i_7 < i ∧ i_1 ≤ i_7) -> (∀(i_7 : Z), i_1 ≤ i_7 -> i_7 < i_4 -> t_1 (shift a i_7) = 0%Z)) -> ¬ x = 0%Z.
Admitted.
