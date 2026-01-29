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
Require Import verifythis_2017_tree_buffer_vcg.verifythis_2017_tree_buffer.Spec.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Theorem rt'vc : let o1 : buf elt := buf'mk 1%Z ([] : list elt) in let xs : list elt := ([] : list elt) in h o1 = 1%Z ∧ (0%Z = Z.of_nat (length xs) ∧ Z.of_nat (length xs) < 1%Z) ∧ (∀(len : Z), 0%Z ≤ len ∧ len ≤ 1%Z -> Spec.take len (xs ++ ([] : list elt)) = Spec.take len (Spec.xs o1)).
Proof.
Admitted.
