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
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal0 (i : Z) (i_2 : Z) (a_1 : addr) (i_1 : Z) (a : addr) (t_1 : addr -> addr) (t : Z -> Z) (fact0 : ¬ i = 0%Z) (fact1 : ¬ i_2 = 0%Z) (fact2 : ¬ Mk_addr 0%Z 0%Z = a_1) (fact3 : 0%Z ≤ i) (fact4 : i_1 ≤ i) (fact5 : i_2 ≤ i) (fact6 : i_1 + i_2 ≤ i) (fact7 : region (base a) ≤ 0%Z) (fact8 : region (base a_1) ≤ 0%Z) (fact9 : 2%Z ≤ i_1) (fact10 : framed t_1) (fact11 : linked t) (fact12 : is_uint16 i) (fact13 : is_uint16 i_1) (fact14 : is_uint16 i_2) (fact15 : 0%Z < i -> valid_rd t (shift a_1 0%Z) i) : valid_rd t (shift a_1 i_1) 1%Z.
Admitted.
