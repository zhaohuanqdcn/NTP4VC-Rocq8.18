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
Require Import x509_parser.Compound.Compound.
Require Import x509_parser.Globals.Globals.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal0 (a : addr) (i : Z) (i_2 : Z) (a_1 : addr) (t_1 : addr -> addr) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a 1%Z in ¬ i = 0%Z -> ¬ i_2 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> t_1 a_2 = shift (Mk_addr (- 8561%Z) 0%Z) 0%Z -> 0%Z ≤ i -> i_1 ≤ i -> i_2 ≤ i -> i_1 + i_2 ≤ i -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> 2%Z ≤ i_1 -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> valid_rd t a_2 1%Z -> (0%Z < i -> valid_rd t (shift a_1 0%Z) i) -> valid_rd t (shift a_1 i_1) 1%Z.
Admitted.
