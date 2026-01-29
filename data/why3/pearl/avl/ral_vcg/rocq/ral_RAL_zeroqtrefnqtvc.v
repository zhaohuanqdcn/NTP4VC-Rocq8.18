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
Require Import avl.avl.SelectionTypes.
Open Scope Z_scope.
Axiom balancing : nat.
Axiom balancing'def : 0%Z < Z.of_nat balancing.
Axiom m : Type.
Axiom m_inhabited : Inhabited m.
Global Existing Instance m_inhabited.
Axiom m_countable : Countable m.
Global Existing Instance m_countable.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom assoc : forall  (a : Z) (b : Z) (c : Z), a + (b + c) = a + b + c.
Axiom neutral : forall  (x : Z), x + 0%Z = x ∧ x = 0%Z + x.
Axiom agg : forall {α : Type} `{Inhabited α}, (α -> Z) -> list α -> Z.
Axiom agg'def : forall  {α : Type} `{Inhabited α} (s : list α) (f : α -> Z), if decide (Z.of_nat (length s) = 0%Z) then agg f s = 0%Z else agg f s = f (nth 0%nat s inhabitant) + agg f (drop 1%nat s).
Axiom t1 : Type -> Type.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Definition measure {α : Type} `{Inhabited α} (x : α) : Z := 1%Z.
Inductive selector :=
  | selector'mk : Z -> bool -> selector.
Axiom selector_inhabited : Inhabited selector.
Global Existing Instance selector_inhabited.
Axiom selector_countable : Countable selector.
Global Existing Instance selector_countable.
Definition index (x : selector) := match x with |  selector'mk a _ => a end.
Definition hole (x : selector) := match x with |  selector'mk _ a => a end.
Definition selection_possible {α : Type} `{Inhabited α} (s : selector) (l : list α) := 0%Z ≤ index s ∧ (if decide (hole s = true) then index s ≤ Z.of_nat (length l) else index s < Z.of_nat (length l)).
Definition selected {α : Type} `{Inhabited α} (s : selector) (e : split α) := index s = Z.of_nat (length (left1 e)) ∧ (hole s = true) = (middle e = (None : option α)).
Theorem zero'refn'vc : True.
Proof.
Admitted.
