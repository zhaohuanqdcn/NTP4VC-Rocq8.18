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
Require Import Why3.int.NumOf.
Require Import Why3.map.MapExchange.
Open Scope Z_scope.
Definition mem (x : Z) (a : list Z) := ∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length a)) ∧ nth (Z.to_nat i) a inhabitant = x.
Axiom placed : list Z -> Z -> bool.
Axiom placed'def : forall  (a : list Z) (i : Z), (placed a i = true) = (nth (Z.to_nat i) a inhabitant = i).
Theorem mex'vc (a : list Z) : let n : Z := Z.of_nat (length a) in ((0%Z ≤ 0%Z ∧ 0%Z ≤ n) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> 0%Z ≤ nth (Z.to_nat j) a inhabitant ∧ nth (Z.to_nat j) a inhabitant < n -> nth (Z.to_nat (nth (Z.to_nat j) a inhabitant)) a inhabitant = nth (Z.to_nat j) a inhabitant)) ∧ (∀(i : Z) (a1 : list Z), length a1 = length a -> (0%Z ≤ i ∧ i ≤ n) ∧ (∀(x : Z), mem x a1 = mem x a) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> 0%Z ≤ nth (Z.to_nat j) a1 inhabitant ∧ nth (Z.to_nat j) a1 inhabitant < n -> nth (Z.to_nat (nth (Z.to_nat j) a1 inhabitant)) a1 inhabitant = nth (Z.to_nat j) a1 inhabitant) -> (if decide (i < n) then (0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ (let x : Z := nth (Z.to_nat i) a1 inhabitant in (¬ x < 0%Z -> ¬ n ≤ x -> 0%Z ≤ x ∧ x < Z.of_nat (length a1)) ∧ (∀(o1 : bool), (if decide (x < 0%Z) then o1 = true else if decide (n ≤ x) then o1 = true else o1 = (if decide (nth (Z.to_nat x) a1 inhabitant = x) then true else false)) -> (if decide (o1 = true) then (0%Z ≤ n - i + n - numof (placed a1) 0%Z n ∧ n - (i + 1%Z) + n - numof (placed a1) 0%Z n < n - i + n - numof (placed a1) 0%Z n) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ n) ∧ (∀(x1 : Z), mem x1 a1 = mem x1 a) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> 0%Z ≤ nth (Z.to_nat j) a1 inhabitant ∧ nth (Z.to_nat j) a1 inhabitant < n -> nth (Z.to_nat (nth (Z.to_nat j) a1 inhabitant)) a1 inhabitant = nth (Z.to_nat j) a1 inhabitant) else if decide (x < i) then ((0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ 0%Z ≤ x ∧ x < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 i x -> (0%Z ≤ n - i + n - numof (placed a1) 0%Z n ∧ n - (i + 1%Z) + n - numof (placed a2) 0%Z n < n - i + n - numof (placed a1) 0%Z n) ∧ (0%Z ≤ i + 1%Z ∧ i + 1%Z ≤ n) ∧ (∀(x1 : Z), mem x1 a2 = mem x1 a) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i + 1%Z -> 0%Z ≤ nth (Z.to_nat j) a2 inhabitant ∧ nth (Z.to_nat j) a2 inhabitant < n -> nth (Z.to_nat (nth (Z.to_nat j) a2 inhabitant)) a2 inhabitant = nth (Z.to_nat j) a2 inhabitant)) else ((0%Z ≤ i ∧ i < Z.of_nat (length a1)) ∧ 0%Z ≤ x ∧ x < Z.of_nat (length a1)) ∧ (∀(a2 : list Z), length a2 = length a1 -> array_exchange a1 a2 i x -> (0%Z ≤ n - i + n - numof (placed a1) 0%Z n ∧ n - i + n - numof (placed a2) 0%Z n < n - i + n - numof (placed a1) 0%Z n) ∧ (0%Z ≤ i ∧ i ≤ n) ∧ (∀(x1 : Z), mem x1 a2 = mem x1 a) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> 0%Z ≤ nth (Z.to_nat j) a2 inhabitant ∧ nth (Z.to_nat j) a2 inhabitant < n -> nth (Z.to_nat (nth (Z.to_nat j) a2 inhabitant)) a2 inhabitant = nth (Z.to_nat j) a2 inhabitant))))) else let o1 : Z := n - 1%Z in (0%Z ≤ o1 + 1%Z -> (∀(j : Z), 0%Z ≤ j ∧ j < 0%Z -> nth (Z.to_nat j) a1 inhabitant = j) ∧ (∀(i1 : Z), (0%Z ≤ i1 ∧ i1 ≤ o1) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i1 -> nth (Z.to_nat j) a1 inhabitant = j) -> (0%Z ≤ i1 ∧ i1 < Z.of_nat (length a1)) ∧ (if decide (¬ nth (Z.to_nat i1) a1 inhabitant = i1) then (0%Z ≤ i1 ∧ i1 ≤ Z.of_nat (length a1)) ∧ ¬ mem i1 a ∧ (∀(x : Z), 0%Z ≤ x ∧ x < i1 -> mem x a) else ∀(j : Z), 0%Z ≤ j ∧ j < i1 + 1%Z -> nth (Z.to_nat j) a1 inhabitant = j)) ∧ ((∀(j : Z), 0%Z ≤ j ∧ j < o1 + 1%Z -> nth (Z.to_nat j) a1 inhabitant = j) -> (0%Z ≤ n ∧ n ≤ Z.of_nat (length a1)) ∧ ¬ mem n a ∧ (∀(x : Z), 0%Z ≤ x ∧ x < n -> mem x a))) ∧ (o1 + 1%Z < 0%Z -> (0%Z ≤ n ∧ n ≤ Z.of_nat (length a1)) ∧ ¬ mem n a ∧ (∀(x : Z), 0%Z ≤ x ∧ x < n -> mem x a)))).
Proof.
Admitted.
