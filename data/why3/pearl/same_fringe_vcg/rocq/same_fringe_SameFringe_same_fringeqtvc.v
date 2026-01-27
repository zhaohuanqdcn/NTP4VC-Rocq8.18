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
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Inductive tree :=
  | Empty : tree
  | Node : tree -> elt -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint elements (t : tree) : list elt :=
match t with | Empty => ([] : list elt) | Node l x r => elements l ++ cons x (elements r) end.
Admit Obligations.
Inductive enum :=
  | Done : enum
  | Next : elt -> tree -> enum -> enum.
Axiom enum_inhabited : Inhabited enum.
Global Existing Instance enum_inhabited.
Axiom enum_countable : Countable enum.
Global Existing Instance enum_countable.
Program Fixpoint enum_elements (e : enum) : list elt :=
match e with | Done => ([] : list elt) | Next x r e1 => cons x (elements r ++ enum_elements e1) end.
Admit Obligations.
Theorem same_fringe'vc (o1 : enum) (t2 : tree) (o2 : enum) (t1 : tree) (fact0 : enum_elements o1 = elements t2 ++ enum_elements Done) (fact1 : enum_elements o2 = elements t1 ++ enum_elements Done) : (enum_elements o2 = enum_elements o1) = (elements t1 = elements t2).
Admitted.
