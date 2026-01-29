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
Axiom is_short : list char -> Prop.
Theorem concat2'vc (left1 : rope) (right1 : rope) (fact0 : valid left1) (fact1 : valid right1) : (match right1 with | Leaf sr => (if decide (is_short sr) then match left1 with | Leaf sl => ¬ is_short sl -> valid left1 ∧ valid right1 | Node wl rl (Leaf sl) => ¬ is_short sl -> valid left1 ∧ valid right1 | _ => valid left1 ∧ valid right1 end else valid left1 ∧ valid right1) | _ => valid left1 ∧ valid right1 end) ∧ (∀(result : rope), (match right1 with | Leaf sr => (if decide (is_short sr) then match left1 with | Leaf sl => (if decide (is_short sl) then let o1 : list char := sl ++ sr in (Z.of_nat (length o1) = Z.of_nat (length sl) + Z.of_nat (length sr) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length sl) -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat i) sl inhabitant) ∧ (∀(i : Z), Z.of_nat (length sl) ≤ i ∧ i < Z.of_nat (length o1) -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat (i - Z.of_nat (length sl))) sr inhabitant)) ∧ result = Leaf o1 else valid result ∧ to_str result = to_str left1 ++ to_str right1) | Node wl rl (Leaf sl) => (if decide (is_short sl) then let o1 : list char := sl ++ sr in (Z.of_nat (length o1) = Z.of_nat (length sl) + Z.of_nat (length sr) ∧ (∀(i : Z), 0%Z ≤ i ∧ i < Z.of_nat (length sl) -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat i) sl inhabitant) ∧ (∀(i : Z), Z.of_nat (length sl) ≤ i ∧ i < Z.of_nat (length o1) -> nth (Z.to_nat i) o1 inhabitant = nth (Z.to_nat (i - Z.of_nat (length sl))) sr inhabitant)) ∧ result = Node wl rl (Leaf o1) else valid result ∧ to_str result = to_str left1 ++ to_str right1) | _ => valid result ∧ to_str result = to_str left1 ++ to_str right1 end else valid result ∧ to_str result = to_str left1 ++ to_str right1) | _ => valid result ∧ to_str result = to_str left1 ++ to_str right1 end) -> valid result ∧ to_str result = to_str left1 ++ to_str right1).
Proof.
Admitted.
