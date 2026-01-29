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
Theorem remove_duplicate'vc (a : list t) : let n : Z := Z.of_nat (length a) in 0%Z ≤ n ∧ (∀(from1 : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < n -> nth (Z.to_nat i) from1 inhabitant = 0%Z) ∧ Z.of_nat (length from1) = n -> 0%Z ≤ n ∧ (∀(to' : list Z), (∀(i : Z), 0%Z ≤ i ∧ i < n -> nth (Z.to_nat i) to' inhabitant = 0%Z) ∧ Z.of_nat (length to') = n -> (let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (0%Z ≤ 0%Z ∧ nodup a 0%Z ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> (0%Z ≤ nth (Z.to_nat j) to' inhabitant ∧ nth (Z.to_nat j) to' inhabitant < 0%Z) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) to' inhabitant)) a inhabitant) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> (0%Z ≤ nth (Z.to_nat j) from1 inhabitant ∧ nth (Z.to_nat j) from1 inhabitant < 0%Z) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) from1 inhabitant)) a inhabitant)) ∧ (∀(to_1 : list Z) (from2 : list Z) (r : Z) (a1 : list t), length to_1 = length to' -> length from2 = length from1 -> length a1 = length a -> (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ r ∧ r ≤ i) ∧ nodup a1 r ∧ (∀(j : Z), 0%Z ≤ j ∧ j < r -> (0%Z ≤ nth (Z.to_nat j) to_1 inhabitant ∧ nth (Z.to_nat j) to_1 inhabitant < i) ∧ nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (nth (Z.to_nat j) to_1 inhabitant)) a inhabitant) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> (0%Z ≤ nth (Z.to_nat j) from2 inhabitant ∧ nth (Z.to_nat j) from2 inhabitant < r) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) from2 inhabitant)) a1 inhabitant) ∧ (∀(j : Z), i ≤ j ∧ j < n -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) -> (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (let o2 : t := nth (Z.to_nat i) a1 inhabitant in (0%Z ≤ r ∧ r ≤ Z.of_nat (length a1)) ∧ (∀(w : Z), (appears o2 a1 r -> (0%Z ≤ w ∧ w < r) ∧ nth (Z.to_nat w) a1 inhabitant = o2) -> (if decide (¬ appears o2 a1 r) then (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (let o3 : t := nth (Z.to_nat i) a1 inhabitant in (0%Z ≤ r ∧ r < Z.of_nat (length a1)) ∧ (length (set_list a1 (Z.to_nat r) o3) = length a1 -> nth_i (set_list a1 (Z.to_nat r) o3) = fun_updt (nth_i a1) r o3 -> (0%Z ≤ i ∧ i < Z.of_nat (length from2)) ∧ (length (set_list from2 (Z.to_nat i) r) = length from2 -> nth_i (set_list from2 (Z.to_nat i) r) = fun_updt (nth_i from2) i r -> (0%Z ≤ r ∧ r < Z.of_nat (length to_1)) ∧ (length (set_list to_1 (Z.to_nat r) i) = length to_1 -> nth_i (set_list to_1 (Z.to_nat r) i) = fun_updt (nth_i to_1) r i -> (0%Z ≤ r + 1%Z ∧ r + 1%Z ≤ i + 1%Z) ∧ nodup (set_list a1 (Z.to_nat r) o3) (r + 1%Z) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < r + 1%Z -> (0%Z ≤ nth (Z.to_nat j) (set_list to_1 (Z.to_nat r) i) inhabitant ∧ nth (Z.to_nat j) (set_list to_1 (Z.to_nat r) i) inhabitant < i + 1%Z) ∧ nth (Z.to_nat j) (set_list a1 (Z.to_nat r) o3) inhabitant = nth (Z.to_nat (nth (Z.to_nat j) (set_list to_1 (Z.to_nat r) i) inhabitant)) a inhabitant) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> (0%Z ≤ nth (Z.to_nat j) (set_list from2 (Z.to_nat i) r) inhabitant ∧ nth (Z.to_nat j) (set_list from2 (Z.to_nat i) r) inhabitant < r + 1%Z) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) (set_list from2 (Z.to_nat i) r) inhabitant)) (set_list a1 (Z.to_nat r) o3) inhabitant) ∧ (∀(j : Z), i + 1%Z ≤ j ∧ j < n -> nth (Z.to_nat j) (set_list a1 (Z.to_nat r) o3) inhabitant = nth (Z.to_nat j) a inhabitant))))) else (0%Z ≤ i ∧ i < Z.of_nat (length from2)) ∧ (length (set_list from2 (Z.to_nat i) w) = length from2 -> nth_i (set_list from2 (Z.to_nat i) w) = fun_updt (nth_i from2) i w -> (0%Z ≤ r ∧ r ≤ i + 1%Z) ∧ nodup a1 r ∧ (∀(j : Z), 0%Z ≤ j ∧ j < r -> (0%Z ≤ nth (Z.to_nat j) to_1 inhabitant ∧ nth (Z.to_nat j) to_1 inhabitant < i + 1%Z) ∧ nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (nth (Z.to_nat j) to_1 inhabitant)) a inhabitant) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> (0%Z ≤ nth (Z.to_nat j) (set_list from2 (Z.to_nat i) w) inhabitant ∧ nth (Z.to_nat j) (set_list from2 (Z.to_nat i) w) inhabitant < r) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) (set_list from2 (Z.to_nat i) w) inhabitant)) a1 inhabitant) ∧ (∀(j : Z), i + 1%Z ≤ j ∧ j < n -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant)))))) ∧ ((0%Z ≤ r ∧ r ≤ o1 + 1%Z) ∧ nodup a1 r ∧ (∀(j : Z), 0%Z ≤ j ∧ j < r -> (0%Z ≤ nth (Z.to_nat j) to_1 inhabitant ∧ nth (Z.to_nat j) to_1 inhabitant < o1 + 1%Z) ∧ nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat (nth (Z.to_nat j) to_1 inhabitant)) a inhabitant) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> (0%Z ≤ nth (Z.to_nat j) from2 inhabitant ∧ nth (Z.to_nat j) from2 inhabitant < r) ∧ nth (Z.to_nat j) a inhabitant = nth (Z.to_nat (nth (Z.to_nat j) from2 inhabitant)) a1 inhabitant) ∧ (∀(j : Z), o1 + 1%Z ≤ j ∧ j < n -> nth (Z.to_nat j) a1 inhabitant = nth (Z.to_nat j) a inhabitant) -> (0%Z ≤ r ∧ r ≤ Z.of_nat (length a1)) ∧ nodup a1 r ∧ (∀(v : t), appears v a (Z.of_nat (length a1)) = appears v a1 r)))) ∧ (o1 + 1%Z < 0%Z -> (0%Z ≤ 0%Z ∧ 0%Z ≤ Z.of_nat (length a)) ∧ nodup a 0%Z ∧ (∀(v : t), appears v a (Z.of_nat (length a)) = appears v a 0%Z))))).
Proof.
Admitted.
