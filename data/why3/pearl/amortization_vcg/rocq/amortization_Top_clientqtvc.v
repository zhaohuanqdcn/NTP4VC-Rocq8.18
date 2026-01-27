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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom queue : Type.
Axiom queue_inhabited : Inhabited queue.
Global Existing Instance queue_inhabited.
Axiom queue_countable : Countable queue.
Global Existing Instance queue_countable.
Axiom size : queue -> Z.
Axiom credits : queue -> Z.
Axiom queue'invariant : forall  (self : queue), 0%Z ≤ size self ∧ 0%Z ≤ credits self ∧ credits self ≤ size self.
Theorem client'vc (n : Z) (o1 : queue) (clock : Z) (fact0 : 0%Z ≤ n) (fact1 : size o1 = 0%Z) (fact2 : credits o1 = 0%Z) : let o2 : Z := n - 1%Z in (0%Z ≤ o2 + 1%Z -> ((size o1 = credits o1 ∧ credits o1 = 0%Z) ∧ clock = clock + 0%Z) ∧ (∀(q : queue) (clock1 : Z), ((0%Z ≤ credits q ∧ credits q ≤ o2) ∧ size q = credits q ∧ clock1 = clock + credits q -> (∀(o3 : queue), size o3 = size q + 1%Z ∧ credits o3 = credits q + 1%Z -> (size o3 = credits o3 ∧ credits o3 = credits q + 1%Z) ∧ clock1 + 1%Z = clock + (credits q + 1%Z))) ∧ ((size q = credits q ∧ credits q = o2 + 1%Z) ∧ clock1 = clock + (o2 + 1%Z) -> (let o3 : Z := n - 1%Z in (0%Z ≤ o3 + 1%Z -> (size q = n - 0%Z ∧ clock1 = clock + credits q + 0%Z) ∧ (∀(q1 : queue) (clock2 : Z), (∀(k : Z), (0%Z ≤ k ∧ k ≤ o3) ∧ size q1 = n - k ∧ clock2 = clock + credits q1 + k -> 0%Z < size q1 ∧ (∀(clock3 : Z) (r : queue), size r = size q1 - 1%Z ∧ credits r ≤ credits q1 ∧ clock3 = clock2 + 1%Z + credits r - credits q1 -> size r = n - (k + 1%Z) ∧ clock3 = clock + credits r + (k + 1%Z))) ∧ (size q1 = n - (o3 + 1%Z) ∧ clock2 = clock + credits q1 + (o3 + 1%Z) -> clock2 ≤ clock + 2%Z * n))) ∧ (o3 + 1%Z < 0%Z -> clock1 ≤ clock + 2%Z * n))))) ∧ (o2 + 1%Z < 0%Z -> (let o3 : Z := n - 1%Z in (0%Z ≤ o3 + 1%Z -> (size o1 = n - 0%Z ∧ clock = clock + credits o1 + 0%Z) ∧ (∀(q : queue) (clock1 : Z), (∀(k : Z), (0%Z ≤ k ∧ k ≤ o3) ∧ size q = n - k ∧ clock1 = clock + credits q + k -> 0%Z < size q ∧ (∀(clock2 : Z) (r : queue), size r = size q - 1%Z ∧ credits r ≤ credits q ∧ clock2 = clock1 + 1%Z + credits r - credits q -> size r = n - (k + 1%Z) ∧ clock2 = clock + credits r + (k + 1%Z))) ∧ (size q = n - (o3 + 1%Z) ∧ clock1 = clock + credits q + (o3 + 1%Z) -> clock1 ≤ clock + 2%Z * n))) ∧ (o3 + 1%Z < 0%Z -> clock ≤ clock + 2%Z * n))).
Admitted.
