From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Require Import Why3.Qed.Qed.
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.A_Strlen.A_Strlen.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal9 (a_1 : addr) (a : addr) (t_2 : addr -> Z) (t_1 : addr -> Z) (t_3 : addr -> Z) (i_2 : Z) (i_3 : Z) (t_4 : addr -> Z) (i_1 : Z) (t : Z -> Z) (p : bool) (i : Z) : let x : Z := base a_1 in let x_1 : Z := base a in let x_2 : Z := l_strlen t_2 a in let a_2 : addr := shift a_1 0%Z in let a_3 : addr -> Z := havoc t_1 t_3 a_2 i_2 in let a_4 : addr -> Z := fun_updt a_3 (shift a_1 i_2) 0%Z in ¬ x = x_1 -> t_2 (shift a x_2) = 0%Z -> 0%Z ≤ i_3 -> i_3 < l_strlen t_4 a -> x_2 < i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> linked t -> sconst t_2 -> is_uint64 i_1 -> is_uint64 i_2 -> p_valid_str t t_2 a -> is_uint64 x_2 -> valid_rw t a_2 i_1 -> (if decide (i_1 = 0%Z) then t_4 = t_2 else p = false ∧ i_2 = i ∧ t_3 = t_2 ∧ l_strlen t_3 a = i_2 ∧ a_4 = t_4 ∧ l_strlen a_4 a_1 = i_2 ∧ valid_rd t (shift a 0%Z) i_2 ∧ valid_rw t a_2 i_2 ∧ p_valid_str t a_4 a_1 ∧ (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < i_2 -> a_3 (shift a_1 i_4) = a_3 (shift a i_4))) -> (∀(i_4 : Z), 0%Z ≤ i_4 -> i_4 < x_2 -> ¬ t_2 (shift a i_4) = 0%Z) -> t_4 (shift a_1 i_3) = t_4 (shift a i_3).
Proof.
Admitted.
