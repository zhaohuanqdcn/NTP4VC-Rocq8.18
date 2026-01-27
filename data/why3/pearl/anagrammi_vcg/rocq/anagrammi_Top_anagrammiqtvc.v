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
Require Import Why3.why3.Ref.Ref.
Open Scope Z_scope.
Axiom line : Type.
Axiom line_inhabited : Inhabited line.
Global Existing Instance line_inhabited.
Axiom line_countable : Countable line.
Global Existing Instance line_countable.
Definition perm4 (s : list Z) := Z.of_nat (length s) = 4%Z ∧ (∀(i : Z), 0%Z ≤ i ∧ i < 4%Z -> 1%Z ≤ nth (Z.to_nat i) s inhabitant ∧ nth (Z.to_nat i) s inhabitant ≤ 4%Z) ∧ NoDup s.
Definition lt (s1 : list Z) (s2 : list Z) := ∃(i : Z), (0%Z ≤ i ∧ i < 4%Z) ∧ nth (Z.to_nat i) s1 inhabitant < nth (Z.to_nat i) s2 inhabitant ∧ (∀(j : Z), 0%Z ≤ j ∧ j < i -> nth (Z.to_nat j) s1 inhabitant = nth (Z.to_nat j) s2 inhabitant).
Definition sorted (o1 : list (list Z)) := (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length o1) -> perm4 (nth (Z.to_nat j) o1 inhabitant)) ∧ (∀(j1 : Z) (j2 : Z), 0%Z ≤ j1 ∧ j1 < j2 ∧ j2 < Z.of_nat (length o1) -> lt (nth (Z.to_nat j1) o1 inhabitant) (nth (Z.to_nat j2) o1 inhabitant)).
Definition below (o1 : list (list Z)) (pr : list Z -> bool) := sorted o1 ∧ (∀(j : Z), 0%Z ≤ j ∧ j < Z.of_nat (length o1) -> pr (nth (Z.to_nat j) o1 inhabitant) = true) ∧ (∀(s : list Z), perm4 s -> pr s = true -> s ∈ o1).
Axiom pr1 : Z -> list Z -> bool.
Axiom pr1'def : forall  (i1 : Z) (s : list Z), (pr1 i1 s = true) = (nth 0%nat s inhabitant < i1).
Axiom pr2 : Z -> Z -> list Z -> bool.
Axiom pr2'def : forall  (i1 : Z) (i2 : Z) (s : list Z), (pr2 i1 i2 s = true) = (pr1 i1 s = true ∨ nth 0%nat s inhabitant = i1 ∧ nth 1%nat s inhabitant < i2).
Axiom pr3 : Z -> Z -> Z -> list Z -> bool.
Axiom pr3'def : forall  (i1 : Z) (i2 : Z) (i3 : Z) (s : list Z), (pr3 i1 i2 i3 s = true) = (pr2 i1 i2 s = true ∨ nth 0%nat s inhabitant = i1 ∧ nth 1%nat s inhabitant = i2 ∧ nth 2%nat s inhabitant < i3).
Axiom fc : list Z -> bool.
Axiom fc1 : list Z -> bool.
Axiom fc'def : forall  (x : list Z), fc x = true.
Axiom fc'def1 : forall  (x : list Z), fc1 x = true.
Theorem anagrammi'vc : (1%Z ≤ 4%Z + 1%Z -> below ([] : list (list Z)) (pr1 1%Z) ∧ (∀(output : list (list Z)), (∀(i1 : Z), (1%Z ≤ i1 ∧ i1 ≤ 4%Z) ∧ below output (pr1 i1) -> (1%Z ≤ 4%Z + 1%Z -> below output (pr2 i1 1%Z) ∧ (∀(output1 : list (list Z)), (∀(i2 : Z), (1%Z ≤ i2 ∧ i2 ≤ 4%Z) ∧ below output1 (pr2 i1 i2) -> (if decide (i2 = i1) then below output1 (pr2 i1 (i2 + 1%Z)) else (1%Z ≤ 4%Z + 1%Z -> below output1 (pr3 i1 i2 1%Z) ∧ (∀(output2 : list (list Z)), (∀(i3 : Z), (1%Z ≤ i3 ∧ i3 ≤ 4%Z) ∧ below output2 (pr3 i1 i2 i3) -> (if decide (i3 = i1) then below output2 (pr3 i1 i2 (i3 + 1%Z)) else if decide (i3 = i2) then below output2 (pr3 i1 i2 (i3 + 1%Z)) else let i4 : Z := 10%Z - (i1 + i2 + i3) in let o1 : list Z := ([] : list Z) in let o2 : list Z := cons i4 o1 in Z.of_nat (length o2) = 1%Z + Z.of_nat (length o1) ∧ nth 0%nat o2 inhabitant = i4 ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o1) -> nth (Z.to_nat i) o2 inhabitant = nth (Z.to_nat (i - 1%Z)) o1 inhabitant) -> (let o3 : list Z := cons i3 o2 in Z.of_nat (length o3) = 1%Z + Z.of_nat (length o2) ∧ nth 0%nat o3 inhabitant = i3 ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o2) -> nth (Z.to_nat i) o3 inhabitant = nth (Z.to_nat (i - 1%Z)) o2 inhabitant) -> (let o4 : list Z := cons i2 o3 in Z.of_nat (length o4) = 1%Z + Z.of_nat (length o3) ∧ nth 0%nat o4 inhabitant = i2 ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o3) -> nth (Z.to_nat i) o4 inhabitant = nth (Z.to_nat (i - 1%Z)) o3 inhabitant) -> (let line1 : list Z := cons i1 o4 in Z.of_nat (length line1) = 1%Z + Z.of_nat (length o4) ∧ nth 0%nat line1 inhabitant = i1 ∧ (∀(i : Z), 0%Z < i ∧ i ≤ Z.of_nat (length o4) -> nth (Z.to_nat i) line1 inhabitant = nth (Z.to_nat (i - 1%Z)) o4 inhabitant) -> (let o5 : list (list Z) := output2 ++ [line1] in Z.of_nat (length o5) = 1%Z + Z.of_nat (length output2) ∧ nth (length output2) o5 inhabitant = line1 ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length output2) -> nth (Z.to_nat i) o5 inhabitant = nth (Z.to_nat i) output2 inhabitant) -> below o5 (pr3 i1 i2 (i3 + 1%Z)))))))) ∧ (below output2 (pr3 i1 i2 (4%Z + 1%Z)) -> below output2 (pr2 i1 (i2 + 1%Z))))) ∧ (4%Z + 1%Z < 1%Z -> below output1 (pr2 i1 (i2 + 1%Z))))) ∧ (below output1 (pr2 i1 (4%Z + 1%Z)) -> below output1 (pr1 (i1 + 1%Z))))) ∧ (4%Z + 1%Z < 1%Z -> below output (pr1 (i1 + 1%Z)))) ∧ (below output (pr1 (4%Z + 1%Z)) -> below output fc))) ∧ (4%Z + 1%Z < 1%Z -> below ([] : list (list Z)) fc1).
Admitted.
