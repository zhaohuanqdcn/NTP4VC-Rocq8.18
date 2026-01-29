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
Require Import equal_range.S1_size_type_pair.S1_size_type_pair.
Require Import Why3.Cint.Cint.
Require Import equal_range.Axiomatic.Axiomatic.
Require Import equal_range.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (s : s1_size_type_pair) (i_1 : Z) (a : addr) (t : Z -> Z) (i : Z) (t_1 : addr -> Z) : let x : Z := f1_size_type_pair_first s in let x_1 : Z := f1_size_type_pair_second s in x ≤ i_1 -> x_1 ≤ i_1 -> 0%Z ≤ x -> 0%Z ≤ x_1 -> region (base a) ≤ 0%Z -> iss1_size_type_pair s -> linked t -> is_uint32 i_1 -> is_sint32 i -> is_uint32 x -> is_uint32 x_1 -> p_sorted_1' t_1 a 0%Z i_1 -> valid_rd t (shift a 0%Z) i_1 -> p_lowerbound_1' t_1 a x i_1 i -> p_strictupperbound_1' t_1 a 0%Z x i -> p_upperbound_1' t_1 a 0%Z x_1 i -> p_strictlowerbound_1' t_1 a x_1 i_1 i -> p_constantrange t_1 a x x_1 i.
Proof.
Admitted.
