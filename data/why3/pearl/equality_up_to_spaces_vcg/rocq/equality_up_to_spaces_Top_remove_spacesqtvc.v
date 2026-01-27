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
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom space : char.
Axiom eq : char -> char -> bool.
Axiom eq'spec : forall  (x : char) (y : char), (eq x y = true) = (x = y).
Axiom char_string : Type.
Axiom char_string_inhabited : Inhabited char_string.
Global Existing Instance char_string_inhabited.
Axiom char_string_countable : Countable char_string.
Global Existing Instance char_string_countable.
Theorem remove_spaces'vc (s : list char) (fact0 : ¬ Z.of_nat (length s) = 0%Z) : let o1 : char := space in let o2 : char := nth 0%nat s inhabitant in (eq o2 o1 = true) = (o2 = o1) -> (0%Z ≤ 1%Z ∧ 1%Z ≤ Z.of_nat (length s)) ∧ 0%Z ≤ Z.of_nat (length s) ∧ Z.of_nat (length (drop 1%nat s)) < Z.of_nat (length s).
Admitted.
