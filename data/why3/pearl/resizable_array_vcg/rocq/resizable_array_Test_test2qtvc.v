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
Require Import resizable_array_vcg.resizable_array.ResizableArrayImplem.
Open Scope Z_scope.
Theorem test2'vc : 0%Z ≤ 10%Z ∧ (∀(r1 : rarray Z), dummy r1 = 0%Z ∧ ResizableArrayImplem.length r1 = 10%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 10%Z -> nth (Z.to_nat i) (data r1) inhabitant = 0%Z) -> (0%Z ≤ 0%Z ∧ 0%Z < ResizableArrayImplem.length r1) ∧ (∀(r11 : rarray Z), List.length (data r11) = List.length (data r1) -> ResizableArrayImplem.length r1 = ResizableArrayImplem.length r11 ∧ dummy r1 = dummy r11 -> nth_i (data r11) = fun_updt (nth_i (data r1)) 0%Z 17%Z -> 0%Z ≤ 10%Z ∧ (∀(r2 : rarray Z), dummy r2 = 0%Z ∧ ResizableArrayImplem.length r2 = 10%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 10%Z -> nth (Z.to_nat i) (data r2) inhabitant = 0%Z) -> (0%Z ≤ 0%Z ∧ 0%Z < ResizableArrayImplem.length r2) ∧ (∀(r21 : rarray Z), List.length (data r21) = List.length (data r2) -> ResizableArrayImplem.length r2 = ResizableArrayImplem.length r21 ∧ dummy r2 = dummy r21 -> nth_i (data r21) = fun_updt (nth_i (data r2)) 0%Z 42%Z -> (∀(r12 : rarray Z), dummy r11 = dummy r12 -> ResizableArrayImplem.length r12 = ResizableArrayImplem.length r11 + ResizableArrayImplem.length r21 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < ResizableArrayImplem.length r12 -> (i < ResizableArrayImplem.length r11 -> mixfix_lbrb r12 i = mixfix_lbrb r11 i) ∧ (ResizableArrayImplem.length r11 ≤ i -> mixfix_lbrb r12 i = mixfix_lbrb r21 (i - ResizableArrayImplem.length r11))) -> (0%Z ≤ 10%Z ∧ 10%Z < ResizableArrayImplem.length r12) ∧ 0%Z ≤ 0%Z ∧ 0%Z < ResizableArrayImplem.length r21))))).
Admitted.
