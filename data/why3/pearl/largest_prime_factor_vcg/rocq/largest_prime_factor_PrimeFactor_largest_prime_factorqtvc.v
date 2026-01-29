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
Open Scope Z_scope.
Theorem largest_prime_factor'vc (n : Z) (fact0 : 2%Z ≤ n) : 2%Z ≤ n ∧ 2%Z ≤ 2%Z ∧ 2%Z ≤ n ∧ (∀(i : Z), 2%Z ≤ i ∧ i < 2%Z -> ¬ (i | n)) ∧ (∀(d : Z), (2%Z ≤ d ∧ d ≤ n) ∧ (d | n) ∧ (∀(i : Z), 2%Z ≤ i ∧ i < d -> ¬ (i | n)) -> ¬ d = 0%Z ∧ (let o1 : Z := Z.rem n d in ((1%Z ≤ o1 ∧ o1 ≤ n) ∧ (2%Z ≤ d ∧ d ≤ n) ∧ (d | n) ∧ prime d ∧ (∀(i : Z), (i | o1) ∧ 2%Z ≤ i -> d ≤ i ∧ (i | n)) ∧ (∀(i : Z), prime i ∧ (i | n) ∧ d < i -> (i | o1))) ∧ (∀(target : Z) (factor : Z), (1%Z ≤ target ∧ target ≤ n) ∧ (2%Z ≤ factor ∧ factor ≤ n) ∧ (factor | n) ∧ prime factor ∧ (∀(i : Z), (i | target) ∧ 2%Z ≤ i -> factor ≤ i ∧ (i | n)) ∧ (∀(i : Z), prime i ∧ (i | n) ∧ factor < i -> (i | target)) -> (if decide (2%Z ≤ target) then (2%Z ≤ target ∧ (2%Z ≤ factor ∧ factor ≤ target) ∧ (∀(i : Z), 2%Z ≤ i ∧ i < factor -> ¬ (i | target))) ∧ (∀(d1 : Z), (factor ≤ d1 ∧ d1 ≤ target) ∧ (d1 | target) ∧ (∀(i : Z), 2%Z ≤ i ∧ i < d1 -> ¬ (i | target)) -> ¬ d1 = 0%Z ∧ (0%Z ≤ target ∧ Z.rem target d1 < target) ∧ (1%Z ≤ Z.rem target d1 ∧ Z.rem target d1 ≤ n) ∧ (2%Z ≤ d1 ∧ d1 ≤ n) ∧ (d1 | n) ∧ prime d1 ∧ (∀(i : Z), (i | Z.rem target d1) ∧ 2%Z ≤ i -> d1 ≤ i ∧ (i | n)) ∧ (∀(i : Z), prime i ∧ (i | n) ∧ d1 < i -> (i | Z.rem target d1))) else prime factor ∧ (factor | n) ∧ (∀(i : Z), factor < i ∧ i ≤ n -> ¬ (prime i ∧ (i | n))))))).
Proof.
Admitted.
