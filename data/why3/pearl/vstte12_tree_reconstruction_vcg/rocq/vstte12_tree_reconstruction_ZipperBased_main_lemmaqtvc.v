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
Require Import vstte12_tree_reconstruction_vcg.vstte12_tree_reconstruction.Tree.
Open Scope Z_scope.
Program Fixpoint forest_depths (f : list (Z * tree)) : list Z :=
match f with | [] => ([] : list Z) | cons (d, t) r => depths d t ++ forest_depths r end.
Admit Obligations.
Program Fixpoint greedy (d : Z) (d1 : Z) (t1 : tree) : Prop :=
¬ d = d1 ∧ (match t1 with | Leaf => True | Node l1 _ => greedy d (d1 + 1%Z) l1 end).
Admit Obligations.
Inductive g : list (Z * tree) -> Prop :=
 | Gnil : g ([] : list (Z * tree))
 | Gone (d : Z) (t : tree) : g (cons (d, t) ([] : list (Z * tree)))
 | Gtwo (d1 : Z) (d2 : Z) (t2 : tree) (t1 : tree) (l : list (Z * tree)) : greedy d1 d2 t2 -> g (cons (d1, t1) l) -> g (cons (d2, t2) (cons (d1, t1) l)).
Theorem main_lemma'vc (d1 : Z) (d2 : Z) (t1 : tree) (l : list (Z * tree)) (t2 : tree) (fact0 : ¬ d1 = d2) (fact1 : g (cons (d1, t1) l)) (fact2 : match t2 with | Node l2 _ => greedy d1 (d2 + 1%Z) l2 | Leaf => True end) : g (cons (d2, t2) (cons (d1, t1) l)).
Proof.
Admitted.
