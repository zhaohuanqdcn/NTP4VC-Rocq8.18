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
Theorem hanoi_rec'vc (a : tower) (n : Z) (s : list Z) (b : tower) (c : tower) (fact0 : rod a = prepend n s) (fact1 : match rod b with | [] => True | cons x _ => n < x end) (fact2 : match rod c with | [] => True | cons x _ => n < x end) : if decide (0%Z < n) then let t : list Z := rod c in let o1 : list Z := cons n s in let o2 : Z := n - 1%Z in ((0%Z ≤ n ∧ o2 < n) ∧ rod a = prepend o2 o1 ∧ (match rod c with | [] => True | cons x _ => o2 < x end) ∧ (match rod b with | [] => True | cons x _ => o2 < x end)) ∧ (∀(c1 : tower) (b1 : tower) (a1 : tower), rod a1 = o1 ∧ rod c1 = prepend o2 (rod c) ∧ rod b1 = rod b -> (rod a1 = cons n s ∧ (match rod b1 with | [] => True | cons x _ => n < x end)) ∧ (∀(b2 : tower) (a2 : tower), rod a2 = s ∧ rod b2 = cons n (rod b1) -> (let o3 : Z := n - 1%Z in ((0%Z ≤ n ∧ o3 < n) ∧ rod c1 = prepend o3 t ∧ (match rod b2 with | [] => True | cons x _ => o3 < x end) ∧ (match rod a2 with | [] => True | cons x _ => o3 < x end)) ∧ (∀(c2 : tower) (b3 : tower) (a3 : tower), rod c2 = t ∧ rod b3 = prepend o3 (rod b2) ∧ rod a3 = rod a2 -> rod a3 = s ∧ rod b3 = prepend n (rod b) ∧ rod c2 = rod c)))) else rod a = s ∧ rod b = prepend n (rod b).
Proof.
Admitted.
