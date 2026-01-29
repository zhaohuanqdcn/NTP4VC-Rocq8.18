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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom lt : elt -> elt -> Prop.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : lt x y) (fact1 : lt y z), lt x z.
Axiom Asymm : forall  (x : elt) (y : elt) (fact0 : lt x y), ¬ lt y x.
Axiom Trichotomy : forall  (x : elt) (y : elt), lt x y ∨ lt y x ∨ x = y.
Definition iss (s : list Z) (w : list elt) := (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> 0%Z ≤ nth (Z.to_nat i) s inhabitant ∧ nth (Z.to_nat i) s inhabitant < Z.of_nat (length w)) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < Z.of_nat (length s) -> nth (Z.to_nat i) s inhabitant < nth (Z.to_nat j) s inhabitant ∧ lt (nth (Z.to_nat (nth (Z.to_nat i) s inhabitant)) w inhabitant) (nth (Z.to_nat (nth (Z.to_nat j) s inhabitant)) w inhabitant)).
Definition liss (s : list Z) (w : list elt) := iss s w ∧ (∀(s' : list Z), iss s' w -> Z.of_nat (length s') ≤ Z.of_nat (length s)).
