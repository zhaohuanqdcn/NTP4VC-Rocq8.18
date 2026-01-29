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
Theorem list_reversal'vc (mem1 : loc -> loc) : let mem2 : mem := mem'mk mem1 in ∀(s : Z -> loc) (n : Z) (l : loc), valid_cells s n ∧ listLR mem2 s l 0%Z n -> ((if decide (n = 0%Z) then l = null else l = s 0%Z ∨ 0%Z = n ∧ null = s (n - 1%Z) ∧ l = null ∨ (0%Z < 0%Z ∧ 0%Z < n) ∧ null = s (0%Z - 1%Z) ∧ l = s 0%Z) ∧ listRL mem2 s null 0%Z 0%Z ∧ listLR mem2 s l 0%Z n ∧ frame mem2 mem2 s n) ∧ (∀(i : Z) (p : loc) (l1 : loc) (mem3 : loc -> loc), let mem4 : mem := mem'mk mem3 in (if decide (n = 0%Z) then l1 = p ∧ p = null else i = 0%Z ∧ p = null ∧ l1 = s 0%Z ∨ i = n ∧ p = s (n - 1%Z) ∧ l1 = null ∨ (0%Z < i ∧ i < n) ∧ p = s (i - 1%Z) ∧ l1 = s i) ∧ listRL mem4 s p 0%Z i ∧ listLR mem4 s l1 i n ∧ frame mem4 mem2 s n -> (if decide (¬ l1 = null) then ¬ l1 = null ∧ ¬ l1 = null ∧ (let mem5 : mem := mem'mk (fun_updt mem3 l1 p) in (0%Z ≤ n - i ∧ n - (i + 1%Z) < n - i) ∧ (if decide (n = 0%Z) then mem3 l1 = l1 ∧ l1 = null else i + 1%Z = 0%Z ∧ l1 = null ∧ mem3 l1 = s 0%Z ∨ i + 1%Z = n ∧ l1 = s (n - 1%Z) ∧ mem3 l1 = null ∨ (0%Z < i + 1%Z ∧ i + 1%Z < n) ∧ l1 = s (i + 1%Z - 1%Z) ∧ mem3 l1 = s (i + 1%Z)) ∧ listRL mem5 s l1 0%Z (i + 1%Z) ∧ listLR mem5 s (mem3 l1) (i + 1%Z) n ∧ frame mem5 mem2 s n) else listRL mem4 s p 0%Z n ∧ frame mem4 mem2 s n)).
Proof.
Admitted.
