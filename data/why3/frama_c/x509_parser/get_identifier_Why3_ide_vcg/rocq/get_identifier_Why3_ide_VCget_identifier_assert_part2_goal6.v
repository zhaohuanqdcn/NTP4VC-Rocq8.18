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
Require Import Why3.Cbits.Cbits.
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal6 (a_4 : addr) (a : addr) (a_1 : addr) (a_2 : addr) (a_3 : addr) (t_1 : addr -> Z) (i : Z) (t : Z -> Z) : let x : Z := base a_4 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let x_3 : Z := base a_2 in let x_4 : Z := base a_3 in let a_5 : addr := shift a_4 0%Z in let x_5 : Z := t_1 a_5 in let x_6 : Z := land 3%Z (lsr x_5 6%Z) in ¬ a_1 = a -> ¬ i = 0%Z -> ¬ a_2 = a -> ¬ a_2 = a_1 -> ¬ a_3 = a -> ¬ a_3 = a_1 -> ¬ a_3 = a_2 -> ¬ Mk_addr 0%Z 0%Z = a_4 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ x = x_3 -> ¬ x = x_4 -> land 31%Z x_5 = 31%Z -> 0%Z ≤ i -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x_3 ≤ 0%Z -> region x_4 ≤ 0%Z -> region x ≤ 0%Z -> 0%Z ≤ x_5 -> 0%Z ≤ land 1%Z (to_sint32 (lsr x_5 5%Z)) -> linked t -> is_uint16 i -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 1%Z -> valid_rw t a_3 1%Z -> is_uint8 x_5 -> valid_rd t a_5 1%Z -> is_uint32 x_6 -> (0%Z < i -> valid_rd t a_5 i) -> x_6 = 0%Z ∨ x_6 = 1%Z ∨ x_6 = 2%Z ∨ x_6 = 3%Z -> i ≤ 65536%Z.
Admitted.
