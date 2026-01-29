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
Theorem goal4 (i : Z) (i_1 : Z) (a : addr) (a_1 : addr) (i_2 : Z) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : i ≤ i_1) (fact1 : region (base a) ≤ 0%Z) (fact2 : region (base a_1) ≤ 0%Z) (fact3 : i + i_2 ≤ 1%Z + i_1) (fact4 : linked t) (fact5 : is_uint32 i) (fact6 : is_uint32 i_1) (fact7 : is_uint32 i_2) (fact8 : valid_rd t (shift a 0%Z) i) (fact9 : valid_rd t (shift a_1 0%Z) i_1) (fact10 : ¬ p_hassubrange_1' t_1 a_1 0%Z (i + i_2 - 1%Z) a i) : i_1 ≤ 4294967295%Z + i.
Proof.
Admitted.
