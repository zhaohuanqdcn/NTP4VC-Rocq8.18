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
Axiom any_char : char.
Axiom gap_buffer : Type.
Axiom gap_buffer_inhabited : Inhabited gap_buffer.
Global Existing Instance gap_buffer_inhabited.
Axiom gap_buffer_countable : Countable gap_buffer.
Global Existing Instance gap_buffer_countable.
Axiom a : gap_buffer -> list char.
Axiom l : gap_buffer -> Z.
Axiom r : gap_buffer -> Z.
Axiom content : gap_buffer -> list char.
Axiom gap_buffer'invariant : forall  (self : gap_buffer), 0%Z ≤ l self ∧ l self ≤ r self ∧ r self ≤ Z.of_nat (length (a self)) ∧ Z.of_nat (length (a self)) = Z.of_nat (length (content self)) + r self - l self ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l self -> nth (Z.to_nat i) (content self) inhabitant = nth_i (a self) i) ∧ (∀(i : Z), l self ≤ i ∧ i < Z.of_nat (length (content self)) -> nth (Z.to_nat i) (content self) inhabitant = nth_i (a self) (i + r self - l self)).
Definition gap_buffer'eq (a1 : gap_buffer) (b : gap_buffer) := a a1 = a b ∧ l a1 = l b ∧ r a1 = r b ∧ content a1 = content b.
Axiom gap_buffer'inj : forall  (a1 : gap_buffer) (b : gap_buffer) (fact0 : gap_buffer'eq a1 b), a1 = b.
Theorem insert'vc (g : gap_buffer) (x : char) : if decide (l g = r g) then ∀(g1 : gap_buffer), content g = content g1 ∧ l g = l g1 -> (l g1 = l g ∧ content g1 = content g) ∧ l g1 < r g1 -> (let o1 : Z := l g1 in let o2 : list char := content g1 in (0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length o2)) ∧ (let o3 : list char := drop (Z.to_nat o1) o2 in let o4 : list char := cons x o3 in Z.of_nat (length o4) = 1%Z + Z.of_nat (length o3) ∧ nth 0%nat o4 inhabitant = x ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o3) -> nth (Z.to_nat i) o4 inhabitant = nth (Z.to_nat (i - 1%Z)) o3 inhabitant) -> (let o5 : Z := l g1 in let o6 : list char := content g1 in (0%Z ≤ o5 ∧ o5 ≤ Z.of_nat (length o6)) ∧ (let o7 : list char := take (Z.to_nat o5) o6 in let o8 : list char := o7 ++ o4 in Z.of_nat (length o8) = Z.of_nat (length o7) + Z.of_nat (length o4) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o7) -> nth (Z.to_nat i) o8 inhabitant = nth (Z.to_nat i) o7 inhabitant) ∧ (∀(i : Z), Z.of_nat (length o7) ≤ i ∧ i < Z.of_nat (length o8) -> nth (Z.to_nat i) o8 inhabitant = nth (Z.to_nat (i - Z.of_nat (length o7))) o4 inhabitant) -> (0%Z ≤ l g1 ∧ l g1 < Z.of_nat (length (a g1))) ∧ (length (set_list (a g1) (Z.to_nat (l g1)) x) = length (a g1) -> length (set_list (a g1) (Z.to_nat (l g1)) x) = length (a g1) -> nth_i (set_list (a g1) (Z.to_nat (l g1)) x) = fun_updt (nth_i (a g1)) (l g1) x -> (∀(g2 : gap_buffer), ((0%Z ≤ l g1 + 1%Z ∧ l g1 + 1%Z ≤ r g1 ∧ r g1 ≤ Z.of_nat (length (set_list (a g1) (Z.to_nat (l g1)) x))) ∧ Z.of_nat (length (set_list (a g1) (Z.to_nat (l g1)) x)) = Z.of_nat (length o8) + r g1 - (l g1 + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l g1 + 1%Z -> nth (Z.to_nat i) o8 inhabitant = nth_i (set_list (a g1) (Z.to_nat (l g1)) x) i) ∧ (∀(i : Z), l g1 + 1%Z ≤ i ∧ i < Z.of_nat (length o8) -> nth (Z.to_nat i) o8 inhabitant = nth_i (set_list (a g1) (Z.to_nat (l g1)) x) (i + r g1 - (l g1 + 1%Z)))) ∧ (o8 = content g2 ∧ r g1 = r g2 ∧ l g1 + 1%Z = l g2 ∧ set_list (a g1) (Z.to_nat (l g1)) x = a g2 -> l g2 = l g + 1%Z ∧ content g2 = take (Z.to_nat (l g)) (content g) ++ cons x (drop (Z.to_nat (l g)) (content g))))))))) else let o1 : Z := l g in let o2 : list char := content g in (0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length o2)) ∧ (let o3 : list char := drop (Z.to_nat o1) o2 in let o4 : list char := cons x o3 in Z.of_nat (length o4) = 1%Z + Z.of_nat (length o3) ∧ nth 0%nat o4 inhabitant = x ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o3) -> nth (Z.to_nat i) o4 inhabitant = nth (Z.to_nat (i - 1%Z)) o3 inhabitant) -> (let o5 : Z := l g in let o6 : list char := content g in (0%Z ≤ o5 ∧ o5 ≤ Z.of_nat (length o6)) ∧ (let o7 : list char := take (Z.to_nat o5) o6 in let o8 : list char := o7 ++ o4 in Z.of_nat (length o8) = Z.of_nat (length o7) + Z.of_nat (length o4) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o7) -> nth (Z.to_nat i) o8 inhabitant = nth (Z.to_nat i) o7 inhabitant) ∧ (∀(i : Z), Z.of_nat (length o7) ≤ i ∧ i < Z.of_nat (length o8) -> nth (Z.to_nat i) o8 inhabitant = nth (Z.to_nat (i - Z.of_nat (length o7))) o4 inhabitant) -> (0%Z ≤ l g ∧ l g < Z.of_nat (length (a g))) ∧ (length (set_list (a g) (Z.to_nat (l g)) x) = length (a g) -> length (set_list (a g) (Z.to_nat (l g)) x) = length (a g) -> nth_i (set_list (a g) (Z.to_nat (l g)) x) = fun_updt (nth_i (a g)) (l g) x -> (∀(g1 : gap_buffer), ((0%Z ≤ l g + 1%Z ∧ l g + 1%Z ≤ r g ∧ r g ≤ Z.of_nat (length (set_list (a g) (Z.to_nat (l g)) x))) ∧ Z.of_nat (length (set_list (a g) (Z.to_nat (l g)) x)) = Z.of_nat (length o8) + r g - (l g + 1%Z) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < l g + 1%Z -> nth (Z.to_nat i) o8 inhabitant = nth_i (set_list (a g) (Z.to_nat (l g)) x) i) ∧ (∀(i : Z), l g + 1%Z ≤ i ∧ i < Z.of_nat (length o8) -> nth (Z.to_nat i) o8 inhabitant = nth_i (set_list (a g) (Z.to_nat (l g)) x) (i + r g - (l g + 1%Z)))) ∧ (o8 = content g1 ∧ r g = r g1 ∧ l g + 1%Z = l g1 ∧ set_list (a g) (Z.to_nat (l g)) x = a g1 -> l g1 = l g + 1%Z ∧ content g1 = take (Z.to_nat (l g)) (content g) ++ cons x (drop (Z.to_nat (l g)) (content g)))))))).
Admitted.
