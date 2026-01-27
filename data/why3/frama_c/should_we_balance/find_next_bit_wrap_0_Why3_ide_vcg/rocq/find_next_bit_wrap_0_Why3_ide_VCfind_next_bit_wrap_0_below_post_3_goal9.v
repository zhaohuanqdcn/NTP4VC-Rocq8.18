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
Theorem goal9 (t_1 : addr -> Z) (a : addr) (i_4 : Z) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) (i_3 : Z) : let x : Z := t_1 (shift a i_4) in let a_1 : addr := shift a 0%Z in let x_1 : Z := to_uint32 i_4 in ¬ t_1 (shift a i_2) = 0%Z -> i_1 < i -> 0%Z ≤ i_2 -> i_2 < i_1 -> i ≤ l_size -> i_1 ≤ l_size -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_3 -> is_sint32 i -> is_sint32 i_4 -> is_uint8 (t_1 (shift a i)) -> is_uint8 (t_1 (shift a i_3)) -> is_uint8 x -> valid_rd t a_1 i -> valid_rd t a_1 i_1 -> (if decide (x_1 < i_1) then x_1 = i_3 else i_3 = i) -> ((∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_1 -> t_1 (shift a i_5) = 0%Z) -> i_4 = i_1) -> ((∃(i_5 : Z), ¬ t_1 (shift a i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < i_1) -> ¬ x = 0%Z) -> ((∃(i_5 : Z), ¬ t_1 (shift a i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < i_1) -> 0%Z ≤ i_4 ∧ i_4 < i_1) -> ((∃(i_5 : Z), ¬ t_1 (shift a i_5) = 0%Z ∧ 0%Z ≤ i_5 ∧ i_5 < i_1) -> (∀(i_5 : Z), 0%Z ≤ i_5 -> i_5 < i_4 -> t_1 (shift a i_5) = 0%Z)) -> (∀(i_5 : Z), i_5 < i -> i_1 ≤ i_5 -> t_1 (shift a i_5) = 0%Z) -> i_3 < i.
Admitted.
