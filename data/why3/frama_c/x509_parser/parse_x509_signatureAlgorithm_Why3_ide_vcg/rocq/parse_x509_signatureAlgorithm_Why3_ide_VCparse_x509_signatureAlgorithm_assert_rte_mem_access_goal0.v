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
Theorem goal0 (a_2 : addr) (a : addr) (a_1 : addr) (t_1 : Z -> addr) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := t_1 i_2 in ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> 0%Z ≤ i_1 -> i ≤ i_1 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i -> linked t -> is_uint8 i_2 -> is_uint16 i -> is_uint16 i_1 -> valid_rw t a_1 1%Z -> valid_rd t a_3 8%Z -> separated a_1 1%Z a 8%Z -> (0%Z < i_1 -> valid_rd t (shift a_2 0%Z) i_1) -> valid_rd t (shift a_3 4%Z) 1%Z.
Proof.
Admitted.
