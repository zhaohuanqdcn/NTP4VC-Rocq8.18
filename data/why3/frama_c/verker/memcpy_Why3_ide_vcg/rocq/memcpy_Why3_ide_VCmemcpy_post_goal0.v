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
Theorem goal0 (a_2 : addr) (a_1 : addr) (a_3 : addr) (t_1 : addr -> Z) (t_2 : addr -> Z) (a : addr) (i : Z) (t : Z -> Z) : let x : Z := offset a_2 in let x_1 : Z := offset a_1 in let x_2 : Z := x - x_1 in let a_4 : addr := shift a_3 0%Z in let a_5 : addr -> Z := havoc t_1 t_2 a_4 x_2 in x + offset a_3 = offset a + x_1 -> 0%Z ≤ i -> x_1 ≤ x -> region (base a_1) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> i + x_1 < x -> linked t -> sconst t_2 -> addr_le a_1 a_2 -> addr_le a_3 a -> is_uint64 x_2 -> valid_rd t (shift a_1 0%Z) x_2 -> valid_rw t a_4 x_2 -> addr_le a (shift a_3 x_2) -> addr_le a_2 (shift a_1 x_2) -> (∀(i_1 : Z), 0%Z ≤ i_1 -> i_1 + x_1 < x -> a_5 (shift a_3 i_1) = a_5 (shift a_1 i_1)) -> a_5 (shift a_3 i) = a_5 (shift a_1 i).
Proof.
Admitted.
