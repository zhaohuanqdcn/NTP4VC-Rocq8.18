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
Open Scope Z_scope.
Theorem goal9 (t_2 : addr -> Z) (a_1 : addr) (t_1 : addr -> Z) (a : addr) (a_2 : addr) (t : Z -> Z) (i : Z) (t_3 : addr -> Z) : let x : Z := l_strlen t_2 a_1 in let a_3 : addr := shift a_1 x in let a_4 : addr -> Z := havoc t_1 t_2 (shift a_1 0%Z) x in let a_5 : Z := a_4 a in let x_1 : Z := t_2 a_2 in t_2 a_3 = 0%Z -> ¬ a_5 = 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_2 -> is_sint8 i -> addr_le a_1 a -> addr_le a_1 a_2 -> is_sint8 x_1 -> p_valid_str t t_2 a_1 -> is_uint64 x -> addr_lt a_2 (shift a 1%Z) -> addr_le a a_3 -> is_sint8 a_5 -> p_valid_str t a_4 a -> p_valid_str t a_4 a_1 -> (if decide (a_5 = x_1) then fun_updt a_4 a i = t_3 else a_4 = t_3) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 < x -> ¬ t_2 (shift a_1 i_1) = 0%Z) -> (∀(a_6 : addr), addr_le a a_6 -> addr_lt a_6 a_3 -> a_4 a_6 = t_2 a_6) -> (∀(a_6 : addr), x_1 = t_2 a_6 -> addr_lt a_6 a -> addr_le a_1 a_6 -> a_4 a_6 = i) -> (∀(a_6 : addr), let x_2 : Z := t_2 a_6 in ¬ x_1 = x_2 -> addr_lt a_6 a -> addr_le a_1 a_6 -> a_4 a_6 = x_2) -> t_3 a_2 = i.
Admitted.
