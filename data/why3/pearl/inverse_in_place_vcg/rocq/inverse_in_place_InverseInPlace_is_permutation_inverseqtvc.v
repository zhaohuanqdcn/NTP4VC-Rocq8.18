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
Open Scope Z_scope.
Definition prefix_tl (x : Z) : Z := - x - 1%Z.
Axiom fc : (Z -> Z) -> Z -> bool.
Axiom fc'def : forall  (m : Z -> Z) (n : Z), (fc m n = true) = (0%Z ≤ m n).
Definition numof (m : Z -> Z) (l : Z) (r : Z) : Z := NumOf.numof (fc m) l r.
Definition is_permutation (a : list Z) := ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length a) -> (0%Z ≤ nth (Z.to_nat i) a inhabitant ∧ nth (Z.to_nat i) a inhabitant < Z.of_nat (length a)) ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length a) -> ¬ i = j -> ¬ nth (Z.to_nat i) a inhabitant = nth (Z.to_nat j) a inhabitant).
Theorem is_permutation_inverse'vc (a : list Z) (b : list Z) (fact0 : length a = length b) (fact1 : is_permutation a) (fact2 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length b) -> 0%Z ≤ nth (Z.to_nat i) b inhabitant ∧ nth (Z.to_nat i) b inhabitant < Z.of_nat (length b)) (fact3 : ∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length b) -> nth (Z.to_nat (nth (Z.to_nat i) b inhabitant)) a inhabitant = i) : is_permutation b.
Proof.
Admitted.
