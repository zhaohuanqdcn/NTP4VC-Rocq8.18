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
Theorem goal6 (t_2 : addr -> Z) (a : addr) (a_3 : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> Z) (t_3 : addr -> Z) (t : Z -> Z) : let x : Z := t_2 a in let x_1 : Z := base a_3 in let x_2 : Z := base a_1 in let x_3 : Z := offset a_1 in let x_4 : Z := offset a in let x_5 : Z := l_strlen t_2 a_1 in let a_4 : addr := shift a_3 0%Z in let m : addr -> Z := fun_updt t_2 a_2 x in ¬ x = 0%Z -> ¬ x_1 = x_2 -> x_3 + offset a_2 = x_4 + offset a_3 -> x_3 + x_5 = x_4 + l_strlen t_2 a -> havoc t_1 t_3 a_4 (1%Z + x_5) = t_2 -> region x_2 ≤ 0%Z -> region x_1 ≤ 0%Z -> linked t -> sconst t_3 -> addr_le a_1 a -> addr_le a_3 a_2 -> is_sint8 x -> p_valid_str t t_2 a -> p_valid_str t t_3 a_1 -> addr_le a (shift a_1 x_5) -> addr_le a_2 (shift a_3 x_5) -> valid_rw t a_4 (1%Z + l_strlen t_3 a_1) -> (∀(i : Z), 0%Z ≤ i -> i + x_3 < x_4 -> t_2 (shift a_3 i) = t_2 (shift a_1 i)) -> 1%Z + x_4 + l_strlen m (shift a 1%Z) = x_3 + l_strlen m a_1.
Admitted.
