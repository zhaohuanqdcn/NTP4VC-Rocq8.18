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
Require Import Why3.Cint.Cint.
Open Scope Z_scope.
Theorem goal1 (a : addr) (i_2 : Z) (i_3 : Z) (i_4 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a i_2 in let a_2 : addr := shift a (i_2 + i_3) in let x : Z := i_4 - i_3 in ¬ i_1 = 0%Z -> ¬ i_4 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> ¬ a_1 = Mk_addr 0%Z 0%Z -> ¬ a_2 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_2 ≤ i_1 -> i_4 ≤ i_1 -> i_3 < i_4 -> 0%Z ≤ i_4 -> i_2 + i_4 ≤ i_1 -> region (base a) ≤ 0%Z -> i ≤ 1%Z -> 2%Z ≤ i_2 -> 2%Z ≤ i_3 -> i_3 ≤ 2147483648%Z + i_4 -> i_4 ≤ 65535%Z + i_3 -> i_4 ≤ 2147483647%Z + i_3 -> linked t -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_sint32 i -> is_uint16 x -> (0%Z < i_1 -> valid_rd t (shift a 0%Z) i_1) -> (0%Z < i_4 -> valid_rd t a_1 i_4) -> valid_rd t a_2 x.
Admitted.
