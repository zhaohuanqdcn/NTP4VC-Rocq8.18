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
Axiom char : Type.
Axiom char_inhabited : Inhabited char.
Global Existing Instance char_inhabited.
Axiom char_countable : Countable char.
Global Existing Instance char_countable.
Axiom str : Type.
Axiom str_inhabited : Inhabited str.
Global Existing Instance str_inhabited.
Axiom str_countable : Countable str.
Global Existing Instance str_countable.
Inductive rope :=
  | Leaf : list char -> rope
  | Node : Z -> rope -> rope -> rope.
Axiom rope_inhabited : Inhabited rope.
Global Existing Instance rope_inhabited.
Axiom rope_countable : Countable rope.
Global Existing Instance rope_countable.
Program Fixpoint to_str (r : rope) : list char :=
match r with | Leaf s => s | Node _ rl rr => to_str rl ++ to_str rr end.
Admit Obligations.
Program Fixpoint valid (r : rope) : Prop :=
match r with | Leaf x_s => True | Node wl rl rr => wl = Z.of_nat (length (to_str rl)) ∧ valid rl ∧ valid rr end.
Admit Obligations.
Theorem delete'vc (r : rope) (i : Z) (len : Z) (fact0 : valid r) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length (to_str r))) (fact3 : 0%Z ≤ len) (fact4 : len ≤ Z.of_nat (length (to_str r)) - i) : valid r ∧ 0%Z ≤ i ∧ i ≤ Z.of_nat (length (to_str r)) ∧ (∀(left1 : rope) (remaining : rope), valid left1 ∧ valid remaining ∧ to_str r = to_str left1 ++ to_str remaining ∧ Z.of_nat (length (to_str left1)) = i -> ((valid remaining ∧ 0%Z ≤ len ∧ len ≤ Z.of_nat (length (to_str remaining))) ∧ (∀(o1 : rope) (right1 : rope), valid o1 ∧ valid right1 ∧ to_str remaining = to_str o1 ++ to_str right1 ∧ Z.of_nat (length (to_str o1)) = len -> valid left1 ∧ valid right1)) ∧ (∀(result : rope), (∃(left2 : rope) (right1 : rope), (valid left2 ∧ valid right1 ∧ to_str remaining = to_str left2 ++ to_str right1 ∧ Z.of_nat (length (to_str left2)) = len) ∧ valid result ∧ to_str result = to_str left1 ++ to_str right1) -> valid result ∧ to_str result = take (Z.to_nat i) (to_str r) ++ drop (Z.to_nat (i + len)) (to_str r))).
Proof.
Admitted.
