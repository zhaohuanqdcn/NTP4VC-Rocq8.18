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
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom eq : t -> t -> Prop.
Axiom eq'spec : forall  (x : t) (y : t), eq x y = (x = y).
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset t.
Axiom mk : gset t -> set.
Axiom mk'spec : forall  (s : gset t), to_fset (mk s) = s.
Axiom choose1 : set -> t.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Axiom rel : t -> t -> Prop.
Axiom Trans : forall  (x : t) (y : t) (z : t) (fact0 : rel x y) (fact1 : rel y z), rel x z.
Axiom Asymm : forall  (x : t) (y : t) (fact0 : rel x y), ¬ rel y x.
Axiom Trichotomy : forall  (x : t) (y : t), rel x y ∨ rel y x ∨ x = y.
Inductive sorted : list t -> Prop :=
 | Sorted_Nil : sorted ([] : list t)
 | Sorted_One (x : t) : sorted (cons x ([] : list t))
 | Sorted_Two (x : t) (y : t) (l : list t) : rel x y -> sorted (cons y l) -> sorted (cons x (cons y l)).
Axiom sorted_mem : forall  (l : list t) (x : t), ((∀(y : t), y ∈ l -> rel x y) ∧ sorted l) = sorted (cons x l).
Axiom sorted_append : forall  (l1 : list t) (l2 : list t), (sorted l1 ∧ sorted l2 ∧ (∀(x : t) (y : t), x ∈ l1 -> y ∈ l2 -> rel x y)) = sorted (l1 ++ l2).
Theorem coincidence_count'vc (a : list t) (b : list t) (fact0 : sorted a) (fact1 : sorted b) : (match b with | cons x x1 => (match a with | cons x2 x3 => eq x2 x = (x2 = x) -> (if decide (eq x2 x) then ((match a with | [] => False | cons _ f => f = x3 end) ∨ a = x3 ∧ (match b with | [] => False | cons _ f => f = x1 end)) ∧ sorted x3 ∧ sorted x1 else if decide (rel x2 x) then (match a with | [] => False | cons _ f => f = x3 end) ∧ sorted x3 ∧ sorted b else (match b with | [] => False | cons _ f => f = x1 end) ∧ sorted a ∧ sorted x1) | _ => True end) | _ => True end) ∧ (∀(result : set), (match b with | cons x x1 => (match a with | cons x2 x3 => eq x2 x = (x2 = x) ∧ (if decide (eq x2 x) then ∃(o1 : set), to_fset o1 = list_to_gset x3 ∩ list_to_gset x1 ∧ to_fset result = insert_set x2 (to_fset o1) ∧ (if decide (x2 ∈ to_fset o1) then size (to_fset result) = size (to_fset o1) else Z.of_nat (size (to_fset result)) = Z.of_nat (size (to_fset o1)) + 1%Z) else if decide (rel x2 x) then to_fset result = list_to_gset x3 ∩ list_to_gset b else to_fset result = list_to_gset a ∩ list_to_gset x1) | _ => to_fset result = (∅ : gset t) ∧ Z.of_nat (size (to_fset result)) = 0%Z end) | _ => to_fset result = (∅ : gset t) ∧ Z.of_nat (size (to_fset result)) = 0%Z end) -> to_fset result = list_to_gset a ∩ list_to_gset b).
Admitted.
