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
Theorem list_concat'vc (n1 : Z) (n2 : Z) (mem1 : loc -> loc) (x : loc) (y : loc) (z : loc) (fact0 : 0%Z ≤ n1) (fact1 : 0%Z ≤ n2) (fact2 : list mem1 x n1 y) (fact3 : ¬ y = null) (fact4 : list mem1 (mem1 y) n2 z) : list mem1 x (n1 + 1%Z + n2) z.
Admitted.
