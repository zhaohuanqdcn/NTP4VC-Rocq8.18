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
