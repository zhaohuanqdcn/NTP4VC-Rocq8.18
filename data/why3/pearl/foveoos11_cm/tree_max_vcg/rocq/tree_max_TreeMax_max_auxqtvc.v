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
Require Import foveoos11_cm.tree_max.BinTree.
Open Scope Z_scope.
Theorem max_aux'vc (t : tree) (acc : Z) : (match t with | Null => True | Tree v l r => (let o1 : Z := Z.max v acc in (match t with | Null => False | Tree _ f f1 => f = r ∨ f1 = r end) ∧ (∀(o2 : Z), ge_tree o2 r ∧ o1 ≤ o2 ∧ (o2 = o1 ∨ mem o2 r) -> (match t with | Null => False | Tree _ f f1 => f = l ∨ f1 = l end))) end) ∧ (∀(result : Z), (match t with | Null => result = acc | Tree v l r => (let o1 : Z := Z.max v acc in ∃(o2 : Z), (ge_tree o2 r ∧ o1 ≤ o2 ∧ (o2 = o1 ∨ mem o2 r)) ∧ ge_tree result l ∧ o2 ≤ result ∧ (result = o2 ∨ mem result l)) end) -> ge_tree result t ∧ acc ≤ result ∧ (result = acc ∨ mem result t)).
Proof.
Admitted.
