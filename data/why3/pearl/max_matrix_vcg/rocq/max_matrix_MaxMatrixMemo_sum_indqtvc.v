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
Require Import Why3.map.Const.
Require Import max_matrix_vcg.max_matrix.Bitset.
Open Scope Z_scope.
Axiom t : Type -> Type.
Axiom t_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (t α).
Global Existing Instance t_inhabited.
Axiom contents : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom create : forall {α : Type} `{Inhabited α}, α -> t α.
Axiom create'spec : forall  {α : Type} `{Inhabited α} (x : α), contents (create x) = (const : α -> Z -> α) x.
Axiom mixfix_lbrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α.
Axiom mixfix_lbrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z), mixfix_lbrb m k = contents m k.
Axiom mixfix_lblsmnrb : forall {α : Type} `{Inhabited α}, t α -> Z -> α -> t α.
Axiom mixfix_lblsmnrb'spec : forall  {α : Type} `{Inhabited α} (m : t α) (k : Z) (v : α), contents (mixfix_lblsmnrb m k v) = fun_updt (contents m) k v.
Axiom n : Z.
Axiom n'def : 0%Z ≤ n ∧ n ≤ Bitset.size.
Axiom m : t (t Z).
Axiom m'def : forall  (i : Z) (j : Z) (fact0 : 0%Z ≤ i) (fact1 : i < n) (fact2 : 0%Z ≤ j) (fact3 : j < n), 0%Z ≤ mixfix_lbrb (mixfix_lbrb m i) j.
Axiom mapii : Type.
Axiom mapii_inhabited : Inhabited mapii.
Global Existing Instance mapii_inhabited.
Axiom mapii_countable : Countable mapii.
Global Existing Instance mapii_countable.
Definition solution (s : Z -> Z) (i : Z) := (∀(k : Z), i ≤ k ∧ k < n -> 0%Z ≤ s k ∧ s k < n) ∧ (∀(k1 : Z) (k2 : Z), i ≤ k1 ∧ k1 < k2 ∧ k2 < n -> ¬ s k1 = s k2).
Definition f (s : Z -> Z) (i : Z) : Z := mixfix_lbrb (mixfix_lbrb m i) (s i).
Axiom sum : (Z -> Z) -> Z -> Z -> Z.
Axiom Sum_def_empty : forall  (j : Z) (i : Z) (c : Z -> Z) (fact0 : j ≤ i), sum c i j = 0%Z.
Axiom Sum_def_non_empty : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = f c i + sum c (i + 1%Z) j.
Axiom Sum_right_extension : forall  (i : Z) (j : Z) (c : Z -> Z) (fact0 : i < j), sum c i j = sum c i (j - 1%Z) + f c (j - 1%Z).
Axiom Sum_transitivity : forall  (i : Z) (k : Z) (j : Z) (c : Z -> Z) (fact0 : i ≤ k) (fact1 : k ≤ j), sum c i j = sum c i k + sum c k j.
Axiom Sum_eq : forall  (i : Z) (j : Z) (c1 : Z -> Z) (c2 : Z -> Z) (fact0 : ∀(k : Z), i ≤ k ∧ k < j -> f c1 k = f c2 k), sum c1 i j = sum c2 i j.
Theorem sum_ind'vc (i : Z) (s : Z -> Z) (j : Z) (fact0 : i < n) : sum (fun_updt s i j) i n = mixfix_lbrb (mixfix_lbrb m i) j + sum s (i + 1%Z) n.
Admitted.
