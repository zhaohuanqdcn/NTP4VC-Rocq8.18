From Coq Require Import Strings.String.
From Coq Require Import String Ascii.
From Coq Require Arith.
From stdpp Require Import base.
From stdpp Require Import fin_maps.
From stdpp Require Import gmap.
From stdpp Require Import base gmultiset.
From Coq Require Classical.
From Coq Require Import ZArith.
From stdpp.bitvector Require Import definitions tactics.
From Coq Require Import Sorting.Sorted.
From Coq Require Import Reals.Rbasic_fun.
From Coq Require Import Reals.Abstract.ConstructiveAbs.
From Coq Require Import Reals.Rdefinitions.
From stdpp Require Import list_relations.
From stdpp Require Import list_numbers.
From stdpp Require Import functions.
From Coq Require Import ClassicalEpsilon.
From stdpp Require Import base decidable.
From Coq Require Import ZArith.Zeuclid.
From Coq Require Import ZArith.Znumtheory.
From stdpp Require Import propset.
From Coq Require Import Reals.
Require Import Why3.Base.
Open Scope Z_scope.
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom string' : Type.
Axiom string'_inhabited : Inhabited string'.
Global Existing Instance string'_inhabited.
Axiom string'_countable : Countable string'.
Global Existing Instance string'_countable.
Axiom concat : list (list char) -> char -> list char.
Axiom concat'def : forall  (ss : list (list char)) (sep : char) (fact0 : 1%Z ≤ Z.of_nat (length ss)), if decide (Z.of_nat (length ss) = 1%Z) then concat ss sep = nth 0%nat ss inhabitant else concat ss sep = concat (drop 0%nat (take (Z.to_nat (Z.of_nat (length ss) - 1%Z) - 0%nat) ss)) sep ++ cons sep (nth (Z.to_nat (Z.of_nat (length ss) - 1%Z)) ss inhabitant).
Definition notin (sep : char) (s : list char) := ¬ sep ∈ s.
Theorem mixfix_lbrb'vc : True.
Proof.
Admitted.
