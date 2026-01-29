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
Theorem append'vc {α : Type} `{Inhabited α} (r1 : rarray α) (r2 : rarray α) : let n1 : Z := length r1 in let o1 : Z := length r1 + length r2 in 0%Z ≤ o1 ∧ (∀(r11 : rarray α), dummy r1 = dummy r11 -> length r11 = o1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < length r1 -> i < o1 -> mixfix_lbrb r11 i = mixfix_lbrb r1 i) -> (let o2 : Z := length r2 in let o3 : list α := data r11 in let o4 : list α := data r2 in ((0%Z ≤ 0%Z ∧ 0%Z ≤ o2 ∧ 0%Z + o2 ≤ Z.of_nat (List.length o4)) ∧ 0%Z ≤ n1 ∧ n1 + o2 ≤ Z.of_nat (List.length o3)) ∧ (∀(r12 : rarray α) (r1_data : list α), List.length r1_data = List.length o3 -> List.length r1_data = List.length (data r11) -> (∀(i : Z), 0%Z ≤ i ∧ i < n1 ∨ n1 + o2 ≤ i ∧ i < Z.of_nat (List.length r1_data) -> nth (Z.to_nat i) r1_data inhabitant = nth (Z.to_nat i) o3 inhabitant) ∧ (∀(i : Z), n1 ≤ i ∧ i < n1 + o2 -> nth (Z.to_nat i) r1_data inhabitant = nth (Z.to_nat (0%Z + i - n1)) o4 inhabitant) -> ((0%Z ≤ length r11 ∧ length r11 ≤ Z.of_nat (List.length r1_data)) ∧ (∀(i : Z), length r11 ≤ i ∧ i < Z.of_nat (List.length r1_data) -> nth (Z.to_nat i) r1_data inhabitant = dummy r11)) ∧ (r1_data = data r12 ∧ length r11 = length r12 ∧ dummy r11 = dummy r12 -> length r12 = length r1 + length r2 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < length r12 -> (i < length r1 -> mixfix_lbrb r12 i = mixfix_lbrb r1 i) ∧ (length r1 ≤ i -> mixfix_lbrb r12 i = mixfix_lbrb r2 (i - length r1))))))).
Proof.
Admitted.
