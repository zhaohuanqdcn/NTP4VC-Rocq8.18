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
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Open Scope Z_scope.
Theorem goal0 (t_2 : addr -> Z) (a_1 : addr) (a : addr) (i_2 : Z) (t_3 : addr -> Z) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) (i_1 : Z) : let x : Z := l_strlen t_2 a_1 in let a_2 : addr := shift a_1 x in let x_1 : Z := l_strnlen t_2 a i_2 in let x_2 : Z := x + x_1 in let x_3 : Z := to_uint64 x_2 in let x_4 : Z := t_3 (shift a 0%Z) in let x_5 : Z := t_3 a_2 in let a_3 : addr := shift a x_1 in let x_6 : Z := t_2 a_3 in let a_4 : addr := shift a_1 0%Z in let a_5 : addr := shift a_1 (1%Z + x) in let x_7 : Z := t_3 a_5 in let a_6 : addr -> Z := havoc t_1 t_2 a_2 (1%Z + x_1) in let a_7 : Z := a_6 a in let a_8 : addr -> Z := fun_updt a_6 a_2 0%Z in let a_9 : addr -> Z := fun_updt (fun_updt a_6 a_2 a_7) a_5 0%Z in let a_10 : addr := shift a_1 i in ¬ i_2 = 0%Z -> t_2 a_2 = 0%Z -> t_3 (shift a_1 x_3) = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_2 -> i < x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i_2 + x ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> is_uint64 i_1 -> is_uint64 i_2 -> addr_le a a -> p_valid_str t t_2 a_1 -> p_valid_str t t_3 a_1 -> is_uint64 x -> p_valid_strn t t_2 a i_2 -> is_sint8 x_4 -> is_uint64 x_1 -> addr_le a_1 a_2 -> addr_le a_2 a_2 -> is_sint8 x_5 -> addr_le a a_3 -> is_sint8 x_6 -> p_valid_str t t_2 a_2 -> valid_rw t a_4 (1%Z + i_2 + x) -> is_sint8 x_7 -> addr_le a_2 (shift a_1 x_2) -> is_sint8 a_7 -> valid_rw t a_4 (1%Z + x_3) -> p_valid_str t a_6 a -> (if decide (a_7 = 0%Z) then i_2 = i_1 ∧ a_8 = t_3 ∧ (∀(i_3 : Z), let a_11 : addr := shift a_1 i_3 in 0%Z ≤ i_3 -> i_3 < x -> a_8 a_11 = t_2 a_11) else i_1 = 0%Z ∧ to_uint64 (i_2 - 1%Z) = 0%Z ∧ a_9 = t_3 ∧ (∀(i_3 : Z), let a_11 : addr := shift a_1 i_3 in 0%Z ≤ i_3 -> i_3 < x -> a_9 a_11 = t_2 a_11)) -> ((∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 ≤ i_2 -> ¬ t_2 (shift a i_3) = 0%Z) -> x_1 = i_2) -> ((∃(i_3 : Z), t_2 (shift a i_3) = 0%Z ∧ 0%Z ≤ i_3 ∧ i_3 ≤ i_2) -> x_6 = 0%Z) -> (0%Z < i_1 -> x_1 = 0%Z ∧ x_4 = 0%Z ∧ x_5 = 0%Z) -> ((∃(i_3 : Z), t_2 (shift a i_3) = 0%Z ∧ 0%Z ≤ i_3 ∧ i_3 ≤ i_2) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < x_1 -> ¬ t_2 (shift a i_3) = 0%Z)) -> (i_1 = 0%Z -> x_1 = i_2 ∧ x_7 = 0%Z) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < x -> ¬ t_2 (shift a_1 i_3) = 0%Z) -> t_3 a_10 = t_2 a_10.
Admitted.
