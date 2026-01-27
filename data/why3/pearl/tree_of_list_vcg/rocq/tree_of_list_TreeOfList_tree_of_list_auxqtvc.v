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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Require Import Why3.bintree.Inorder.
Require Import Why3.bintree.InorderLength.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Theorem tree_of_list_aux'vc (n : Z) (l : list elt) (fact0 : 0%Z ≤ n) (fact1 : n ≤ Z.of_nat (length l)) : (¬ n = 0%Z -> (let n1 : Z := n - 1%Z in ¬ 2%Z = 0%Z ∧ (let n11 : Z := Z.rem n1 2%Z in ((0%Z ≤ n ∧ n11 < n) ∧ 0%Z ≤ n11 ∧ n11 ≤ Z.of_nat (length l)) ∧ (∀(left1 : tree elt) (l1 : list elt), inorder left1 ++ l1 = l ∧ Size.size left1 = n11 ∧ (0%Z < n11 -> (let h : Z := height left1 in Z.pow 2%Z (h - 1%Z) ≤ n11 ∧ n11 < Z.pow 2%Z h)) -> (match l1 with | [] => False | cons x l2 => (let o1 : Z := n1 - n11 in (0%Z ≤ n ∧ o1 < n) ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length l2)) end))))) ∧ (∀(t : tree elt) (l' : list elt), (if decide (n = 0%Z) then t = (Empty : tree elt) ∧ l' = l else let n1 : Z := n - 1%Z in let n11 : Z := Z.rem n1 2%Z in ∃(t1 : tree elt) (l'1 : list elt), (inorder t1 ++ l'1 = l ∧ Size.size t1 = n11 ∧ (0%Z < n11 -> (let h : Z := height t1 in Z.pow 2%Z (h - 1%Z) ≤ n11 ∧ n11 < Z.pow 2%Z h))) ∧ (match l'1 with | [] => False | cons x l1 => (let o1 : Z := n1 - n11 in ∃(t2 : tree elt), (inorder t2 ++ l' = l1 ∧ Size.size t2 = o1 ∧ (0%Z < o1 -> (let h : Z := height t2 in Z.pow 2%Z (h - 1%Z) ≤ o1 ∧ o1 < Z.pow 2%Z h))) ∧ t = Node t1 x t2) end)) -> inorder t ++ l' = l ∧ Size.size t = n ∧ (0%Z < n -> (let h : Z := height t in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h))).
Admitted.
