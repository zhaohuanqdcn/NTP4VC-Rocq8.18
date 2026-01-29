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
Require Import iota.Compound.Compound.
Require Import iota.Axiomatic.Axiomatic.
Open Scope Z_scope.
Theorem goal4 (a : addr) (i : Z) (i_1 : Z) (t : Z -> Z) (t_1 : addr -> Z) (fact0 : region (base a) ≤ 0%Z) (fact1 : i + i_1 ≤ 2147483647%Z) (fact2 : linked t) (fact3 : is_uint32 i_1) (fact4 : is_sint32 i) (fact5 : valid_rw t (shift a 0%Z) i_1) : p_iota t_1 a 0%Z i.
Proof.
Admitted.
