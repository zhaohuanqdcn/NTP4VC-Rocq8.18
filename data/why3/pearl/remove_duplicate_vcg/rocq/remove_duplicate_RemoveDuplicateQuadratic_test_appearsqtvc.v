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
Require Import Why3.why3.Ref.Ref.
Require Import remove_duplicate_vcg.remove_duplicate.Spec.
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom eq : t -> t -> Prop.
Axiom eq'spec : forall  (x : t) (y : t), eq x y = (x = y).
Theorem test_appears'vc (s : Z) (a : list t) (v : t) (fact0 : 0%Z ≤ s) (fact1 : s ≤ Z.of_nat (length a)) : if decide (0%Z < s) then let o1 : Z := s - 1%Z in (0%Z ≤ o1 ∧ o1 < Z.of_nat (length a)) ∧ (let o2 : t := nth (Z.to_nat o1) a inhabitant in eq o2 v = (o2 = v) -> (if decide (eq o2 v) then appears v a s ∧ (0%Z ≤ s - 1%Z ∧ s - 1%Z < s) ∧ nth (Z.to_nat (s - 1%Z)) a inhabitant = v else let o3 : Z := s - 1%Z in ((0%Z ≤ s ∧ o3 < s) ∧ 0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length a)) ∧ (∀(w : Z), (appears v a o3 -> (0%Z ≤ w ∧ w < o3) ∧ nth (Z.to_nat w) a inhabitant = v) -> appears v a o3 = appears v a s ∧ (appears v a o3 -> (0%Z ≤ w ∧ w < s) ∧ nth (Z.to_nat w) a inhabitant = v)))) else ¬ appears v a s.
Proof.
Admitted.
