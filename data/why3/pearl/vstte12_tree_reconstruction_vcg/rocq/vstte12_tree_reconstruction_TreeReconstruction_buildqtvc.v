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
Theorem build'vc (s1 : list Z) : (∀(t : tree) (s : list Z), s1 = depths 0%Z t ++ s -> (match s with | [] => depths 0%Z t = s1 | _ => (∀(t1 : tree), ¬ depths 0%Z t1 = s1) end)) ∧ ((∀(t : tree) (s' : list Z), ¬ depths 0%Z t ++ s' = s1) -> (∀(t : tree), ¬ depths 0%Z t = s1)).
Proof.
Admitted.
