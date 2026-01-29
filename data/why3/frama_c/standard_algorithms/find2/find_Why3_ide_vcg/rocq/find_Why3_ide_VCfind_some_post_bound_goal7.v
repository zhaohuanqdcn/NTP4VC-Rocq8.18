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
Require Import find2.Compound.Compound.
Require Import Why3.Cint.Cint.
Require Import find2.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal7 (i_2 : Z) (i_1 : Z) (a : addr) (t : Z -> Z) (i : Z) (t_1 : addr -> Z) (fact0 : i_2 ≤ i_1) (fact1 : 0%Z ≤ i_2) (fact2 : i_1 ≤ i_2) (fact3 : region (base a) ≤ 0%Z) (fact4 : linked t) (fact5 : is_uint32 i_1) (fact6 : is_uint32 i_2) (fact7 : is_sint32 i) (fact8 : p_hasvalue_1' t_1 a 0%Z i_1 i) (fact9 : ¬ p_hasvalue_1' t_1 a 0%Z i_2 i) (fact10 : is_sint32 (t_1 (shift a i_2))) : ¬ valid_rd t (shift a 0%Z) i_1.
Proof.
Admitted.
