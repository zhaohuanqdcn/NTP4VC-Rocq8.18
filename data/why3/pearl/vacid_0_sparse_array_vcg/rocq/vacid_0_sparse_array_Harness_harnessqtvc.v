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
Require Import Why3.map.MapInjection.
Require Import vacid_0_sparse_array_vcg.vacid_0_sparse_array.SparseArray.
Open Scope Z_scope.
Axiom elt : Type.
Axiom elt_inhabited : Inhabited elt.
Global Existing Instance elt_inhabited.
Axiom elt_countable : Countable elt.
Global Existing Instance elt_countable.
Axiom default : elt.
Axiom c1 : elt.
Axiom c2 : elt.
Theorem harness'vc : 0%Z ≤ 10%Z ∧ 10%Z ≤ 1000%Z ∧ (∀(a : sparse_array elt), card a = 0%Z ∧ def1 a = default ∧ SparseArray.length a = 10%Z -> (0%Z ≤ 20%Z ∧ 20%Z ≤ 1000%Z) ∧ (∀(b : sparse_array elt), card b = 0%Z ∧ def1 b = default ∧ SparseArray.length b = 20%Z -> (0%Z ≤ 5%Z ∧ 5%Z < SparseArray.length a) ∧ (0%Z ≤ 7%Z ∧ 7%Z < SparseArray.length b) ∧ (0%Z ≤ 5%Z ∧ 5%Z < SparseArray.length a) ∧ (∀(a1 : sparse_array elt), List.length (values a1) = List.length (values a) ∧ List.length (index a1) = List.length (index a) ∧ List.length (back a1) = List.length (back a) -> def1 a = def1 a1 -> value a1 5%Z = c1 ∧ (∀(j : Z), ¬ j = 5%Z -> value a1 j = value a j) -> (0%Z ≤ 7%Z ∧ 7%Z < SparseArray.length b) ∧ (∀(b1 : sparse_array elt), List.length (values b1) = List.length (values b) ∧ List.length (index b1) = List.length (index b) ∧ List.length (back b1) = List.length (back b) -> def1 b = def1 b1 -> value b1 7%Z = c2 ∧ (∀(j : Z), ¬ j = 7%Z -> value b1 j = value b j) -> (0%Z ≤ 5%Z ∧ 5%Z < SparseArray.length a1) ∧ (0%Z ≤ 7%Z ∧ 7%Z < SparseArray.length b1) ∧ (0%Z ≤ 7%Z ∧ 7%Z < SparseArray.length a1) ∧ (0%Z ≤ 5%Z ∧ 5%Z < SparseArray.length b1) ∧ (0%Z ≤ 0%Z ∧ 0%Z < SparseArray.length a1) ∧ 0%Z ≤ 0%Z ∧ 0%Z < SparseArray.length b1)))).
Admitted.
