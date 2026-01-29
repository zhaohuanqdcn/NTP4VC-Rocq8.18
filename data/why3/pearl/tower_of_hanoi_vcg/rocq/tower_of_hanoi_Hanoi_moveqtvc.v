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
Axiom tower : Type.
Axiom tower_inhabited : Inhabited tower.
Global Existing Instance tower_inhabited.
Axiom tower_countable : Countable tower.
Global Existing Instance tower_countable.
Axiom rod : tower -> list Z.
Axiom tower'invariant : forall  (self : tower), Sorted Z.le (rod self).
Definition tower'eq (a : tower) (b : tower) := rod a = rod b.
Axiom tower'inj : forall  (a : tower) (b : tower) (fact0 : tower'eq a b), a = b.
Axiom prepend : Z -> list Z -> list Z.
Axiom prepend_def_zero : forall  (n : Z) (s : list Z) (fact0 : n ≤ 0%Z), prepend n s = s.
Axiom prepend_def_succ : forall  (n : Z) (s : list Z) (fact0 : 0%Z < n), prepend n s = prepend (n - 1%Z) (cons n s).
Theorem move'vc (a : tower) (n : Z) (s : list Z) (b : tower) (fact0 : rod a = cons n s) (fact1 : match rod b with | [] => True | cons x _ => n < x end) : match rod a with | cons x r => (∀(a1 : tower) (b1 : tower), Sorted Z.le r ∧ (r = rod a1 -> Sorted Z.le (cons x (rod b)) ∧ (cons x (rod b) = rod b1 -> rod a1 = s ∧ rod b1 = cons n (rod b)))) | [] => False end.
Proof.
Admitted.
