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
Require Import Why3.Cint.Cint.
Require Import should_we_balance.A_thread_variables_properties.A_thread_variables_properties.
Require Import should_we_balance.Compound.Compound.
Open Scope Z_scope.
Theorem goal4 (t_3 : addr -> addr) (a : addr) (a_1 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (i : Z) (t : Z -> Z) : let a_2 : addr := t_3 (shift a 0%Z) in let a_3 : addr := shift a_2 0%Z in let a_4 : addr := t_3 (shift a_1 0%Z) in let a_5 : addr := shift a_4 0%Z in let a_6 : addr -> Z := havoc t_1 t_2 a_5 l_size in let a_7 : Z := a_6 (shift a_2 i) in ¬ to_uint32 i = l_size -> 0%Z ≤ i -> i ≤ l_size -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_3 -> linked t -> is_sint32 i -> valid_rd t a 1%Z -> valid_rd t a_1 1%Z -> valid_rd t a_3 l_size -> valid_rw t a_5 l_size -> separated a_5 l_size a_3 l_size -> is_uint8 a_7 -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < i -> (¬ a_6 (shift a_4 i_1) = 0%Z) = (¬ a_6 (shift a_2 i_1) = 0%Z)) -> a_7 = 0%Z ∨ a_7 = 1%Z.
Admitted.
