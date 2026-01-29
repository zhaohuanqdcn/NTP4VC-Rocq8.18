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
Axiom mem : Type.
Axiom mem_inhabited : Inhabited mem.
Global Existing Instance mem_inhabited.
Axiom mem_countable : Countable mem.
Global Existing Instance mem_countable.
Axiom null : loc.
Axiom head : loc.
Axiom entry : loc.
Axiom head_is_not_null : ¬ head = null.
Axiom entry_is_not_null : ¬ entry = null.
Axiom head_is_not_entry : ¬ head = entry.
Axiom list : (loc -> loc) -> loc -> Z -> loc -> Prop.
Axiom list'def : forall  (n : Z) (mem1 : loc -> loc) (x : loc) (y : loc) (fact0 : 0%Z ≤ n), if decide (n = 0%Z) then list mem1 x n y = (x = y) else list mem1 x n y = (¬ x = null ∧ list mem1 (mem1 x) (n - 1%Z) y).
Theorem no_cycle_to_null'vc (n : Z) (n' : Z) (e : loc) (mem1 : loc -> loc) : ¬ (0%Z < n ∧ 0%Z ≤ n' ∧ ¬ e = null ∧ list mem1 e n e ∧ list mem1 e n' null).
Proof.
Admitted.
