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
Require Import Why3.why3.WellFounded.WellFounded.
Open Scope Z_scope.
Axiom bitvec8 : Type.
Axiom bitvec8_inhabited : Inhabited bitvec8.
Global Existing Instance bitvec8_inhabited.
Axiom bitvec8_countable : Countable bitvec8.
Global Existing Instance bitvec8_countable.
Axiom bitvec64 : Type.
Axiom bitvec64_inhabited : Inhabited bitvec64.
Global Existing Instance bitvec64_inhabited.
Axiom bitvec64_countable : Countable bitvec64.
Global Existing Instance bitvec64_countable.
Theorem mask'vc (x : bv 32%N) : bv_zero_extend 8 (bv_and (bv_or (bv_and x (4294967040%bv : bv 32%N)) (1%bv : bv 32%N)) (255%bv : bv 32%N)) = (1%bv : bv 8%N).
Proof.
Admitted.
