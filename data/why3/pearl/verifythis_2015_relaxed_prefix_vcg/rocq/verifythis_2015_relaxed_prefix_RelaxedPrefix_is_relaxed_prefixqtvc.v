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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Definition eq_array (a1 : list char) (ofs1 : Z) (a2 : list char) (ofs2 : Z) (len : Z) := 0%Z ≤ len ∧ 0%Z ≤ ofs1 ∧ 0%Z ≤ ofs2 ∧ ofs1 + len ≤ Z.of_nat (length a1) ∧ ofs2 + len ≤ Z.of_nat (length a2) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < len -> nth (Z.to_nat (ofs1 + i)) a1 inhabitant = nth (Z.to_nat (ofs2 + i)) a2 inhabitant).
Definition is_relaxed_prefix (pat : list char) (a : list char) := let n : Z := Z.of_nat (length pat) in eq_array pat 0%Z a 0%Z n ∨ (∃(i : Z), (0%Z ≤ i ∧ i < n) ∧ eq_array pat 0%Z a 0%Z i ∧ eq_array pat (i + 1%Z) a i (n - i - 1%Z)).
Theorem is_relaxed_prefix'vc (a : list char) (pat : list char) : let m : Z := Z.of_nat (length a) in let o1 : Z := Z.of_nat (length pat) - 1%Z in (0%Z ≤ o1 + 1%Z -> ((0%Z ≤ 0%Z ∧ 0%Z ≤ 1%Z) ∧ (0%Z = 1%Z -> 0%Z ≤ 0%Z ∧ 0%Z < 0%Z) ∧ 0%Z ≤ m + 0%Z ∧ eq_array pat 0%Z a 0%Z 0%Z) ∧ (∀(ignored : Z) (shift : Z), (∀(i : Z), (0%Z ≤ i ∧ i ≤ o1) ∧ (0%Z ≤ shift ∧ shift ≤ 1%Z) ∧ (shift = 1%Z -> 0%Z ≤ ignored ∧ ignored < i) ∧ i ≤ m + shift ∧ (if decide (shift = 0%Z) then eq_array pat 0%Z a 0%Z i else eq_array pat 0%Z a 0%Z ignored ∧ eq_array pat (ignored + 1%Z) a ignored (i - ignored - 1%Z) ∧ ¬ eq_array pat 0%Z a 0%Z i ∧ (ignored < m -> ¬ nth (Z.to_nat ignored) pat inhabitant = nth (Z.to_nat ignored) a inhabitant)) -> (let o2 : Z := i - shift in (¬ m ≤ o2 -> (let o3 : Z := i - shift in (0%Z ≤ o3 ∧ o3 < Z.of_nat (length a)) ∧ 0%Z ≤ i ∧ i < Z.of_nat (length pat))) ∧ (∀(o3 : bool), (if decide (m ≤ o2) then o3 = true else o3 = (if decide (nth (Z.to_nat i) pat inhabitant = nth (Z.to_nat (i - shift)) a inhabitant) then false else true)) -> (if decide (o3 = true) then if decide (shift = 1%Z) then ¬ is_relaxed_prefix pat a else (0%Z ≤ 1%Z ∧ 1%Z ≤ 1%Z) ∧ (0%Z ≤ i ∧ i < i + 1%Z) ∧ i + 1%Z ≤ m + 1%Z ∧ (if decide (1%Z = 0%Z) then eq_array pat 0%Z a 0%Z (i + 1%Z) else eq_array pat 0%Z a 0%Z i ∧ eq_array pat (i + 1%Z) a i (i + 1%Z - i - 1%Z) ∧ ¬ eq_array pat 0%Z a 0%Z (i + 1%Z) ∧ (i < m -> ¬ nth (Z.to_nat i) pat inhabitant = nth (Z.to_nat i) a inhabitant)) else (0%Z ≤ shift ∧ shift ≤ 1%Z) ∧ (shift = 1%Z -> 0%Z ≤ ignored ∧ ignored < i + 1%Z) ∧ i + 1%Z ≤ m + shift ∧ (if decide (shift = 0%Z) then eq_array pat 0%Z a 0%Z (i + 1%Z) else eq_array pat 0%Z a 0%Z ignored ∧ eq_array pat (ignored + 1%Z) a ignored (i + 1%Z - ignored - 1%Z) ∧ ¬ eq_array pat 0%Z a 0%Z (i + 1%Z) ∧ (ignored < m -> ¬ nth (Z.to_nat ignored) pat inhabitant = nth (Z.to_nat ignored) a inhabitant)))))) ∧ ((0%Z ≤ shift ∧ shift ≤ 1%Z) ∧ (shift = 1%Z -> 0%Z ≤ ignored ∧ ignored < o1 + 1%Z) ∧ o1 + 1%Z ≤ m + shift ∧ (if decide (shift = 0%Z) then eq_array pat 0%Z a 0%Z (o1 + 1%Z) else eq_array pat 0%Z a 0%Z ignored ∧ eq_array pat (ignored + 1%Z) a ignored (o1 + 1%Z - ignored - 1%Z) ∧ ¬ eq_array pat 0%Z a 0%Z (o1 + 1%Z) ∧ (ignored < m -> ¬ nth (Z.to_nat ignored) pat inhabitant = nth (Z.to_nat ignored) a inhabitant)) -> is_relaxed_prefix pat a))) ∧ (o1 + 1%Z < 0%Z -> is_relaxed_prefix pat a).
Admitted.
