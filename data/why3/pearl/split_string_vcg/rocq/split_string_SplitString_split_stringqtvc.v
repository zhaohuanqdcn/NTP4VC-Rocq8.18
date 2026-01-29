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
Theorem split_string'vc (limit : Z) (s : list char) (sep : char) (fact0 : limit = - 1%Z ∨ 1%Z ≤ limit) : if decide (limit = 1%Z) then let r : list (list char) := ([s]:list (list char)) in Z.of_nat (length r) = 1%Z ∧ nth 0%nat r inhabitant = s -> 1%Z ≤ Z.of_nat (length r) ∧ (limit = - 1%Z ∨ Z.of_nat (length r) ≤ limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length r) - 1%Z -> notin sep (nth (Z.to_nat j) r inhabitant)) ∧ (Z.of_nat (length r) = limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length r) - 1%Z)) r inhabitant)) ∧ concat r sep = s else ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length s)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length ([] : list (list char))) -> notin sep (nth (Z.to_nat j) ([] : list (list char)) inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ nth (Z.to_nat j) s inhabitant = sep) ∧ (limit = - 1%Z ∨ Z.of_nat (length ([] : list (list char))) < limit - 1%Z) ∧ concat (([] : list (list char)) ++ [drop 0%nat s]) sep = s) ∧ (∀(b : Z) (i : Z) (ss : list (list char)), (0%Z ≤ b ∧ b ≤ i ∧ i ≤ Z.of_nat (length s)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length ss) -> notin sep (nth (Z.to_nat j) ss inhabitant)) ∧ (∀(j : Z), b ≤ j ∧ j < i -> ¬ nth (Z.to_nat j) s inhabitant = sep) ∧ (limit = - 1%Z ∨ Z.of_nat (length ss) < limit - 1%Z) ∧ concat (ss ++ [drop (Z.to_nat b) s]) sep = s -> (if decide (i < Z.of_nat (length s)) then (0%Z ≤ i ∧ i < Z.of_nat (length s)) ∧ (if decide (nth (Z.to_nat i) s inhabitant = sep) then (0%Z ≤ b ∧ b ≤ i ∧ i ≤ Z.of_nat (length s)) ∧ (let o1 : list char := drop (Z.to_nat b) (take (Z.to_nat i - Z.to_nat b) s) in Z.of_nat (length o1) = i - b ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i - b -> nth (Z.to_nat k) o1 inhabitant = nth (Z.to_nat (b + k)) s inhabitant) -> (let o2 : list (list char) := ss ++ [o1] in Z.of_nat (length o2) = 1%Z + Z.of_nat (length ss) ∧ nth (length ss) o2 inhabitant = o1 ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < Z.of_nat (length ss) -> nth (Z.to_nat i1) o2 inhabitant = nth (Z.to_nat i1) ss inhabitant) -> (if decide (Z.of_nat (length o2) = limit - 1%Z) then let o3 : Z := i + 1%Z in (0%Z ≤ o3 ∧ o3 ≤ Z.of_nat (length s)) ∧ (let o4 : list char := drop (Z.to_nat o3) s in let r : list (list char) := o2 ++ [o4] in Z.of_nat (length r) = 1%Z + Z.of_nat (length o2) ∧ nth (length o2) r inhabitant = o4 ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < Z.of_nat (length o2) -> nth (Z.to_nat i1) r inhabitant = nth (Z.to_nat i1) o2 inhabitant) -> 1%Z ≤ Z.of_nat (length r) ∧ (limit = - 1%Z ∨ Z.of_nat (length r) ≤ limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length r) - 1%Z -> notin sep (nth (Z.to_nat j) r inhabitant)) ∧ (Z.of_nat (length r) = limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length r) - 1%Z)) r inhabitant)) ∧ concat r sep = s) else (0%Z ≤ Z.of_nat (length s) - i ∧ Z.of_nat (length s) - (i + 1%Z) < Z.of_nat (length s) - i) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length s)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length o2) -> notin sep (nth (Z.to_nat j) o2 inhabitant)) ∧ (∀(j : Z), i + 1%Z ≤ j ∧ j < i + 1%Z -> ¬ nth (Z.to_nat j) s inhabitant = sep) ∧ (limit = - 1%Z ∨ Z.of_nat (length o2) < limit - 1%Z) ∧ concat (o2 ++ [drop (Z.to_nat (i + 1%Z)) s]) sep = s))) else (0%Z ≤ Z.of_nat (length s) - i ∧ Z.of_nat (length s) - (i + 1%Z) < Z.of_nat (length s) - i) ∧ (0%Z ≤ b ∧ b ≤ i + 1%Z ∧ i + 1%Z ≤ Z.of_nat (length s)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length ss) -> notin sep (nth (Z.to_nat j) ss inhabitant)) ∧ (∀(j : Z), b ≤ j ∧ j < i + 1%Z -> ¬ nth (Z.to_nat j) s inhabitant = sep) ∧ (limit = - 1%Z ∨ Z.of_nat (length ss) < limit - 1%Z) ∧ concat (ss ++ [drop (Z.to_nat b) s]) sep = s) else (0%Z ≤ b ∧ b ≤ Z.of_nat (length s)) ∧ (let o1 : list char := drop (Z.to_nat b) s in let r : list (list char) := ss ++ [o1] in Z.of_nat (length r) = 1%Z + Z.of_nat (length ss) ∧ nth (length ss) r inhabitant = o1 ∧ (∀(i1 : Z), 0%Z ≤ i1 ∧ i1 < Z.of_nat (length ss) -> nth (Z.to_nat i1) r inhabitant = nth (Z.to_nat i1) ss inhabitant) -> 1%Z ≤ Z.of_nat (length r) ∧ (limit = - 1%Z ∨ Z.of_nat (length r) ≤ limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length r) - 1%Z -> notin sep (nth (Z.to_nat j) r inhabitant)) ∧ (Z.of_nat (length r) = limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length r) - 1%Z)) r inhabitant)) ∧ concat r sep = s))).
Proof.
Admitted.
