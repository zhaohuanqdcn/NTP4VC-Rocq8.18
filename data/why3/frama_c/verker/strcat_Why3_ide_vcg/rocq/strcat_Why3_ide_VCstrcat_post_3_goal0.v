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
Theorem goal0 (t_2 : addr -> Z) (a : addr) (t_3 : addr -> Z) (a_1 : addr) (i : Z) (t_1 : addr -> Z) (t : Z -> Z) : let x : Z := l_strlen t_2 a in let a_2 : addr := shift a x in let m : addr -> Z := fun_updt t_3 a_2 0%Z in let x_1 : Z := l_strlen t_3 a_1 in let x_2 : Z := l_strlen t_2 a_1 in let a_3 : addr := shift a 0%Z in let a_4 : addr := shift a i in t_3 a_1 = 0%Z -> t_2 a_2 = 0%Z -> m (shift a_1 0%Z) = 0%Z -> l_strlen m a = x -> l_strlen m a_1 = 0%Z -> havoc t_1 t_2 a_2 (1%Z + x_1) = t_3 -> 0%Z ≤ i -> i < x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> x + x_2 ≤ 18446744073709551615%Z -> linked t -> sconst t_2 -> addr_le a_1 a_1 -> p_valid_str t t_2 a -> p_valid_str t t_2 a_1 -> p_valid_str t t_3 a_1 -> is_uint64 x -> addr_le a a_2 -> addr_le a_1 (shift a_1 x_1) -> addr_le a_2 a_2 -> valid_rw t a_3 (1%Z + x) -> p_valid_str t t_2 a_2 -> valid_rw t a_3 (1%Z + x + x_2) -> p_valid_str t m a -> addr_le a_2 (shift a (x + x_1)) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> ¬ t_2 (shift a i_1) = 0%Z) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> ¬ t_3 (shift a i_1) = 0%Z) -> (∀(i_1 : Z), let a_5 : addr := shift a i_1 in 0%Z ≤ i_1 -> i_1 < x -> m a_5 = t_2 a_5) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> ¬ m (shift a i_1) = 0%Z) -> m a_4 = t_2 a_4.
Admitted.
