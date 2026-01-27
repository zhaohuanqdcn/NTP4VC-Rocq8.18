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
Theorem goal0 (a : addr) (i : Z) (t_1 : addr -> Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in let a_2 : addr := shift a 1%Z in ¬ i = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> t_1 a_1 = 22%Z -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> - 2147483646%Z ≤ i -> 2%Z ≤ i -> i ≤ 65537%Z -> linked t -> is_uint16 i -> is_uint8 (t_1 a_2) -> valid_rd t a_1 1%Z -> (0%Z < i -> valid_rd t a_1 i) -> valid_rd t a_2 1%Z.
Admitted.
