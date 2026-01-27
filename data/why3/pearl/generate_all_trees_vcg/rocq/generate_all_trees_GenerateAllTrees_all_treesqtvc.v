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
Inductive tree :=
  | Empty : tree
  | Node : tree -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint size (t : tree) : Z :=
match t with | Empty => 0%Z | Node l r => 1%Z + size l + size r end.
Admit Obligations.
Definition all_trees (n : Z) (l : list tree) := NoDup l ∧ (∀(t : tree), (size t = n) = (t ∈ l)).
Theorem all_trees'vc (n : Z) (fact0 : 0%Z ≤ n) : let o1 : Z := n + 1%Z in 0%Z ≤ o1 ∧ (∀(a : list (list tree)), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) a inhabitant = ([] : list tree)) ∧ Z.of_nat (length a) = o1 -> (let o2 : list tree := cons (Empty : tree) ([] : list tree) in (0%Z ≤ 0%Z ∧ 0%Z < Z.of_nat (length a)) ∧ (length (set_list a 0%nat o2) = length a -> nth_i (set_list a 0%nat o2) = fun_updt (nth_i a) 0%Z o2 -> (1%Z ≤ n + 1%Z -> (∀(k : Z), 0%Z ≤ k ∧ k < 1%Z -> all_trees k (nth (Z.to_nat k) (set_list a 0%nat o2) inhabitant)) ∧ (∀(a1 : list (list tree)), length a1 = length (set_list a 0%nat o2) -> (∀(i : Z), (1%Z ≤ i ∧ i ≤ n) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> all_trees k (nth (Z.to_nat k) a1 inhabitant)) -> (let o3 : list tree := ([] : list tree) in (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat i) o3) = length a1 -> nth_i (set_list a1 (Z.to_nat i) o3) = fun_updt (nth_i a1) i o3 -> (let o4 : Z := i - 1%Z in (0%Z ≤ o4 + 1%Z -> ((∀(k : Z), 0%Z ≤ k ∧ k < i -> all_trees k (nth (Z.to_nat k) (set_list a1 (Z.to_nat i) o3) inhabitant)) ∧ NoDup (nth (Z.to_nat i) (set_list a1 (Z.to_nat i) o3) inhabitant) ∧ (∀(t : tree), (t ∈ nth (Z.to_nat i) (set_list a1 (Z.to_nat i) o3) inhabitant) = (∃(l : tree) (r : tree), t = Node l r ∧ size t = i ∧ size l < 0%Z))) ∧ (∀(a2 : list (list tree)), length a2 = length (set_list a1 (Z.to_nat i) o3) -> (∀(j : Z), (0%Z ≤ j ∧ j ≤ o4) ∧ (∀(k : Z), 0%Z ≤ k ∧ k < i -> all_trees k (nth (Z.to_nat k) a2 inhabitant)) ∧ NoDup (nth (Z.to_nat i) a2 inhabitant) ∧ (∀(t : tree), (t ∈ nth (Z.to_nat i) a2 inhabitant) = (∃(l : tree) (r : tree), t = Node l r ∧ size t = i ∧ size l < j)) -> (0%Z ≤ i ∧ i < Z.of_nat (length a2)) ∧ (let o5 : Z := i - 1%Z - j in (0%Z ≤ o5 ∧ o5 < Z.of_nat (length a2)) ∧ (let o6 : Z := i - 1%Z - j in (0%Z ≤ j ∧ j < Z.of_nat (length a2)) ∧ (0%Z ≤ j ∧ all_trees j (nth (Z.to_nat j) a2 inhabitant) ∧ 0%Z ≤ o6 ∧ all_trees o6 (nth (Z.to_nat o5) a2 inhabitant)) ∧ (∀(o7 : list tree), NoDup o7 ∧ (∀(t : tree), (t ∈ o7) = (∃(l : tree) (r : tree), t = Node l r ∧ size l = j ∧ size r = o6)) -> (let o8 : list tree := o7 ++ nth (Z.to_nat i) a2 inhabitant in (0%Z ≤ i ∧ i < Z.of_nat (length a2)) ∧ (length (set_list a2 (Z.to_nat i) o8) = length a2 -> nth_i (set_list a2 (Z.to_nat i) o8) = fun_updt (nth_i a2) i o8 -> (∀(k : Z), 0%Z ≤ k ∧ k < i -> all_trees k (nth (Z.to_nat k) (set_list a2 (Z.to_nat i) o8) inhabitant)) ∧ NoDup (nth (Z.to_nat i) (set_list a2 (Z.to_nat i) o8) inhabitant) ∧ (∀(t : tree), (t ∈ nth (Z.to_nat i) (set_list a2 (Z.to_nat i) o8) inhabitant) = (∃(l : tree) (r : tree), t = Node l r ∧ size t = i ∧ size l < j + 1%Z)))))))) ∧ ((∀(k : Z), 0%Z ≤ k ∧ k < i -> all_trees k (nth (Z.to_nat k) a2 inhabitant)) ∧ NoDup (nth (Z.to_nat i) a2 inhabitant) ∧ (∀(t : tree), (t ∈ nth (Z.to_nat i) a2 inhabitant) = (∃(l : tree) (r : tree), t = Node l r ∧ size t = i ∧ size l < o4 + 1%Z)) -> (∀(k : Z), 0%Z ≤ k ∧ k < i + 1%Z -> all_trees k (nth (Z.to_nat k) a2 inhabitant))))) ∧ (o4 + 1%Z < 0%Z -> (∀(k : Z), 0%Z ≤ k ∧ k < i + 1%Z -> all_trees k (nth (Z.to_nat k) (set_list a1 (Z.to_nat i) o3) inhabitant))))))) ∧ ((∀(k : Z), 0%Z ≤ k ∧ k < n + 1%Z -> all_trees k (nth (Z.to_nat k) a1 inhabitant)) -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ n -> all_trees i (nth (Z.to_nat i) a1 inhabitant))))) ∧ (n + 1%Z < 1%Z -> (∀(i : Z), 0%Z ≤ i ∧ i ≤ n -> all_trees i (nth (Z.to_nat i) (set_list a 0%nat o2) inhabitant)))))).
Admitted.
