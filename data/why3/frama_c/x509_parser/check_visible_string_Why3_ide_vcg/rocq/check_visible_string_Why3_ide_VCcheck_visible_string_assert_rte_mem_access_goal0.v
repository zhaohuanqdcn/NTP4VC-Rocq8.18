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
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (i_1 : Z) (a : addr) (i : Z) (t : Z -> Z) (fact0 : ¬ i_1 = 0%Z) (fact1 : ¬ Mk_addr 0%Z 0%Z = a) (fact2 : i < i_1) (fact3 : 0%Z ≤ i_1) (fact4 : region (base a) ≤ 0%Z) (fact5 : linked t) (fact6 : is_uint16 i) (fact7 : is_uint16 i_1) (fact8 : 0%Z < i_1 -> valid_rd t (shift a 0%Z) i_1) : valid_rd t (shift a i) 1%Z.
Proof.
Admitted.
