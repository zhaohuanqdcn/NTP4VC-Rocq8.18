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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Require Import Why3.bintree.Inorder.
Open Scope Z_scope.
Theorem tree_of_array_aux'vc {α : Type} `{Inhabited α} (lo : Z) (hi : Z) (a : list α) (fact0 : 0%Z ≤ lo) (fact1 : lo ≤ hi) (fact2 : hi ≤ Z.of_nat (length a)) : (¬ hi = lo -> ¬ 2%Z = 0%Z ∧ (let mid : Z := lo + Z.rem (hi - lo) 2%Z in ((0%Z ≤ hi - lo ∧ mid - lo < hi - lo) ∧ 0%Z ≤ lo ∧ lo ≤ mid ∧ mid ≤ Z.of_nat (length a)) ∧ (∀(left1 : tree α), (let n : Z := mid - lo in Size.size left1 = n ∧ inorder left1 = drop (Z.to_nat lo) (take (Z.to_nat mid - Z.to_nat lo) a) ∧ (0%Z < n -> (let h : Z := height left1 in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h))) -> (let o1 : Z := mid + 1%Z in ((0%Z ≤ hi - lo ∧ hi - o1 < hi - lo) ∧ 0%Z ≤ o1 ∧ o1 ≤ hi ∧ hi ≤ Z.of_nat (length a)) ∧ (∀(right1 : tree α), (let n : Z := hi - o1 in Size.size right1 = n ∧ inorder right1 = drop (Z.to_nat o1) (take (Z.to_nat hi - Z.to_nat o1) a) ∧ (0%Z < n -> (let h : Z := height right1 in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h))) -> 0%Z ≤ mid ∧ mid < Z.of_nat (length a)))))) ∧ (∀(result : tree α), (if decide (hi = lo) then result = (Empty : tree α) else let mid : Z := lo + Z.rem (hi - lo) 2%Z in ∃(left1 : tree α), (let n : Z := mid - lo in Size.size left1 = n ∧ inorder left1 = drop (Z.to_nat lo) (take (Z.to_nat mid - Z.to_nat lo) a) ∧ (0%Z < n -> (let h : Z := height left1 in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h))) ∧ (let o1 : Z := mid + 1%Z in ∃(right1 : tree α), (let n : Z := hi - o1 in Size.size right1 = n ∧ inorder right1 = drop (Z.to_nat o1) (take (Z.to_nat hi - Z.to_nat o1) a) ∧ (0%Z < n -> (let h : Z := height right1 in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h))) ∧ result = Node left1 (nth (Z.to_nat mid) a inhabitant) right1)) -> (let n : Z := hi - lo in Size.size result = n ∧ inorder result = drop (Z.to_nat lo) (take (Z.to_nat hi - Z.to_nat lo) a) ∧ (0%Z < n -> (let h : Z := height result in Z.pow 2%Z (h - 1%Z) ≤ n ∧ n < Z.pow 2%Z h)))).
Proof.
Admitted.
