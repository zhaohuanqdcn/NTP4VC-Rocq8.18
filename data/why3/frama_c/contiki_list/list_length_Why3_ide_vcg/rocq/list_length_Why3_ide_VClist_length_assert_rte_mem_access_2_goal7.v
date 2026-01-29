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
Theorem goal7 (a_1 : addr) (i_1 : Z) (i : Z) (a : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) (i_2 : Z) (fact0 : ¬ Mk_addr 0%Z 0%Z = a_1) (fact1 : i_1 ≤ i) (fact2 : 0%Z ≤ i_1) (fact3 : region (base a) ≤ 0%Z) (fact4 : region (base a_2) ≤ 0%Z) (fact5 : i_1 ≤ 2147483646%Z) (fact6 : framed t_1) (fact7 : linked t) (fact8 : is_sint32 i) (fact9 : is_sint32 i_1) (fact10 : is_sint32 i_2) (fact11 : valid_rd t a 1%Z) (fact12 : valid_rw t a 1%Z) (fact13 : p_linked_n t t_1 (t_1 a) a_2 i_2 i (Mk_addr 0%Z 0%Z)) (fact14 : p_linked_n t t_1 a_1 a_2 (i_1 + i_2) (i - i_1) (Mk_addr 0%Z 0%Z)) : valid_rd t (shift a_1 0%Z) 1%Z.
Proof.
Admitted.
