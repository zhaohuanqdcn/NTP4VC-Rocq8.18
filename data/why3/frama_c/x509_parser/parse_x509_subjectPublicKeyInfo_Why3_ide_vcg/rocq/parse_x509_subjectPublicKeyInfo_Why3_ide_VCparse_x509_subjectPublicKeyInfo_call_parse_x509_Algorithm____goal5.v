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
Theorem goal5 (a_1 : addr) (a : addr) (i_2 : Z) (t : Z -> Z) (i_1 : Z) (i : Z) (t_1 : addr -> addr) : let x : Z := base a_1 in let x_1 : Z := base a in let a_2 : addr := shift a_1 i_2 in let a_3 : addr := shift a_1 0%Z in let m : Z -> Z := fun_updt t 7106%Z 4%Z in ¬ i_1 = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a_1 -> ¬ x = x_1 -> ¬ a_2 = Mk_addr 0%Z 0%Z -> 0%Z < i -> 0%Z ≤ i_1 -> i ≤ i_1 -> i_2 ≤ i_1 -> i + i_2 ≤ i_1 -> region x_1 ≤ 0%Z -> region x ≤ 0%Z -> 2%Z ≤ i_2 -> framed t_1 -> linked t -> is_uint16 i -> is_uint16 i_1 -> is_uint16 i_2 -> valid_rw t a 1%Z -> (0%Z < i_1 -> valid_rd t a_3 i_1) -> (0%Z < i_1 -> valid_rd m a_3 i_1) -> valid_rd m a_2 i.
Admitted.
