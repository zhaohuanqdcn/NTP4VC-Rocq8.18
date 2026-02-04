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
Require Import copy.Compound.Compound.
Open Scope Z_scope.
Definition p_equalranges_1' (mint_0 : addr -> Z) (mint_1 : addr -> Z) (a : addr) (n : Z) (b : addr) := ∀(i : Z), 0%Z ≤ i -> i < n -> mint_1 (shift a i) = mint_0 (shift b i).
Definition p_unchanged_1' (mint_0 : addr -> Z) (mint_1 : addr -> Z) (a : addr) (m : Z) (n : Z) := ∀(i : Z), let a_1 : addr := shift a i in m ≤ i -> i < n -> mint_1 a_1 = mint_0 a_1.
