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
Require Import Why3.map.Const.
Require Import Why3.map.MapExt.
Require Import verifythis_2016_tree_traversal_vcg.verifythis_2016_tree_traversal.Memory.
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Open Scope Z_scope.
Axiom treel : Type.
Axiom treel_inhabited : Inhabited treel.
Global Existing Instance treel_inhabited.
Axiom treel_countable : Countable treel.
Global Existing Instance treel_countable.
Program Fixpoint is_tree (memo : kind -> loc -> loc) (t : tree loc) (c : loc) (p : loc) : Prop :=
match t with | Empty => c = null | Node l m r => ¬ c = null ∧ c = m ∧ memo Parent c = p ∧ (let cl : loc := memo Left c in let cr : loc := memo Right c in (cl = null) = (cr = null) ∧ is_tree memo l cl c ∧ is_tree memo r cr c) end.
Admit Obligations.
Program Fixpoint footprint (t : tree loc) : propset loc :=
match t with | Empty => (∅ : propset loc) | Node l m r => insert_set m (footprint l ∪ footprint r) end.
Admit Obligations.
Definition ext (s : propset loc) (memo1 : kind -> loc -> loc) (memo2 : kind -> loc -> loc) := ∀(k : kind) (x : loc), x ∈ s -> memo1 k x = memo2 k x.
Definition unchanged (memo1 : kind -> loc -> loc) (memo2 : kind -> loc -> loc) := ∀(k : kind) (x : loc), memo1 k x = memo2 k x.
Definition was_marked (t : tree loc) (memo1 : loc -> bool) (memo2 : loc -> bool) := (∀(l : loc), l ∈ footprint t -> memo2 l = true) ∧ (∀(l : loc), ¬ l ∈ footprint t -> memo2 l = memo1 l).
Theorem ext_cur'vc (t : tree loc) (memo1 : kind -> loc -> loc) (memo : memory) (c : loc) (p : loc) (fact0 : ext (footprint t) memo1 (accessor memo)) (fact1 : is_tree memo1 t c p) : let o1 : kind -> loc -> loc := accessor memo in let o2 : propset loc := footprint t in (ext o2 memo1 o1 ∧ footprint t ⊆ o2 ∧ is_tree memo1 t c p) ∧ (is_tree o1 t c p -> is_tree (accessor memo) t c p).
Admitted.
