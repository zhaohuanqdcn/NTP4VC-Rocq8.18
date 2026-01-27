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
Require Import Why3.Memory.Memory.
Require Import mismatch.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import mismatch.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal8 (i_1 : Z) (i : Z) (a : addr) (a_1 : addr) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : i_1 ≤ i) (fact1 : 0%Z ≤ i_1) (fact2 : i ≤ i_1) (fact3 : region (base a) ≤ 0%Z) (fact4 : region (base a_1) ≤ 0%Z) (fact5 : linked t) (fact6 : is_uint32 i) (fact7 : is_uint32 i_1) (fact8 : is_sint32 (t_1 (shift a i_1))) (fact9 : is_sint32 (t_1 (shift a_1 i_1))) (fact10 : ¬ p_equalranges_1' t_1 t_1 a_1 i a) (fact11 : p_equalranges_1' t_1 t_1 a_1 i_1 a) (fact12 : valid_rd t (shift a 0%Z) i) : ¬ valid_rd t (shift a_1 0%Z) i.
Admitted.
