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
Require Import contiki_list.Axiomatic.Axiomatic.
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Open Scope Z_scope.
Theorem goal0 (i : Z) (a : addr) (a_1 : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) (i_1 : Z) (fact0 : 0%Z < i) (fact1 : region (base a) ≤ 0%Z) (fact2 : region (base a_1) ≤ 0%Z) (fact3 : region (base a_2) ≤ 0%Z) (fact4 : framed t_1) (fact5 : linked t) (fact6 : is_sint32 i) (fact7 : is_sint32 i_1) (fact8 : p_linked_n t t_1 a a_2 i_1 i a_1) : valid_rw t a 4%Z.
Proof.
Admitted.
