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
Open Scope Z_scope.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom zero : t.
Axiom op : t -> t -> t.
Axiom assoc : forall  (a : t) (b : t) (c : t), op a (op b c) = op (op a b) c.
Axiom neutral : forall  (x : t), op x zero = x ∧ x = op zero x.
Axiom agg : forall {α : Type} `{Inhabited α}, (α -> t) -> list α -> t.
Axiom agg_empty : forall  {α : Type} `{Inhabited α} (f : α -> t), agg f ([] : list α) = zero.
Axiom agg_sing : forall  {α : Type} `{Inhabited α} (s : list α) (f : α -> t) (fact0 : Z.of_nat (length s) = 1%Z), agg f s = f (nth 0%nat s inhabitant).
Axiom agg_cat : forall  {α : Type} `{Inhabited α} (f : α -> t) (s1 : list α) (s2 : list α), agg f (s1 ++ s2) = op (agg f s1) (agg f s2).
Axiom t1 : Type -> Type.
Axiom t1_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t1 α).
Global Existing Instance t1_inhabited.
Axiom measure : forall {α : Type} `{Inhabited α}, t1 α -> t.
Theorem balancing'vc : True.
Proof.
Admitted.
