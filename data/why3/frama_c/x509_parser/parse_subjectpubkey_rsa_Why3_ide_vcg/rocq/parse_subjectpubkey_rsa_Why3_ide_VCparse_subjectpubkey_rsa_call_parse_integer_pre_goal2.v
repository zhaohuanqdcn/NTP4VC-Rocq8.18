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
Theorem goal2 (a_1 : addr) (i_3 : Z) (a : addr) (i_4 : Z) (i : Z) (i_2 : Z) (t_1 : addr -> Z) (t_2 : addr -> addr) (i_1 : Z) (t : Z -> Z) : let a_2 : addr := shift a_1 i_3 in let a_3 : addr := shift a 1%Z in let a_4 : addr := shift a_1 (1%Z + i_3) in let a_5 : addr := shift a_1 (1%Z + i_3 + i_4) in ¬ i = - 1%Z -> ¬ i = 0%Z -> ¬ i_2 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> t_1 a_2 = 0%Z -> t_2 a_3 = shift (Mk_addr (- 8561%Z) 0%Z) 0%Z -> ¬ a_4 = Mk_addr 0%Z 0%Z -> ¬ a_5 = Mk_addr 0%Z 0%Z -> 0%Z < i_1 -> 0%Z ≤ i -> i_1 ≤ i -> i < i_2 -> i_4 ≤ i -> 0%Z ≤ i_2 -> i_3 ≤ i_2 -> i_1 + i_4 ≤ i -> i + i_3 < i_2 -> region (base a) ≤ 0%Z -> region (base a_1) ≤ 0%Z -> - 2147483648%Z ≤ i -> 2%Z ≤ i_3 -> 2%Z ≤ i_4 -> i ≤ 65535%Z -> framed t_2 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> is_uint16 i_3 -> is_uint16 i_4 -> is_uint16 (1%Z + i) -> valid_rd t a_3 1%Z -> valid_rd t a_2 1%Z -> (0%Z < i_2 -> valid_rd t (shift a_1 0%Z) i_2) -> (0%Z < i -> valid_rd t a_4 i) -> valid_rd t a_5 i_1.
Admitted.
