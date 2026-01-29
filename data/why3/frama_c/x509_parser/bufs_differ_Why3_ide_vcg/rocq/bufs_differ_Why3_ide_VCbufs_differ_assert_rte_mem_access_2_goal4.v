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
Require Import x509_parser.Axiomatic12.Axiomatic12.
Open Scope Z_scope.
Theorem goal4 (a : addr) (i_1 : Z) (i : Z) (a_1 : addr) (t : Z -> Z) (t_1 : addr -> Z) : let a_2 : addr := shift a i_1 in i_1 ≤ i -> 0%Z ≤ i_1 -> i_1 < i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> linked t -> is_uint16 i -> is_uint16 i_1 -> p_bmatch t_1 a_1 a i_1 -> is_uint8 (t_1 a_2) -> is_uint8 (t_1 (shift a_1 i_1)) -> valid_rd t (shift a 0%Z) i -> valid_rd t (shift a_1 0%Z) i -> valid_rd t a_2 1%Z.
Proof.
Admitted.
