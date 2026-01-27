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
Axiom rarray : Type -> Type.
Axiom rarray_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (rarray α).
Global Existing Instance rarray_inhabited.
Axiom dummy : forall {α : Type} `{Inhabited α}, rarray α -> α.
Axiom length : forall {α : Type} `{Inhabited α}, rarray α -> Z.
Axiom data : forall {α : Type} `{Inhabited α}, rarray α -> list α.
Axiom rarray'invariant : forall  {α : Type} `{Inhabited α} (self : rarray α), 0%Z ≤ length self ∧ length self ≤ Z.of_nat (List.length (data self)) ∧ (∀(i : Z), length self ≤ i ∧ i < Z.of_nat (List.length (data self)) -> nth (Z.to_nat i) (data self) inhabitant = dummy self).
Definition rarray'eq {α : Type} `{Inhabited α} (a : rarray α) (b : rarray α) := dummy a = dummy b ∧ length a = length b ∧ data a = data b.
Axiom rarray'inj : forall  {α : Type} `{Inhabited α} (a : rarray α) (b : rarray α) (fact0 : rarray'eq a b), a = b.
Definition mixfix_lbrb {α : Type} `{Inhabited α} (r : rarray α) (i : Z) : α := nth (Z.to_nat i) (data r) inhabitant.
Theorem resize'vc {α : Type} `{Inhabited α} (len : Z) (r : rarray α) (fact0 : 0%Z ≤ len) : let n : Z := Z.of_nat (List.length (data r)) in if decide (n < len) then let o1 : Z := Z.max len (2%Z * n) in 0%Z ≤ o1 ∧ (∀(a : list α), (∀(i : Z), 0%Z ≤ i ∧ i < o1 -> nth (Z.to_nat i) a inhabitant = dummy r) ∧ Z.of_nat (List.length a) = o1 -> (let o2 : list α := data r in ((0%Z ≤ 0%Z ∧ 0%Z ≤ n ∧ 0%Z + n ≤ Z.of_nat (List.length o2)) ∧ 0%Z ≤ 0%Z ∧ 0%Z + n ≤ Z.of_nat (List.length a)) ∧ (∀(a1 : list α), List.length a1 = List.length a -> (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z ∨ 0%Z + n ≤ i ∧ i < Z.of_nat (List.length a1) -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat i) a inhabitant) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 0%Z + n -> nth (Z.to_nat i) a1 inhabitant = nth (Z.to_nat (0%Z + i - 0%Z)) o2 inhabitant) -> (∀(r1 : rarray α), ((0%Z ≤ len ∧ len ≤ Z.of_nat (List.length a1)) ∧ (∀(i : Z), len ≤ i ∧ i < Z.of_nat (List.length a1) -> nth (Z.to_nat i) a1 inhabitant = dummy r)) ∧ (a1 = data r1 ∧ len = length r1 ∧ dummy r = dummy r1 -> length r1 = len ∧ (∀(i : Z), 0%Z ≤ i ∧ i < length r -> i < len -> mixfix_lbrb r1 i = mixfix_lbrb r i)))))) else let o1 : Z := n - len in let o2 : list α := data r in (0%Z ≤ len ∧ 0%Z ≤ o1 ∧ len + o1 ≤ Z.of_nat (List.length o2)) ∧ (∀(r_data : list α), List.length r_data = List.length o2 -> List.length r_data = List.length (data r) -> (∀(i : Z), 0%Z ≤ i ∧ i < len ∨ len + o1 ≤ i ∧ i < Z.of_nat (List.length r_data) -> nth (Z.to_nat i) r_data inhabitant = nth (Z.to_nat i) o2 inhabitant) ∧ (∀(i : Z), len ≤ i ∧ i < len + o1 -> nth (Z.to_nat i) r_data inhabitant = dummy r) -> (∀(r1 : rarray α), ((0%Z ≤ len ∧ len ≤ Z.of_nat (List.length r_data)) ∧ (∀(i : Z), len ≤ i ∧ i < Z.of_nat (List.length r_data) -> nth (Z.to_nat i) r_data inhabitant = dummy r)) ∧ (r_data = data r1 ∧ len = length r1 ∧ dummy r = dummy r1 -> length r1 = len ∧ (∀(i : Z), 0%Z ≤ i ∧ i < length r -> i < len -> mixfix_lbrb r1 i = mixfix_lbrb r i)))).
Admitted.
