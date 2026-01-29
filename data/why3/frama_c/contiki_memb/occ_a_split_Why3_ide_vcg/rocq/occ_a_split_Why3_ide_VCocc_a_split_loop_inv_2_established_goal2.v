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
Require Import contiki_memb.Axiomatic13.Axiomatic13.
Require Import Why3.Memory.Memory.
Require Import contiki_memb.Compound.Compound.
Require Import contiki_memb.A_OccArray.A_OccArray.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal2 (i_3 : Z) (i : Z) (i_1 : Z) (a : addr) (t : addr -> Z) (i_2 : Z) (fact0 : i_3 ≤ i) (fact1 : i_1 ≤ i_3) (fact2 : region (base a) ≤ 0%Z) (fact3 : sconst t) (fact4 : is_sint32 i) (fact5 : is_sint32 i_1) (fact6 : is_sint32 i_2) (fact7 : is_sint32 i_3) : l_occ_a t i_2 a i_3 i_3 = 0%Z.
Proof.
Admitted.
