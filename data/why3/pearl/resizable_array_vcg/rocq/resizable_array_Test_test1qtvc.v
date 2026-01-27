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
Theorem test1'vc : 0%Z ≤ 10%Z ∧ (∀(r : rarray Z), dummy r = 0%Z ∧ ResizableArrayImplem.length r = 10%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 10%Z -> nth (Z.to_nat i) (data r) inhabitant = 0%Z) -> (0%Z ≤ 0%Z ∧ 0%Z < ResizableArrayImplem.length r) ∧ (∀(r1 : rarray Z), List.length (data r1) = List.length (data r) -> ResizableArrayImplem.length r = ResizableArrayImplem.length r1 ∧ dummy r = dummy r1 -> nth_i (data r1) = fun_updt (nth_i (data r)) 0%Z 17%Z -> 0%Z ≤ 7%Z)).
Admitted.
