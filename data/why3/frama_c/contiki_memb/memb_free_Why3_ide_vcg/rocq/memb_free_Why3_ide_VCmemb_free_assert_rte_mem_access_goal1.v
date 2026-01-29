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
Theorem goal1 (a : addr) (a_1 : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : region (base a_1) ≤ 0%Z) (fact2 : framed t_3) (fact3 : linked t) (fact4 : sconst t_2) (fact5 : is_uint16 (t_1 (shift a_1 1%Z))) (fact6 : p_valid_memb t t_3 t_1 a_1) : valid_rd t (shift a_1 3%Z) 1%Z.
Proof.
Admitted.
