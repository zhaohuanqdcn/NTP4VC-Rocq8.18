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
Axiom key : Type.
Axiom key_inhabited : Inhabited key.
Global Existing Instance key_inhabited.
Axiom key_countable : Countable key.
Global Existing Instance key_countable.
Axiom value : Type.
Axiom value_inhabited : Inhabited value.
Global Existing Instance value_inhabited.
Axiom value_countable : Countable value.
Global Existing Instance value_countable.
Axiom model : Type.
Axiom model_inhabited : Inhabited model.
Global Existing Instance model_inhabited.
Axiom model_countable : Countable model.
Global Existing Instance model_countable.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom model1 : t -> key -> option value.
Axiom empty : t.
Axiom empty1 : forall  (k : key), model1 empty k = None.
Definition get (d : t) (k : key) : option value := model1 d k.
Axiom set : t -> key -> value -> t.
Axiom set'spec'0 : forall  (d : t) (k : key) (v : value), get (set d k v) k = Some v.
Axiom set'spec : forall  (k' : key) (k : key) (d : t) (v : value) (fact0 : ¬ k' = k), get (set d k v) k' = get d k'.
