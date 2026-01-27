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
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Open Scope Z_scope.
Theorem goal5 (a : addr) (t_1 : addr -> Z) (a_1 : addr) (t_9 : addr -> Z) (t_10 : addr -> Z) (t_11 : addr -> Z) (t_12 : addr -> Z) (t_7 : addr -> Z) (t : Z -> Z) (t_8 : addr -> Z) (i : Z) (i_1 : Z) (t_2 : addr -> Z) (t_5 : addr -> Z) (t_6 : addr -> Z) (t_4 : addr -> Z) (t_3 : addr -> Z) : let a_2 : addr := shift a 0%Z in let x : Z := t_1 a_1 in let x_1 : Z := t_9 a_2 in let a_3 : addr := shift a 1%Z in let x_2 : Z := t_10 a_3 in let x_3 : Z := t_11 (shift a 2%Z) in let x_4 : Z := t_12 a_3 in t_7 a_1 = 16%Z -> t_12 a_2 = 48%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_8 -> is_uint8 i -> is_sint8 i_1 -> is_uint32 x -> valid_rw t a_1 1%Z -> is_sint8 x_1 -> is_sint8 x_2 -> is_sint8 x_3 -> is_sint8 x_4 -> valid_rd t a_2 3%Z -> is_sint8 (l_tolower x_4) -> ¬ (if decide (x = 0%Z) then t_2 = t_1 ∧ t_9 = t_8 ∧ (if decide (x_1 = 48%Z) then t_10 = t_9 ∧ l_tolower x_2 = i_1 ∧ (if decide (i_1 = 120%Z) then p_isxdigit x_3 = (¬ i = 0%Z) ∧ (if decide (i = 0%Z) then fun_updt t_5 a_1 8%Z = t_7 else fun_updt t_6 a_1 16%Z = t_7) else fun_updt t_4 a_1 8%Z = t_7) else t_3 = t_2 ∧ t_12 = t_9 ∧ fun_updt t_3 a_1 10%Z = t_7) else t_7 = t_1 ∧ t_12 = t_8).
Admitted.
