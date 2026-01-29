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
Theorem split'vc (r : rope) (i : Z) (fact0 : valid r) (fact1 : 0%Z ≤ i) (fact2 : i ≤ Z.of_nat (length (to_str r))) : (match r with | Leaf s => 0%Z ≤ i ∧ i ≤ Z.of_nat (length s) | Node wl rl rr => (if decide (i < wl) then ((match r with | Leaf _ => False | Node _ f f1 => f = rl ∨ f1 = rl end) ∧ valid rl ∧ 0%Z ≤ i ∧ i ≤ Z.of_nat (length (to_str rl))) ∧ (∀(rll : rope) (rlr : rope), valid rll ∧ valid rlr ∧ to_str rl = to_str rll ++ to_str rlr ∧ Z.of_nat (length (to_str rll)) = i -> valid rlr ∧ valid rr) else wl < i -> (let o1 : Z := i - wl in ((match r with | Leaf _ => False | Node _ f f1 => f = rr ∨ f1 = rr end) ∧ valid rr ∧ 0%Z ≤ o1 ∧ o1 ≤ Z.of_nat (length (to_str rr))) ∧ (∀(rrl : rope) (rrr : rope), valid rrl ∧ valid rrr ∧ to_str rr = to_str rrl ++ to_str rrr ∧ Z.of_nat (length (to_str rrl)) = o1 -> valid rl ∧ valid rrl))) end) ∧ (∀(left1 : rope) (right1 : rope), (match r with | Leaf s => left1 = Leaf (take (Z.to_nat i) s) ∧ right1 = Leaf (drop (Z.to_nat i) s) | Node wl rl rr => (if decide (i < wl) then ∃(right2 : rope), (valid left1 ∧ valid right2 ∧ to_str rl = to_str left1 ++ to_str right2 ∧ Z.of_nat (length (to_str left1)) = i) ∧ valid right1 ∧ to_str right1 = to_str right2 ++ to_str rr else if decide (wl < i) then ∃(left2 : rope), (valid left2 ∧ valid right1 ∧ to_str rr = to_str left2 ++ to_str right1 ∧ Z.of_nat (length (to_str left2)) = i - wl) ∧ valid left1 ∧ to_str left1 = to_str rl ++ to_str left2 else left1 = rl ∧ right1 = rr) end) -> valid left1 ∧ valid right1 ∧ to_str r = to_str left1 ++ to_str right1 ∧ Z.of_nat (length (to_str left1)) = i).
Proof.
Admitted.
