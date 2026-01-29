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
Require Import verker.Axiomatic3.Axiomatic3.
Require Import Why3.Memory.Memory.
Require Import Why3.Cint.Cint.
Require Import verker.Compound.Compound.
Open Scope Z_scope.
Theorem goal11 (a_5 : addr) (t : Z -> Z) (i : Z) (a : addr) (a_1 : addr) (a_2 : addr) (a_4 : addr) (a_3 : addr) (fact0 : region (base a_5) ≤ 0%Z) (fact1 : linked t) (fact2 : is_uint64 i) (fact3 : valid_rd t (shift a 0%Z) i) (fact4 : valid_rd t (shift a_1 0%Z) i) : addr_le a_2 a_4 ∧ addr_le a_4 (shift a_3 i).
Proof.
Admitted.
