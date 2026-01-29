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
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import rotate.Compound.Compound.
Require Import rotate.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (i : Z) (a : addr) (t : Z -> Z) (t_3 : addr -> Z) (t_5 : addr -> Z) (t_7 : addr -> Z) (t_1 : addr -> Z) (t_6 : addr -> Z) (t_4 : addr -> Z) (t_2 : addr -> Z) : let x : Z := i_1 - i in let a_1 : addr := shift a 0%Z in let a_2 : addr := shift a x in 0%Z ≤ i -> region (base a) ≤ 0%Z -> i ≤ 4294967295%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 x -> valid_rw t a_1 i_1 -> (if decide (i < i_1) then if decide (0%Z < i) then havoc t_3 t_5 a_1 i_1 = t_7 ∧ havoc t_1 t_6 a_1 x = t_4 ∧ havoc t_2 t_4 a_2 i = t_5 ∧ valid_rw t a_1 x ∧ p_reverse_5' t_4 t_6 a 0%Z x ∧ valid_rw t a_2 i ∧ p_reverse_4' t_5 t_6 a 0%Z x 0%Z ∧ p_reverse_4' t_5 t_6 a x i_1 x ∧ p_reverse_4' t_7 t_5 a 0%Z x i ∧ p_reverse_4' t_7 t_5 a x i_1 0%Z ∧ p_reverse_5' t_5 t_4 a_2 0%Z i else t_7 = t_6 else t_7 = t_6) -> p_equalranges_4' t_7 t_6 a 0%Z x i.
Proof.
Admitted.
