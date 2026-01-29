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
Require Import verker.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import verker.A_Ctype.A_Ctype.
Require Import verker.A_IntBase.A_IntBase.
Open Scope Z_scope.
Theorem goal10 (a : addr) (t_8 : addr -> Z) (t_6 : addr -> Z) (t_1 : addr -> Z) (a_1 : addr) (t_5 : addr -> Z) (t : Z -> Z) (i : Z) (t_7 : addr -> Z) (t_3 : addr -> Z) (t_4 : addr -> Z) (t_2 : addr -> Z) (t_9 : addr -> Z) : let a_2 : addr := shift a 0%Z in let a_3 : addr := shift a 1%Z in let x : Z := t_8 a_3 in let x_1 : Z := t_6 a_3 in let x_2 : Z := l_tolower x_1 in t_1 a_1 = 0%Z -> t_5 a_1 = 16%Z -> t_6 a_2 = 48%Z -> t_8 a_2 = 48%Z -> l_tolower x = 120%Z -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> sconst t_6 -> is_uint8 i -> valid_rw t a_1 1%Z -> is_sint8 x_1 -> is_sint8 x -> valid_rd t a_2 3%Z -> is_sint8 x_2 -> (if decide (x_2 = 120%Z) then p_isxdigit (t_7 (shift a 2%Z)) = (¬ i = 0%Z) ∧ (if decide (i = 0%Z) then fun_updt t_3 a_1 8%Z = t_5 else fun_updt t_4 a_1 16%Z = t_5) else fun_updt t_2 a_1 8%Z = t_5) -> ¬ (p_is_oct t_9 a ∨ p_is_dec t_9 a).
Proof.
Admitted.
