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
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom balancing : nat.
Axiom balancing'def : 0%Z < Z.of_nat balancing.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom t1 : Type.
Axiom t1_inhabited : Inhabited t1.
Global Existing Instance t1_inhabited.
Axiom t1_countable : Countable t1.
Global Existing Instance t1_countable.
Axiom key : forall {α : Type} `{Inhabited α}, t α -> t1.
Axiom le : t1 -> t1 -> Prop.
Axiom Refl : forall  (x : t1), le x x.
Axiom Trans : forall  (x : t1) (y : t1) (z : t1) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom eq : t1 -> t1 -> Prop.
Axiom eq_def : forall  (x : t1) (y : t1), eq x y = (le x y ∧ le y x).
Axiom lt : t1 -> t1 -> Prop.
Axiom lt_def : forall  (x : t1) (y : t1), lt x y = (le x y ∧ ¬ le y x).
Axiom Total : forall  (x : t1) (y : t1), le x y ∨ le y x.
Axiom t2 : Type.
Axiom t2_inhabited : Inhabited t2.
Global Existing Instance t2_inhabited.
Axiom t2_countable : Countable t2.
Global Existing Instance t2_countable.
Definition op (x : option t1) (y : option t1) : option t1 := match x with | None => y | Some a => (match y with | None => x | Some b => (if decide (lt b a) then y else x) end) end.
Axiom assoc : forall  (a : option t1) (b : option t1) (c : option t1), op a (op b c) = op (op a b) c.
Axiom neutral : forall  (x : option t1), op x None = x ∧ x = op None x.
Axiom agg : forall {α : Type} `{Inhabited α}, (α -> option t1) -> list α -> option t1.
Axiom agg'def : forall  {α : Type} `{Inhabited α} (s : list α) (f : α -> option t1), if decide (Z.of_nat (length s) = 0%Z) then agg f s = None else agg f s = op (f (nth 0%nat s inhabitant)) (agg f (drop 1%nat s)).
Theorem op'vc (x : option t1) (y : option t1) : (match x with | None => True | Some a => (match y with | None => True | Some b => True end) end) ∧ (∀(result : option t1), (match x with | None => result = y | Some a => (match y with | None => result = x | Some b => (∃(o1 : Z), ((0%Z < o1) = lt a b ∧ (o1 < 0%Z) = lt b a ∧ (o1 = 0%Z) = eq b a) ∧ (if decide (o1 < 0%Z) then result = y else result = x)) end) end) -> result = op x y).
Admitted.
