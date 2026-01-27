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
Require Import x509_parser.Compound.Compound.
Open Scope Z_scope.
Theorem goal1 (a : addr) (i : Z) (t : Z -> Z) : let a_1 : addr := shift a 0%Z in ¬ i = 0%Z -> ¬ Mk_addr 0%Z 0%Z = a -> 0%Z ≤ i -> region (base a) ≤ 0%Z -> - 2147483646%Z ≤ i -> 2%Z ≤ i -> i ≤ 65537%Z -> linked t -> is_uint16 i -> valid_rd t a_1 1%Z -> (0%Z < i -> valid_rd t a_1 i) -> valid_rd t (shift a 1%Z) 1%Z.
Admitted.
