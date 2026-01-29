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
Axiom loc : Type.
Axiom loc_inhabited : Inhabited loc.
Global Existing Instance loc_inhabited.
Axiom loc_countable : Countable loc.
Global Existing Instance loc_countable.
Axiom null : loc.
Inductive mem :=
  | mem'mk : (loc -> loc) -> mem.
Axiom mem_inhabited : Inhabited mem.
Global Existing Instance mem_inhabited.
Axiom mem_countable : Countable mem.
Global Existing Instance mem_countable.
Definition next (x : mem) := match x with |  mem'mk a => a end.
Definition valid_cells (s : Z -> loc) (n : Z) := (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ s i = null) ∧ (∀(i : Z) (j : Z), 0%Z ≤ i ∧ i < n -> 0%Z ≤ j ∧ j < n -> ¬ i = j -> ¬ s i = s j).
Definition listLR (m : mem) (s : Z -> loc) (l : loc) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi) ∧ (if decide (lo = hi) then l = null else l = s lo ∧ next m (s (hi - 1%Z)) = null ∧ (∀(k : Z), lo ≤ k ∧ k < hi - 1%Z -> next m (s k) = s (k + 1%Z))).
Definition listRL (m : mem) (s : Z -> loc) (l : loc) (lo : Z) (hi : Z) := (0%Z ≤ lo ∧ lo ≤ hi) ∧ (if decide (lo = hi) then l = null else next m (s lo) = null ∧ l = s (hi - 1%Z) ∧ (∀(k : Z), lo < k ∧ k < hi -> next m (s k) = s (k - 1%Z))).
Definition frame (m1 : mem) (m2 : mem) (s : Z -> loc) (n : Z) := ∀(p : loc), (∀(i : Z), 0%Z ≤ i ∧ i < n -> ¬ p = s i) -> next m1 p = next m2 p.
Axiom is_list : mem -> loc -> (Z -> loc) -> Z -> Prop.
Axiom result : (Z -> loc) -> Z -> loc.
Axiom result'def : forall  (s : Z -> loc) (i : Z), result s i = s (i + 1%Z).
Axiom is_list'def : forall  (n : Z) (m : mem) (l : loc) (s : Z -> loc) (fact0 : 0%Z ≤ n), if decide (n = 0%Z) then is_list m l s n = (l = null) else is_list m l s n = ((let q1' : loc := s 0%Z in l = q1' ∧ ¬ q1' = null) ∧ is_list m (next m l) (result s) (n - 1%Z)).
Axiom fc : (Z -> loc) -> Z -> Z -> loc.
Axiom fc'def : forall  (s : Z -> loc) (n : Z) (i : Z), fc s n i = s (n - 1%Z - i).
Theorem list_of_cells'vc (mem1 : loc -> loc) : let mem2 : mem := mem'mk mem1 in ∀(r : loc) (s : Z -> loc) (n : Z), 0%Z ≤ n ∧ valid_cells s n ∧ listRL mem2 s r 0%Z n -> is_list mem2 r (fc s n) n.
Proof.
Admitted.
