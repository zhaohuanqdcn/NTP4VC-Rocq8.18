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
Open Scope Z_scope.
Theorem goal3 (t_2 : addr -> Z) (a : addr) (a_1 : addr) (i_2 : Z) (t_1 : addr -> Z) (i : Z) (i_1 : Z) (t : Z -> Z) : let x : Z := l_strlen t_2 a in let x_1 : Z := l_strlen t_2 a_1 in let a_2 : addr := shift a_1 x_1 in let x_2 : Z := to_uint64 (i_2 - x_1) in let a_3 : addr -> Z := havoc t_1 t_2 a_2 i in t_2 (shift a x) = 0%Z -> t_2 a_2 = 0%Z -> 0%Z ≤ i_1 -> i_1 < i -> x_1 < i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> i < x_2 -> x + x_1 ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> is_uint64 i -> is_uint64 i_2 -> p_valid_str t t_2 a -> p_valid_str t t_2 a_1 -> is_uint64 x -> is_uint64 x_1 -> valid_rd t (shift a 0%Z) i -> valid_rw t (shift a_1 0%Z) (1%Z + i_2) -> valid_rw t a_2 i -> p_valid_str t t_2 a_2 -> (if decide (x_2 ≤ x) then to_uint64 (x_2 - 1%Z) = i else x = i) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < x -> ¬ t_2 (shift a i_3) = 0%Z) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < x_1 -> ¬ t_2 (shift a_1 i_3) = 0%Z) -> (∀(i_3 : Z), 0%Z ≤ i_3 -> i_3 < i -> a_3 (shift a_1 (i_3 + x_1)) = a_3 (shift a i_3)) -> a_3 (shift a_1 (i_1 + x_1)) = a_3 (shift a i_1).
Admitted.
