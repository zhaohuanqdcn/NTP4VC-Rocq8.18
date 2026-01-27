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
Require Import Why3.Cint.Cint.
Require Import verker.A_Strnlen.A_Strnlen.
Require Import verker.Compound.Compound.
Require Import verker.A_Strlen.A_Strlen.
Open Scope Z_scope.
Theorem goal11 (t_1 : addr -> Z) (a_3 : addr) (a_1 : addr) (a_2 : addr) (i : Z) (a : addr) (i_1 : Z) (t : Z -> Z) : let x : Z := t_1 a_3 in let x_1 : Z := offset a_1 in let x_2 : Z := offset a_2 in let x_3 : Z := i + x_2 - x_1 in let x_4 : Z := l_strnlen t_1 a_2 i in let x_5 : Z := i + x_2 in let x_6 : Z := t_1 a in let x_7 : Z := t_1 a_1 in let a_4 : addr := shift a_2 x_4 in x = to_sint8 i_1 -> x_1 + l_strnlen t_1 a_1 x_3 = x_2 + x_4 -> x_2 ≤ x_1 -> region (base a_2) ≤ 0%Z -> x_1 ≤ x_5 -> linked t -> sconst t_1 -> is_sint32 i_1 -> is_uint64 i -> addr_le a_2 a_1 -> addr_le a_2 a_3 -> is_sint8 x_6 -> is_sint8 x_7 -> p_valid_strn t t_1 a_2 i -> is_uint64 x_3 -> addr_lt a_3 a_4 -> addr_le a_1 a_4 -> p_valid_strn t t_1 a_1 x_3 -> (if decide (x_5 = x_1) then Mk_addr 0%Z 0%Z = a else if decide (x_7 = 0%Z) then Mk_addr 0%Z 0%Z = a else a_1 = a ∧ x = x_6) -> (∀(a_5 : addr), addr_lt a_5 a_1 -> addr_le a_2 a_5 -> ¬ x = t_1 a_5) -> x = x_6.
Admitted.
