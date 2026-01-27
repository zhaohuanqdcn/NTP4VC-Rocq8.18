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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Axiom param : Type.
Axiom param_inhabited : Inhabited param.
Global Existing Instance param_inhabited.
Axiom param_countable : Countable param.
Global Existing Instance param_countable.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom le : param -> elt -> elt -> Prop.
Axiom le_refl : forall  (p : param) (x : elt), le p x x.
Axiom le_asym : forall  (p : param) (x : elt) (y : elt) (fact0 : ¬ le p x y), le p y x.
Axiom le_trans : forall  (p : param) (x : elt) (y : elt) (z : elt) (fact0 : le p x y) (fact1 : le p y z), le p x z.
Definition sorted_sub (p : param) (a : Z -> elt) (l : Z) (u : Z) := ∀(i1 : Z) (i2 : Z), l ≤ i1 ∧ i1 ≤ i2 ∧ i2 < u -> le p (a i1) (a i2).
Definition sorted (p : param) (a : list elt) := sorted_sub p (nth_i a) 0%Z (Z.of_nat (length a)).
Theorem sort'vc (a : list elt) (p : param) : let o1 : Z := Z.of_nat (length a) - 1%Z in (0%Z ≤ o1 + 1%Z -> (a ≡ₚ a ∧ sorted_sub p (nth_i a) 0%Z 0%Z) ∧ (∀(a1 : list elt), length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ a ≡ₚ a1 ∧ sorted_sub p (nth_i a1) 0%Z i -> ((0%Z ≤ i ∧ i ≤ i) ∧ a ≡ₚ a1 ∧ sorted_sub p (nth_i a1) 0%Z i ∧ sorted_sub p (nth_i a1) i (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < i) ∧ i + 1%Z ≤ k2 ∧ k2 ≤ i -> le p (nth (Z.to_nat k1) a1 inhabitant) (nth (Z.to_nat k2) a1 inhabitant))) ∧ (∀(j : Z) (a2 : list elt), length a2 = length a1 -> (0%Z ≤ j ∧ j ≤ i) ∧ a ≡ₚ a2 ∧ sorted_sub p (nth_i a2) 0%Z j ∧ sorted_sub p (nth_i a2) j (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < j) ∧ j + 1%Z ≤ k2 ∧ k2 ≤ i -> le p (nth (Z.to_nat k1) a2 inhabitant) (nth (Z.to_nat k2) a2 inhabitant)) -> (0%Z < j -> (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (let o2 : Z := j - 1%Z in 0%Z ≤ o2 ∧ o2 < Z.of_nat (length a2))) ∧ (∀(o2 : bool), (if decide (0%Z < j) then o2 = (if decide (le p (nth (Z.to_nat (j - 1%Z)) a2 inhabitant) (nth (Z.to_nat j) a2 inhabitant)) then false else true) else o2 = false) -> (if decide (o2 = true) then let b : Z := j - 1%Z in (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (let t : elt := nth (Z.to_nat j) a2 inhabitant in (0%Z ≤ b ∧ b < Z.of_nat (length a2)) ∧ (let o3 : elt := nth (Z.to_nat b) a2 inhabitant in (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat j) o3) = length a2 -> nth_i (set_list a2 (Z.to_nat j) o3) = fun_updt (nth_i a2) j o3 -> (0%Z ≤ b ∧ b < Z.of_nat (length (set_list a2 (Z.to_nat j) o3))) ∧ (length (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t) = length (set_list a2 (Z.to_nat j) o3) -> nth_i (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t) = fun_updt (nth_i (set_list a2 (Z.to_nat j) o3)) b t -> (0%Z ≤ j ∧ j - 1%Z < j) ∧ (0%Z ≤ j - 1%Z ∧ j - 1%Z ≤ i) ∧ a ≡ₚ set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t ∧ sorted_sub p (nth_i (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t)) 0%Z (j - 1%Z) ∧ sorted_sub p (nth_i (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t)) (j - 1%Z) (i + 1%Z) ∧ (∀(k1 : Z) (k2 : Z), (0%Z ≤ k1 ∧ k1 < j - 1%Z) ∧ j - 1%Z + 1%Z ≤ k2 ∧ k2 ≤ i -> le p (nth (Z.to_nat k1) (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t) inhabitant) (nth (Z.to_nat k2) (set_list (set_list a2 (Z.to_nat j) o3) (Z.to_nat b) t) inhabitant)))))) else a ≡ₚ a2 ∧ sorted_sub p (nth_i a2) 0%Z (i + 1%Z))))) ∧ (a ≡ₚ a1 ∧ sorted_sub p (nth_i a1) 0%Z (o1 + 1%Z) -> sorted p a1 ∧ a ≡ₚ a1))) ∧ (o1 + 1%Z < 0%Z -> sorted p a ∧ a ≡ₚ a).
Admitted.
