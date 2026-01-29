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
Inductive tree :=
  | Empty : tree
  | Node : tree -> Z -> tree -> tree.
Axiom tree_inhabited : Inhabited tree.
Global Existing Instance tree_inhabited.
Axiom tree_countable : Countable tree.
Global Existing Instance tree_countable.
Program Fixpoint elements (t : tree) : list Z :=
match t with | Empty => ([] : list Z) | Node l x r => elements l ++ cons x (elements r) end.
Admit Obligations.
Inductive enum :=
  | Done : enum
  | Next : Z -> tree -> enum -> enum.
Axiom enum_inhabited : Inhabited enum.
Global Existing Instance enum_inhabited.
Axiom enum_countable : Countable enum.
Global Existing Instance enum_countable.
Program Fixpoint enum_elements (e : enum) : list Z :=
match e with | Done => ([] : list Z) | Next x r e1 => cons x (elements r ++ enum_elements e1) end.
Admit Obligations.
Axiom a : Z.
Axiom b : Z.
Theorem test1'vc : True.
Proof.
Admitted.
