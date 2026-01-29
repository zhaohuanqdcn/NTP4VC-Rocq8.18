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
Require Import stack_equal.Compound.Compound.
Require Import stack_equal.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal1 (a : addr) (t_1 : addr -> Z) (a_1 : addr) (t_2 : addr -> addr) (t : Z -> Z) (i : Z) (i_1 : Z) (p : bool) : let a_2 : addr := shift a 2%Z in let x : Z := t_1 a_2 in let a_3 : addr := shift a_1 2%Z in let x_1 : Z := t_1 a_3 in let a_4 : addr := shift a_1 0%Z in let a_5 : addr := t_2 a_4 in let a_6 : addr := shift a 0%Z in let a_7 : addr := t_2 a_6 in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> framed t_2 -> linked t -> is_sint32 i -> is_sint32 i_1 -> valid_rw t a 3%Z -> valid_rw t a_1 3%Z -> is_uint32 x -> is_uint32 x_1 -> p_invariant t t_2 t_1 a -> p_invariant t t_2 t_1 a_1 -> valid_rd t a_2 1%Z -> valid_rd t a_3 1%Z -> (if decide (x_1 = x) then p = false ∧ p_equalranges_1' t_1 t_1 a_5 x_1 a_7 = (¬ i_1 = 0%Z) ∧ valid_rd t a_6 1%Z ∧ valid_rd t a_4 1%Z ∧ valid_rd t (shift a_7 0%Z) x_1 ∧ valid_rd t (shift a_5 0%Z) x_1 ∧ (if decide (i_1 = 0%Z) then i = 0%Z else i = 1%Z) else i = 0%Z) -> (¬ p_equal t_2 t_1 t_2 t_1 a_1 a) = (i = 0%Z).
Proof.
Admitted.
