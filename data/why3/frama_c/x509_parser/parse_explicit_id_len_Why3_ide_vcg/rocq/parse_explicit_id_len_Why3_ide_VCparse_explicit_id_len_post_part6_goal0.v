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
Theorem goal0 (a_2 : addr) (a : addr) (a_1 : addr) (i_4 : Z) (i_3 : Z) (t_1 : addr -> Z) (i_2 : Z) (i_1 : Z) (i : Z) (t : Z -> Z) : let x : Z := base a_2 in let x_1 : Z := base a in let x_2 : Z := base a_1 in let a_3 : addr := shift a_2 i_4 in let x_3 : Z := 2147483648%Z + i_3 in let x_5 : Z := i_3 - i_4 in let x_7 : Z := fun_updt (fun_updt t_1 a (i_3 - i_2)) a_1 i_1 a in ¬ i_3 = 0%Z -> ¬ i_4 = i_3 -> ¬ a_1 = a -> ¬ Mk_addr 0%Z 0%Z = a_2 -> ¬ x = x_1 -> ¬ x = x_2 -> ¬ a_3 = Mk_addr 0%Z 0%Z -> 0%Z ≤ i_2 -> i_1 ≤ i_2 -> 0%Z ≤ i_3 -> i ≤ i_3 -> i_2 ≤ i_3 -> i_4 ≤ i_3 -> i + i_4 ≤ i_3 -> i_1 + i_4 ≤ i_3 -> region x_1 ≤ 0%Z -> region x_2 ≤ 0%Z -> region x ≤ 0%Z -> - 2147483648%Z ≤ i_2 -> 2%Z ≤ i_4 -> i_2 ≤ 65535%Z -> i_2 ≤ 2147483647%Z -> i_2 ≤ x_3 -> i_3 ≤ 65535%Z + i_2 -> i_3 ≤ 65535%Z + i_4 -> i_3 ≤ 2147483647%Z + i_2 -> i_3 ≤ 2147483647%Z + i_4 -> i_4 ≤ x_3 -> 2%Z + i_2 + i_4 ≤ i_3 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rd t a 1%Z -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> is_uint16 x_5 -> is_uint16 (i_3 - i_2 - i_4) -> is_uint16 x_7 -> (0%Z < i_3 -> valid_rd t (shift a_2 0%Z) i_3) -> (i_4 < i_3 -> valid_rd t a_3 x_5) -> x_7 ≤ i_3.
Admitted.
