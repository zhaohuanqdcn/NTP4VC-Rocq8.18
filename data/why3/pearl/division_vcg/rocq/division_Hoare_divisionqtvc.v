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
Axiom integer : Type.
Axiom integer_inhabited : Inhabited integer.
Global Existing Instance integer_inhabited.
Axiom integer_countable : Countable integer.
Global Existing Instance integer_countable.
Axiom zero : integer.
Axiom one : integer.
Axiom infix_pl : integer -> integer -> integer.
Axiom infix_mn : integer -> integer -> integer.
Axiom infix_as : integer -> integer -> integer.
Axiom infix_lseq : integer -> integer -> Prop.
Axiom A1 : forall  (x : integer) (y : integer), infix_pl x y = infix_pl y x.
Axiom A2 : forall  (x : integer) (y : integer), infix_as x y = infix_as y x.
Axiom A3 : forall  (x : integer) (y : integer) (z : integer), infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z).
Axiom A4 : forall  (x : integer) (y : integer) (z : integer), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom A5 : forall  (x : integer) (y : integer) (z : integer), infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z).
Axiom A6 : forall  (y : integer) (x : integer) (fact0 : infix_lseq y x), infix_pl (infix_mn x y) y = x.
Axiom A7 : forall  (x : integer), infix_pl x zero = x.
Axiom A8 : forall  (x : integer), infix_as x zero = zero.
Axiom A9 : forall  (x : integer), infix_as x one = x.
Theorem division'vc (x : integer) (y : integer) : x = infix_pl x (infix_as y zero) ∧ (∀(q : integer) (r : integer), x = infix_pl r (infix_as y q) -> (if decide (infix_lseq y r) then x = infix_pl (infix_mn r y) (infix_as y (infix_pl one q)) else ¬ infix_lseq y r ∧ x = infix_pl r (infix_as y q))).
Admitted.
