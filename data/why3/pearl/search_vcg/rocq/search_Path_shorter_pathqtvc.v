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
Axiom state : Type.
Axiom state_inhabited : Inhabited state.
Global Existing Instance state_inhabited.
Axiom state_countable : Countable state.
Global Existing Instance state_countable.
Axiom moves : state -> list state.
Axiom start : state.
Axiom success : state -> Prop.
Inductive path : state -> state -> Z -> Prop :=
 | Path0 (s : state) : path s s 0%Z
 | Path1 (i : Z) (s : state) : 0%Z ≤ i -> i < Z.of_nat (length (moves s)) -> path s (nth (Z.to_nat i) (moves s) inhabitant) 1%Z
 | Patht (s : state) (t : state) (n : Z) (u : state) (m : Z) : path s t n -> path t u m -> path s u (n + m).
Definition move (s : state) (t : state) := ∃(i : Z), (0%Z ≤ i ∧ i < Z.of_nat (length (moves s))) ∧ t = nth (Z.to_nat i) (moves s) inhabitant.
Theorem shorter_path'vc (s : state) (t : state) (n : Z) (m : Z) (o1 : bool) (fact0 : path s t n) (fact1 : 0%Z ≤ m) (fact2 : m ≤ n) (fact3 : if decide (n = 0%Z) then o1 = true else o1 = (if decide (m = 0%Z) then true else false)) : (¬ o1 = true -> (let o2 : Z := m - 1%Z in let o3 : Z := n - 1%Z in (path s t n ∧ 0%Z < n) ∧ (∀(o4 : state), move s o4 ∧ path o4 t (n - 1%Z) -> (0%Z ≤ n ∧ o3 < n) ∧ path o4 t o3 ∧ 0%Z ≤ o2 ∧ o2 ≤ o3))) ∧ (∀(r : state), (if decide (o1 = true) then r = s else ∃(o2 : state), (move s o2 ∧ path o2 t (n - 1%Z)) ∧ path o2 r (m - 1%Z)) -> path s r m).
Proof.
Admitted.
