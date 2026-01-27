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
Require Import verifythis_2017_tree_buffer_vcg.verifythis_2017_tree_buffer.Spec.
Open Scope Z_scope.
Theorem cat'vc {α : Type} `{Inhabited α} : let o1 : buf α := buf'mk 1%Z ([] : list α) in let xs : list α := ([] : list α) in h o1 = 1%Z ∧ (0%Z = Z.of_nat (length xs) ∧ Z.of_nat (length xs) < 1%Z) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ 1%Z -> Spec.take len (xs ++ ([] : list α)) = Spec.take len (Spec.xs o1)).
Admitted.
