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
Require Import Why3.Cint.Cint.
Require Import contiki_list.Axiomatic.Axiomatic.
Require Import contiki_list.Compound.Compound.
Require Import contiki_list.S1_list.S1_list.
Open Scope Z_scope.
Theorem goal3 (a_1 : addr) (i_1 : Z) (i : Z) (a : addr) (a_2 : addr) (t_1 : addr -> addr) (t : Z -> Z) (i_2 : Z) (fact0 : ¬ Mk_addr 0%Z 0%Z = a_1) (fact1 : i_1 ≤ i) (fact2 : 0%Z ≤ i_1) (fact3 : region (base a) ≤ 0%Z) (fact4 : region (base a_2) ≤ 0%Z) (fact5 : framed t_1) (fact6 : linked t) (fact7 : is_sint32 i) (fact8 : is_sint32 i_1) (fact9 : is_sint32 i_2) (fact10 : valid_rw t a 1%Z) (fact11 : is_sint32 (1%Z + i_1)) (fact12 : p_linked_n t t_1 (t_1 a) a_2 i_2 i (Mk_addr 0%Z 0%Z)) (fact13 : p_linked_n t t_1 a_1 a_2 (i_1 + i_2) (i - i_1) (Mk_addr 0%Z 0%Z)) : i_1 < i.
Admitted.
