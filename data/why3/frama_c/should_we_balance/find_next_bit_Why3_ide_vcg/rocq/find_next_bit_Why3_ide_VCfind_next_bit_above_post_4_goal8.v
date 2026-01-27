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
Require Import should_we_balance.Compound.Compound.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal8 (a : addr) (i_4 : Z) (t_1 : addr -> Z) (i_2 : Z) (i : Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) (i_5 : Z) : let a_1 : addr := shift a i_4 in ¬ t_1 (shift a i_2) = 0%Z -> i_2 < i -> i_1 ≤ i_2 -> i_1 ≤ i_3 -> i ≤ l_size -> region (base a) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_3 -> is_uint32 i_4 -> is_sint32 i_5 -> is_uint8 (t_1 (shift a i_3)) -> is_uint8 (t_1 (shift a i_5)) -> valid_rd t (shift a 0%Z) i -> (if decide (i_3 < i) then i_4 = i_3 ∧ to_sint32 i_4 = i_5 ∧ t_1 a_1 = 1%Z ∧ valid_rd t a_1 1%Z else to_sint32 i = i_5) -> (∀(i_6 : Z), i_1 ≤ i_6 -> i_6 < i_3 -> t_1 (shift a i_6) = 0%Z) -> i_5 < i.
Admitted.
