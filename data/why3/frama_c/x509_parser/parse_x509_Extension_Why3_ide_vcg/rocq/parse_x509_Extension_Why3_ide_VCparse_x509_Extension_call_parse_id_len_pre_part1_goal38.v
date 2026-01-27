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
Theorem goal38 (a_3 : addr) (i_3 : Z) (i : Z) (i_4 : Z) (t_1 : addr -> Z) (i_1 : Z) (i_2 : Z) (a : addr) (a_1 : addr) (a_2 : addr) (t_2 : addr -> addr) (t : Z -> Z) : let a_4 : addr := shift a_3 i_3 in let x : Z := i + i_4 in let a_5 : addr := shift a_3 (i + i_3) in let a_6 : addr := shift a_3 (3%Z + i + i_3) in let a_7 : addr := shift a_3 (2%Z + i + i_3) in let x_1 : Z := t_1 a_7 in let x_2 : Z := i + i_3 + i_4 in let x_3 : Z := i_4 - 3%Z in ¬ i = 0%Z -> ¬ i_1 = 0%Z -> ¬ i_4 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_3 -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ x = 0%Z -> ¬ shift___anonstruct__ext_oid_14 (Mk_addr (- 8682%Z) 0%Z) i_2 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> ¬ a_6 = Mk_addr 0%Z 0%Z -> ¬ x_1 = 0%Z -> 0%Z ≤ i -> 0%Z ≤ i_1 -> i_3 ≤ i_1 -> 0%Z ≤ i_2 -> 0%Z ≤ i_4 -> x ≤ i_1 -> 0%Z ≤ x -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> region (base a_2) ≤ 0%Z -> region (base a_3) ≤ 0%Z -> x_2 ≤ i_1 -> 0%Z ≤ x_2 -> - 2147483648%Z ≤ i_4 -> - 2147483645%Z ≤ i_4 -> 2%Z ≤ i_3 -> 3%Z ≤ i -> 3%Z ≤ i_4 -> 4%Z ≤ i_4 -> i_2 ≤ 28%Z -> i_4 ≤ 65535%Z -> i_4 ≤ 65538%Z -> i_4 ≤ 2147483647%Z -> i_4 ≤ 2147483650%Z -> i_1 ≤ 65535%Z + i_3 -> i_1 ≤ 2147483647%Z + i_3 -> i_3 ≤ 2147483648%Z + i_1 -> - 2147483648%Z ≤ x_2 -> x_2 ≤ 65535%Z -> x_2 ≤ 2147483647%Z -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_3 -> is_uint16 i_4 -> valid_rw t a 1%Z -> valid_rw t a_1 1%Z -> valid_rw t a_2 15%Z -> is_uint16 x_3 -> is_uint16 x -> valid_rw t (shift a 0%Z) 29%Z -> is_uint8 x_1 -> valid_rd t a_7 1%Z -> (0%Z < i_1 -> valid_rd t (shift a_3 0%Z) i_1) -> (0%Z < i -> valid_rd t a_4 i) -> (0%Z < x -> valid_rd t a_4 x) -> (0%Z < i_4 -> valid_rd t a_5 i_4) -> valid_rd t a_6 x_3.
Admitted.
