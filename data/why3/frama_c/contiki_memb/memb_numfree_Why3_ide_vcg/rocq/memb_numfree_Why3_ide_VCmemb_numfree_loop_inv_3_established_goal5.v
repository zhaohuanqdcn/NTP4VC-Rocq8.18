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
Theorem goal5 (a : addr) (t_3 : addr -> addr) (t : Z -> Z) (t_2 : addr -> Z) (t_1 : addr -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : framed t_3) (fact2 : linked t) (fact3 : sconst t_2) (fact4 : is_uint16 (t_1 (shift a 1%Z))) (fact5 : p_valid_memb t t_3 t_1 a) : l_occ_a t_2 0%Z (t_3 (shift a 2%Z)) 0%Z 0%Z = 0%Z.
Proof.
Admitted.
