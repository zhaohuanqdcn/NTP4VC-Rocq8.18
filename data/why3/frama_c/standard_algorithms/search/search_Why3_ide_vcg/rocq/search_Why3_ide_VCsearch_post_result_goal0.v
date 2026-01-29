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
Require Import search.Compound.Compound.
Require Import search.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (i_3 : Z) (a_1 : addr) (i : Z) (a : addr) (t : Z -> Z) (i_2 : Z) (i_4 : Z) (p_1 : bool) (t_1 : addr -> Z) (p : bool) : let x : Z := i_1 + i_3 in let a_2 : addr := shift a_1 i in region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint32 i -> is_uint32 i_1 -> is_uint32 i_2 -> is_uint32 i_3 -> is_sint32 i_4 -> valid_rd t (shift a 0%Z) i_1 -> valid_rd t (shift a_1 0%Z) i_2 -> (if decide (i_1 ≤ i_2) then p_1 = false ∧ i_2 ≤ 4294967295%Z + i_1 ∧ x ≤ 1%Z + i_2 ∧ ¬ p_hassubrange_1' t_1 a_1 0%Z (i_1 + i_3 - 1%Z) a i_1 ∧ (if decide (x ≤ i_2) then p = false ∧ i_3 = i ∧ ¬ i_4 = 0%Z ∧ valid_rd t a_2 i_1 ∧ p_equalranges_1' t_1 t_1 a_2 i_1 a else i_2 = i) else i_2 = i) -> 0%Z ≤ i ∧ i ≤ i_2.
Proof.
Admitted.
