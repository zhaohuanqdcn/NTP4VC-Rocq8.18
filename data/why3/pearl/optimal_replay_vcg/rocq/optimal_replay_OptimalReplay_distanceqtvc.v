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
Open Scope Z_scope.
Axiom n : Z.
Axiom n'def : 0%Z < n.
Axiom f : Z -> Z.
Axiom f'spec : forall  (k : Z) (fact0 : 0%Z < k) (fact1 : k < n), 0%Z ≤ f k ∧ f k < k.
Inductive path : Z -> Z -> Prop :=
 | path0 : path 0%Z 0%Z
 | paths (i : Z) (d : Z) (j : Z) : 0%Z ≤ i -> i < n -> path d j -> f i ≤ j -> j < i -> path (d + 1%Z) i.
Definition distance (d : Z) (i : Z) := path d i ∧ (∀(d' : Z), path d' i -> d ≤ d').
Theorem distance'vc : let o1 : Z := n in 0%Z ≤ o1 ∧ (∀(g : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) g inhabitant = 0%Z) ∧ Z.of_nat (length g) = o1 -> (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length g)) ∧ (length (set_list g 0%nat (- 1%Z)) = length g -> nth_i (set_list g 0%nat (- 1%Z)) = fun_updt (nth_i g) 0%Z (- 1%Z) -> (let o2 : Z := n in 0%Z ≤ o2 ∧ (∀(d : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < o2 -> nth (Z.to_nat i) d inhabitant = 0%Z) ∧ Z.of_nat (length d) = o2 -> (let o3 : Z := n - 1%Z in 1%Z ≤ o3 + 1%Z -> ((nth 0%nat d inhabitant = 0%Z ∧ nth 0%nat (set_list g 0%nat (- 1%Z)) inhabitant = - 1%Z ∧ 0%Z + nth (Z.to_nat (1%Z - 1%Z)) d inhabitant ≤ 1%Z - 1%Z) ∧ (∀(k : Z), 0%Z < k ∧ k < 1%Z -> (nth (Z.to_nat (nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant)) (set_list g 0%nat (- 1%Z)) inhabitant < f k ∧ f k ≤ nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant ∧ nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant < k) ∧ (0%Z < nth (Z.to_nat k) d inhabitant ∧ nth (Z.to_nat k) d inhabitant = nth (Z.to_nat (nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant)) d inhabitant + 1%Z) ∧ (∀(k' : Z), nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant < k' ∧ k' < k -> nth (Z.to_nat (nth (Z.to_nat k) (set_list g 0%nat (- 1%Z)) inhabitant)) d inhabitant < nth (Z.to_nat k') d inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < 1%Z -> distance (nth (Z.to_nat k) d inhabitant) k)) ∧ (∀(count : Z) (d1 : list Z) (g1 : list Z), length d1 = length d -> length g1 = length (set_list g 0%nat (- 1%Z)) -> (∀(i : Z), (1%Z ≤ i ∧ i ≤ o3) ∧ (nth 0%nat d1 inhabitant = 0%Z ∧ nth 0%nat g1 inhabitant = - 1%Z ∧ count + nth (Z.to_nat (i - 1%Z)) d1 inhabitant ≤ i - 1%Z) ∧ (∀(k : Z), 0%Z < k ∧ k < i -> (nth (Z.to_nat (nth (Z.to_nat k) g1 inhabitant)) g1 inhabitant < f k ∧ f k ≤ nth (Z.to_nat k) g1 inhabitant ∧ nth (Z.to_nat k) g1 inhabitant < k) ∧ (0%Z < nth (Z.to_nat k) d1 inhabitant ∧ nth (Z.to_nat k) d1 inhabitant = nth (Z.to_nat (nth (Z.to_nat k) g1 inhabitant)) d1 inhabitant + 1%Z) ∧ (∀(k' : Z), nth (Z.to_nat k) g1 inhabitant < k' ∧ k' < k -> nth (Z.to_nat (nth (Z.to_nat k) g1 inhabitant)) d1 inhabitant < nth (Z.to_nat k') d1 inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> distance (nth (Z.to_nat k) d1 inhabitant) k) -> (let o4 : Z := i - 1%Z in (((f i ≤ o4 ∧ o4 < i) ∧ count + nth (Z.to_nat o4) d1 inhabitant ≤ i - 1%Z) ∧ (∀(k : Z), o4 < k ∧ k < i -> nth (Z.to_nat o4) d1 inhabitant < nth (Z.to_nat k) d1 inhabitant)) ∧ (∀(j : Z) (count1 : Z), ((f i ≤ j ∧ j < i) ∧ count1 + nth (Z.to_nat j) d1 inhabitant ≤ i - 1%Z) ∧ (∀(k : Z), j < k ∧ k < i -> nth (Z.to_nat j) d1 inhabitant < nth (Z.to_nat k) d1 inhabitant) -> (0%Z < i ∧ i < n) ∧ (let o5 : Z := f i in 0%Z ≤ o5 ∧ o5 < i -> (0%Z ≤ j ∧ j < Z.of_nat (length g1)) ∧ (if decide (o5 ≤ nth (Z.to_nat j) g1 inhabitant) then (0%Z ≤ j ∧ j < Z.of_nat (length g1)) ∧ (0%Z ≤ j ∧ nth (Z.to_nat j) g1 inhabitant < j) ∧ ((f i ≤ nth (Z.to_nat j) g1 inhabitant ∧ nth (Z.to_nat j) g1 inhabitant < i) ∧ count1 + 1%Z + nth (Z.to_nat (nth (Z.to_nat j) g1 inhabitant)) d1 inhabitant ≤ i - 1%Z) ∧ (∀(k : Z), nth (Z.to_nat j) g1 inhabitant < k ∧ k < i -> nth (Z.to_nat (nth (Z.to_nat j) g1 inhabitant)) d1 inhabitant < nth (Z.to_nat k) d1 inhabitant) else (0%Z ≤ j ∧ j < Z.of_nat (length d1)) ∧ (let o6 : Z := 1%Z + nth (Z.to_nat j) d1 inhabitant in (0%Z ≤ i ∧ i < Z.of_nat (length d1)) ∧ (length (set_list d1 (Z.to_nat i) o6) = length d1 -> nth_i (set_list d1 (Z.to_nat i) o6) = fun_updt (nth_i d1) i o6 -> (0%Z ≤ i ∧ i < Z.of_nat (length g1)) ∧ (length (set_list g1 (Z.to_nat i) j) = length g1 -> nth_i (set_list g1 (Z.to_nat i) j) = fun_updt (nth_i g1) i j -> (nth 0%nat (set_list d1 (Z.to_nat i) o6) inhabitant = 0%Z ∧ nth 0%nat (set_list g1 (Z.to_nat i) j) inhabitant = - 1%Z ∧ count1 + nth (Z.to_nat (i + 1%Z - 1%Z)) (set_list d1 (Z.to_nat i) o6) inhabitant ≤ i + 1%Z - 1%Z) ∧ (∀(k : Z), 0%Z < k ∧ k < i + 1%Z -> (nth (Z.to_nat (nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant)) (set_list g1 (Z.to_nat i) j) inhabitant < f k ∧ f k ≤ nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant ∧ nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant < k) ∧ (0%Z < nth (Z.to_nat k) (set_list d1 (Z.to_nat i) o6) inhabitant ∧ nth (Z.to_nat k) (set_list d1 (Z.to_nat i) o6) inhabitant = nth (Z.to_nat (nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant)) (set_list d1 (Z.to_nat i) o6) inhabitant + 1%Z) ∧ (∀(k' : Z), nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant < k' ∧ k' < k -> nth (Z.to_nat (nth (Z.to_nat k) (set_list g1 (Z.to_nat i) j) inhabitant)) (set_list d1 (Z.to_nat i) o6) inhabitant < nth (Z.to_nat k') (set_list d1 (Z.to_nat i) o6) inhabitant)) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i + 1%Z -> distance (nth (Z.to_nat k) (set_list d1 (Z.to_nat i) o6) inhabitant) k))))))))))))))).
Proof.
Admitted.
