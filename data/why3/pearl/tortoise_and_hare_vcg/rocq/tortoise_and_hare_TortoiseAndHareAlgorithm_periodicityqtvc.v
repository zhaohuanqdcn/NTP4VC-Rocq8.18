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
Require Import Why3.int.Iter.
Require Import Why3.pigeon.Pigeonhole.
Open Scope Z_scope.
Axiom f : Z -> Z.
Axiom m : Z.
Axiom m_positive : 0%Z < m.
Axiom f_range : forall  (x : Z) (fact0 : 0%Z ≤ x) (fact1 : x < m), 0%Z ≤ f x ∧ f x < m.
Axiom x0 : Z.
Axiom x0'def : 0%Z ≤ x0 ∧ x0 < m.
Axiom f_closure : Z -> Z.
Axiom f_closure_def : forall  (y : Z), f_closure y = f y.
Definition x (i : Z) : Z := iter f_closure i x0.
Axiom get_closure : forall {α : Type} `{Inhabited α}, list α -> Z -> α.
Axiom get_closure_def : forall  {α : Type} `{Inhabited α} (y : list α) (y1 : Z), get_closure y y1 = nth (Z.to_nat y1) y inhabitant.
Theorem periodicity'vc : let o1 : Z := x0 in let o2 : list Z := ([o1]:list Z) in Z.of_nat (length o2) = 1%Z ∧ nth 0%nat o2 inhabitant = o1 -> (let o3 : Z := m in (1%Z ≤ o3 + 1%Z -> (((1%Z ≤ Z.of_nat (length o2) ∧ Z.of_nat (length o2) = 1%Z ∧ 1%Z ≤ m) ∧ x0 = nth (Z.to_nat (Z.of_nat (length o2) - 1%Z)) o2 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o2) -> nth (Z.to_nat i) o2 inhabitant = x i) ∧ NoDup o2) ∧ (∀(cur : Z) (s : list Z), ((1%Z ≤ Z.of_nat (length s) ∧ Z.of_nat (length s) ≤ o3) ∧ ((1%Z ≤ Z.of_nat (length s) ∧ Z.of_nat (length s) ≤ m) ∧ cur = nth (Z.to_nat (Z.of_nat (length s) - 1%Z)) s inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat i) s inhabitant = x i) ∧ NoDup s -> (let o4 : Z := Z.of_nat (length s) - 1%Z in (0%Z ≤ o4 + 1%Z -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z -> ¬ nth (Z.to_nat i) s inhabitant = f cur) ∧ (∀(mu : Z), (0%Z ≤ mu ∧ mu ≤ o4) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < mu -> ¬ nth (Z.to_nat i) s inhabitant = f cur) -> (if decide (f cur = nth (Z.to_nat mu) s inhabitant) then let o5 : Z := Z.of_nat (length s) - mu in ((0%Z ≤ mu ∧ mu < m) ∧ (1%Z ≤ o5 ∧ o5 ≤ m) ∧ mu + o5 ≤ m ∧ x (mu + o5) = x mu) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < j ∧ j < mu + o5 -> ¬ x i = x j) else ∀(i : Z), 0%Z ≤ i ∧ i < mu + 1%Z -> ¬ nth (Z.to_nat i) s inhabitant = f cur)) ∧ ((∀(i : Z), 0%Z ≤ i ∧ i < o4 + 1%Z -> ¬ nth (Z.to_nat i) s inhabitant = f cur) -> (let o5 : list Z := s ++ [f cur] in Z.of_nat (length o5) = 1%Z + Z.of_nat (length s) ∧ nth (length s) o5 inhabitant = f cur ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat i) o5 inhabitant = nth (Z.to_nat i) s inhabitant) -> (Z.of_nat (length s) = m -> (let o6 : Z -> Z := get_closure o5 in let o7 : Z := m in let o8 : Z := m + 1%Z in (0%Z ≤ o7 ∧ o7 < o8) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < o8 -> 0%Z ≤ o6 i ∧ o6 i < o7))) ∧ ((Z.of_nat (length s) = m -> (let o6 : Z -> Z := get_closure o5 in ∃(i1 : Z) (i2 : Z), (0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < m + 1%Z) ∧ o6 i1 = o6 i2)) -> ((1%Z ≤ Z.of_nat (length o5) ∧ Z.of_nat (length o5) = Z.of_nat (length s) + 1%Z ∧ Z.of_nat (length s) + 1%Z ≤ m) ∧ f cur = nth (Z.to_nat (Z.of_nat (length o5) - 1%Z)) o5 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o5) -> nth (Z.to_nat i) o5 inhabitant = x i) ∧ NoDup o5)))) ∧ (o4 + 1%Z < 0%Z -> (let o5 : list Z := s ++ [f cur] in Z.of_nat (length o5) = 1%Z + Z.of_nat (length s) ∧ nth (length s) o5 inhabitant = f cur ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat i) o5 inhabitant = nth (Z.to_nat i) s inhabitant) -> (Z.of_nat (length s) = m -> (let o6 : Z -> Z := get_closure o5 in let o7 : Z := m in let o8 : Z := m + 1%Z in (0%Z ≤ o7 ∧ o7 < o8) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < o8 -> 0%Z ≤ o6 i ∧ o6 i < o7))) ∧ ((Z.of_nat (length s) = m -> (let o6 : Z -> Z := get_closure o5 in ∃(i1 : Z) (i2 : Z), (0%Z ≤ i1 ∧ i1 < i2 ∧ i2 < m + 1%Z) ∧ o6 i1 = o6 i2)) -> ((1%Z ≤ Z.of_nat (length o5) ∧ Z.of_nat (length o5) = Z.of_nat (length s) + 1%Z ∧ Z.of_nat (length s) + 1%Z ≤ m) ∧ f cur = nth (Z.to_nat (Z.of_nat (length o5) - 1%Z)) o5 inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length o5) -> nth (Z.to_nat i) o5 inhabitant = x i) ∧ NoDup o5))))) ∧ ¬ (((1%Z ≤ Z.of_nat (length s) ∧ Z.of_nat (length s) = o3 + 1%Z ∧ o3 + 1%Z ≤ m) ∧ cur = nth (Z.to_nat (Z.of_nat (length s) - 1%Z)) s inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length s) -> nth (Z.to_nat i) s inhabitant = x i) ∧ NoDup s))) ∧ ¬ o3 + 1%Z < 1%Z).
Proof.
Admitted.
