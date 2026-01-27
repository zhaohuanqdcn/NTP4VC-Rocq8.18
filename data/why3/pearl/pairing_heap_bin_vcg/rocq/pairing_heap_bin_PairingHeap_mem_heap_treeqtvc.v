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
Require Import pairing_heap_bin_vcg.pairing_heap_bin.HeapType.
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Occ.
Require Import pairing_heap_bin_vcg.pairing_heap_bin.MySize.
Require Import pairing_heap_bin_vcg.pairing_heap_bin.MyOcc.
Open Scope Z_scope.
Axiom le : elt -> elt -> Prop.
Axiom Refl : forall  (x : elt), le x x.
Axiom Trans : forall  (x : elt) (y : elt) (z : elt) (fact0 : le x y) (fact1 : le y z), le x z.
Axiom Total : forall  (x : elt) (y : elt), le x y ∨ le y x.
Definition le_root (e : elt) (h : heap) := match h with | E => True | T x _ => le e x end.
Program Fixpoint le_root_tree (e : elt) (t : tree elt) : Prop :=
match t with | Empty => True | Node _ x r => le e x ∧ le_root_tree e r end.
Admit Obligations.
Program Fixpoint heap_tree (t : tree elt) : Prop :=
match t with | Empty => True | Node l x r => le_root_tree x l ∧ heap_tree l ∧ heap_tree r end.
Admit Obligations.
Definition heap (h : HeapType.heap) := match h with | E => True | T x r => le_root_tree x r ∧ heap_tree r end.
Axiom minimum : HeapType.heap -> elt.
Axiom minimum_def : forall  (x : elt) (r : tree elt), minimum (T x r) = x.
Definition is_minimum (x : elt) (h : HeapType.heap) := MyOcc.mem x h ∧ (∀(e : elt), MyOcc.mem e h -> le x e).
Theorem mem_heap_tree'vc (t : tree elt) (x : elt) (y : elt) (fact0 : heap_tree t) (fact1 : le_root_tree x t) (fact2 : Occ.mem y t) : le x y.
Admitted.
