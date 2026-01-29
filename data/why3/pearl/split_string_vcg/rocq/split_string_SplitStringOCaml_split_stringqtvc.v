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
Require Import Why3.queue.Queue.
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
Axiom contents' : string' -> list char.
Axiom concat : list string' -> char -> list char.
Axiom concat'def : forall  (ss : list string') (sep : char) (fact0 : 1%Z ≤ Z.of_nat (length ss)), if decide (Z.of_nat (length ss) = 1%Z) then concat ss sep = contents' (nth 0%nat ss inhabitant) else concat ss sep = concat (drop 0%nat (take (Z.to_nat (Z.of_nat (length ss) - 1%Z) - 0%nat) ss)) sep ++ cons sep (contents' (nth (Z.to_nat (Z.of_nat (length ss) - 1%Z)) ss inhabitant)).
Definition notin (sep : char) (s : string') := ¬ sep ∈ contents' s.
Theorem split_string'vc (limit : bv 63%N) (o1 : t string') (s : string') (sep : char) (fact0 : bv_signed limit = - 1%Z ∨ 1%Z ≤ bv_signed limit) (fact1 : seq o1 = ([] : list string')) (fact2 : bv_signed limit = 1%Z -> limit = (1%bv : bv 63%N)) : if decide (limit = (1%bv : bv 63%N)) then ∀(ss : t string'), seq ss = seq o1 ++ [s] -> 1%Z ≤ Z.of_nat (length (seq ss)) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss)) ≤ bv_signed limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss)) - 1%Z -> notin sep (nth (Z.to_nat j) (seq ss) inhabitant)) ∧ (Z.of_nat (length (seq ss)) = bv_signed limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length (seq ss)) - 1%Z)) (seq ss) inhabitant)) ∧ concat (seq ss) sep = contents' s else ((0%Z ≤ 0%Z ∧ 0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length (contents' s))) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq o1)) -> notin sep (nth (Z.to_nat j) (seq o1) inhabitant)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> ¬ nth (Z.to_nat j) (contents' s) inhabitant = sep) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq o1)) < bv_signed limit - 1%Z) ∧ contents' s = drop 0%nat (contents' s) ∧ concat (seq o1 ++ [s]) sep = contents' s) ∧ (∀(suffix : string') (b : bv 63%N) (i : bv 63%N) (ss : t string'), (0%Z ≤ bv_signed b ∧ bv_signed b ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (length (contents' s))) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss)) -> notin sep (nth (Z.to_nat j) (seq ss) inhabitant)) ∧ (∀(j : Z), bv_signed b ≤ j ∧ j < bv_signed i -> ¬ nth (Z.to_nat j) (contents' s) inhabitant = sep) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss)) < bv_signed limit - 1%Z) ∧ contents' suffix = drop (Z.to_nat (bv_signed b)) (contents' s) ∧ concat (seq ss ++ [suffix]) sep = contents' s -> (∀(o2 : bv 63%N), bv_signed o2 = Z.of_nat (length (contents' s)) -> (if decide (bv_signed i < bv_signed o2) then (0%Z ≤ bv_signed i ∧ bv_signed i < Z.of_nat (length (contents' s))) ∧ (if decide (nth (Z.to_nat (bv_signed i)) (contents' s) inhabitant = sep) then (0%Z ≤ bv_signed b ∧ bv_signed b ≤ bv_signed i ∧ bv_signed i ≤ Z.of_nat (length (contents' s))) ∧ (∀(o3 : string'), contents' o3 = drop (Z.to_nat (bv_signed b)) (take (Z.to_nat (bv_signed i) - Z.to_nat (bv_signed b)) (contents' s)) -> (∀(ss1 : t string'), seq ss1 = seq ss ++ [o3] -> int'63_in_bounds (bv_signed limit - 1%Z) ∧ (∀(o4 : bv 63%N), bv_signed o4 = bv_signed limit - 1%Z -> (∀(o5 : nat), o5 = length (seq ss1) -> (∀(o6 : bv 63%N), bv_signed o6 = Z.of_nat o5 -> (bv_signed o6 = bv_signed o4 -> o6 = o4) -> (if decide (o6 = o4) then ∀(o7 : bv 63%N), bv_signed o7 = Z.of_nat (length (contents' s)) -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o8 : bv 63%N), bv_signed o8 = bv_signed i + 1%Z -> (0%Z ≤ bv_signed o8 ∧ bv_signed o8 ≤ bv_signed o7 ∧ bv_signed o7 ≤ Z.of_nat (length (contents' s))) ∧ (∀(o9 : string'), contents' o9 = drop (Z.to_nat (bv_signed o8)) (take (Z.to_nat (bv_signed o7) - Z.to_nat (bv_signed o8)) (contents' s)) -> (∀(ss2 : t string'), seq ss2 = seq ss1 ++ [o9] -> 1%Z ≤ Z.of_nat (length (seq ss2)) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss2)) ≤ bv_signed limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss2)) - 1%Z -> notin sep (nth (Z.to_nat j) (seq ss2) inhabitant)) ∧ (Z.of_nat (length (seq ss2)) = bv_signed limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length (seq ss2)) - 1%Z)) (seq ss2) inhabitant)) ∧ concat (seq ss2) sep = contents' s))) else int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o7 : bv 63%N), bv_signed o7 = bv_signed i + 1%Z -> (∀(o8 : bv 63%N), bv_signed o8 = Z.of_nat (length (contents' s)) -> (0%Z ≤ bv_signed o7 ∧ bv_signed o7 ≤ bv_signed o8 ∧ bv_signed o8 ≤ Z.of_nat (length (contents' s))) ∧ (∀(o9 : string'), contents' o9 = drop (Z.to_nat (bv_signed o7)) (take (Z.to_nat (bv_signed o8) - Z.to_nat (bv_signed o7)) (contents' s)) -> int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o10 : bv 63%N), bv_signed o10 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length (contents' s)) - bv_signed i ∧ Z.of_nat (length (contents' s)) - bv_signed o10 < Z.of_nat (length (contents' s)) - bv_signed i) ∧ (0%Z ≤ bv_signed o7 ∧ bv_signed o7 ≤ bv_signed o10 ∧ bv_signed o10 ≤ Z.of_nat (length (contents' s))) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss1)) -> notin sep (nth (Z.to_nat j) (seq ss1) inhabitant)) ∧ (∀(j : Z), bv_signed o7 ≤ j ∧ j < bv_signed o10 -> ¬ nth (Z.to_nat j) (contents' s) inhabitant = sep) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss1)) < bv_signed limit - 1%Z) ∧ contents' o9 = drop (Z.to_nat (bv_signed o7)) (contents' s) ∧ concat (seq ss1 ++ [o9]) sep = contents' s)))))))))) else int'63_in_bounds (bv_signed i + 1%Z) ∧ (∀(o3 : bv 63%N), bv_signed o3 = bv_signed i + 1%Z -> (0%Z ≤ Z.of_nat (length (contents' s)) - bv_signed i ∧ Z.of_nat (length (contents' s)) - bv_signed o3 < Z.of_nat (length (contents' s)) - bv_signed i) ∧ (0%Z ≤ bv_signed b ∧ bv_signed b ≤ bv_signed o3 ∧ bv_signed o3 ≤ Z.of_nat (length (contents' s))) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss)) -> notin sep (nth (Z.to_nat j) (seq ss) inhabitant)) ∧ (∀(j : Z), bv_signed b ≤ j ∧ j < bv_signed o3 -> ¬ nth (Z.to_nat j) (contents' s) inhabitant = sep) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss)) < bv_signed limit - 1%Z) ∧ contents' suffix = drop (Z.to_nat (bv_signed b)) (contents' s) ∧ concat (seq ss ++ [suffix]) sep = contents' s)) else ∀(o3 : bv 63%N), bv_signed o3 = Z.of_nat (length (contents' s)) -> (0%Z ≤ bv_signed b ∧ bv_signed b ≤ bv_signed o3 ∧ bv_signed o3 ≤ Z.of_nat (length (contents' s))) ∧ (∀(o4 : string'), contents' o4 = drop (Z.to_nat (bv_signed b)) (take (Z.to_nat (bv_signed o3) - Z.to_nat (bv_signed b)) (contents' s)) -> (∀(ss1 : t string'), seq ss1 = seq ss ++ [o4] -> 1%Z ≤ Z.of_nat (length (seq ss1)) ∧ (bv_signed limit = - 1%Z ∨ Z.of_nat (length (seq ss1)) ≤ bv_signed limit) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length (seq ss1)) - 1%Z -> notin sep (nth (Z.to_nat j) (seq ss1) inhabitant)) ∧ (Z.of_nat (length (seq ss1)) = bv_signed limit ∨ notin sep (nth (Z.to_nat (Z.of_nat (length (seq ss1)) - 1%Z)) (seq ss1) inhabitant)) ∧ concat (seq ss1) sep = contents' s))))).
Proof.
Admitted.
