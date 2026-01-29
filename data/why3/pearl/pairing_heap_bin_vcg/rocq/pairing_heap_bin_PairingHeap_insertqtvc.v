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
Axiom empty : HeapType.heap.
Axiom empty'def : heap empty ∧ MySize.size empty = 0%Z ∧ (∀(e : elt), ¬ MyOcc.mem e empty).
Theorem insert'vc (h : HeapType.heap) (x : elt) (fact0 : heap h) : let o1 : HeapType.heap := T x (Empty : tree elt) in (heap o1 ∧ heap h) ∧ (∀(result : HeapType.heap), heap result ∧ MySize.size result = MySize.size o1 + MySize.size h ∧ (∀(x1 : elt), MyOcc.occ x1 result = MyOcc.occ x1 o1 + MyOcc.occ x1 h) -> heap result ∧ MyOcc.occ x result = MyOcc.occ x h + 1%Z ∧ (∀(y : elt), ¬ x = y -> MyOcc.occ y result = MyOcc.occ y h) ∧ MySize.size result = MySize.size h + 1%Z).
Proof.
Admitted.
