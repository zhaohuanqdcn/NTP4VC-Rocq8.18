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
Require Import Why3.why3.Ref.Ref.
Require Import Why3.map.MapEq.
Require Import Why3.map.MapExchange.
Require Import Why3.map.MapPermut.
Open Scope Z_scope.
Axiom x_N : Z.
Axiom f : Z.
Axiom f_N_range : 1%Z ≤ f ∧ f ≤ x_N.
Definition found (a : list Z) := ∀(p : Z) (q : Z), 1%Z ≤ p ∧ p ≤ f ∧ f ≤ q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat f) a inhabitant ∧ nth (Z.to_nat f) a inhabitant ≤ nth (Z.to_nat q) a inhabitant.
Definition m_invariant (m : Z) (a : list Z) := m ≤ f ∧ (∀(p : Z) (q : Z), 1%Z ≤ p ∧ p < m ∧ m ≤ q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant).
Definition n_invariant (n : Z) (a : list Z) := f ≤ n ∧ (∀(p : Z) (q : Z), 1%Z ≤ p ∧ p ≤ n ∧ n < q ∧ q ≤ x_N -> nth (Z.to_nat p) a inhabitant ≤ nth (Z.to_nat q) a inhabitant).
Definition i_invariant (m : Z) (n : Z) (i : Z) (q : Z) (r : Z) (a : list Z) := m ≤ i ∧ (∀(p : Z), 1%Z ≤ p ∧ p < i -> nth (Z.to_nat p) a inhabitant ≤ r) ∧ (i ≤ n -> (i ≤ q ∧ q ≤ n) ∧ r ≤ nth (Z.to_nat q) a inhabitant).
Definition j_invariant (m : Z) (n : Z) (j : Z) (p : Z) (r : Z) (a : list Z) := j ≤ n ∧ (∀(q : Z), j < q ∧ q ≤ x_N -> r ≤ nth (Z.to_nat q) a inhabitant) ∧ (m ≤ j -> (m ≤ p ∧ p ≤ j) ∧ nth (Z.to_nat p) a inhabitant ≤ r).
Definition termination (i : Z) (j : Z) (i0 : Z) (j0 : Z) (r : Z) (a : list Z) := i0 < i ∧ j < j0 ∨ (i ≤ f ∧ f ≤ j) ∧ nth (Z.to_nat f) a inhabitant = r.
