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
Require Import find_end.Compound.Compound.
Require Import find_end.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal9 (a_1 : addr) (i_4 : Z) (i : Z) (i_3 : Z) (a : addr) (t : Z -> Z) (i_1 : Z) (i_2 : Z) (t_1 : addr -> Z) : let a_2 : addr := shift a_1 i_4 in let x : Z := i + i_3 - 1%Z in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_uint32 i_4 -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i_1 -> p_hassubrange_1' t_1 a_1 0%Z i_1 a i -> (if decide (0%Z < i) then if decide (i ≤ i_1) then i_2 = i_1 ∧ i_2 < i + i_3 ∧ i_2 ≤ 4294967295%Z + i ∧ (i_4 < i_2 -> p_equalranges_1' t_1 t_1 a_2 i a) ∧ (i_4 = i_2 -> ¬ p_hassubrange_1' t_1 a_1 0%Z x a i) ∧ (i_4 < i_2 -> ¬ p_hassubrange_1' t_1 a_1 (1%Z + i_4) x a i) ∧ (i_4 = i_2 ∨ i + i_4 ≤ i_2) else i_4 = i_1 else i_4 = i_1) -> p_equalranges_1' t_1 t_1 a_2 i a.
Proof.
Admitted.
