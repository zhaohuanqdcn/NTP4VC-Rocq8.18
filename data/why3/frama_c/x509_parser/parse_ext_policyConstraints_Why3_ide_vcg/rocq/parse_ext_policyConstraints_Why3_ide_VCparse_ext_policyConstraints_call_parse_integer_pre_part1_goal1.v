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
Require Import x509_parser.Compound.Compound.
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a_1 : addr) (a : addr) (i_2 : Z) (i : Z) (i_1 : Z) (i_3 : Z) (t : Z -> Z) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 i_2 in let a_3 : addr := shift a_1 (3%Z + i_2) in let x_2 : Z := i - 3%Z in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_3 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ a_2 = Mk_addr 0%Z 0%Z -> ¬ a_3 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i ≤ i_1 -> i_2 ≤ i_1 -> i + i_2 ≤ i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483645%Z ≤ i -> 2%Z ≤ i_2 -> 3%Z ≤ i -> 4%Z ≤ i -> i ≤ 65538%Z -> i ≤ 2147483650%Z -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_sint32 i_3 -> valid_rw t a 15%Z -> is_uint16 x_2 -> (0%Z < i_1 -> valid_rd t (shift a_1 0%Z) i_1) -> (0%Z < i -> valid_rd t a_2 i) -> valid_rd t a_3 x_2.
Proof.
Admitted.
