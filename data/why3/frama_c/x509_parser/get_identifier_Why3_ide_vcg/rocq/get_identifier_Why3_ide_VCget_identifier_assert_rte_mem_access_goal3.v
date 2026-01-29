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
Theorem goal3 (a_4 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (a_3 : addr) (i : Z) (t : Z -> Z) : let x : Z := base a_4 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let x_3 : Z := base a_2 in let x_4 : Z := base a_3 in let a_5 : addr := shift a_4 0%Z in ¬ a_1 = a -> ¬ i = 0%Z -> ¬ a_2 = a -> ¬ a_2 = a_1 -> ¬ a_3 = a -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ x = x_3 -> ¬ x = x_4 -> 0%Z ≤ i -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x_3 ≤ 0%Z -> region x_4 ≤ 0%Z -> region x ≤ 0%Z -> linked t -> is_uint16 i -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> (0%Z < i -> valid_rd t a_5 i) -> valid_rd t a_5 1%Z.
Proof.
Admitted.
