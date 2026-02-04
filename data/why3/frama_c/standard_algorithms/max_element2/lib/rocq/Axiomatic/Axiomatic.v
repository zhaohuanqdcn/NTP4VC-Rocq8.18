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
Require Import Why3.Qed.Qed.
Require Import Why3.Memory.Memory.
Require Import max_element2.Compound.Compound.
Open Scope Z_scope.
Definition p_upperbound_1' (mint_0 : addr -> Z) (a : addr) (m : Z) (n : Z) (v : Z) := ∀(i : Z), m ≤ i -> i < n -> mint_0 (shift a i) ≤ v.
Definition p_strictupperbound_1' (mint_0 : addr -> Z) (a : addr) (m : Z) (n : Z) (v : Z) := ∀(i : Z), m ≤ i -> i < n -> mint_0 (shift a i) < v.
Definition p_maxelement (mint_0 : addr -> Z) (a : addr) (n : Z) (max_0 : Z) := 0%Z ≤ max_0 ∧ max_0 < n ∧ p_upperbound_1' mint_0 a 0%Z n (mint_0 (shift a max_0)).
