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
Require Import adjacent_difference_inv.A_DifferenceAxiomatic.A_DifferenceAxiomatic.
Require Import Why3.Cint.Cint.
Require Import adjacent_difference_inv.Compound.Compound.
Require Import adjacent_difference_inv.Axiomatic.Axiomatic.
Open Scope Z_scope.
Definition p_adjacentdifferencebounds (mint_0 : addr -> Z) (a : addr) (n : Z) := ∀(i : Z), let x : Z := l_difference mint_0 a i in 0%Z < i -> i < n -> - 2147483648%Z ≤ x ∧ x ≤ 2147483647%Z.
Definition p_adjacentdifference (mint_0 : addr -> Z) (a : addr) (n : Z) (b : addr) := ∀(i : Z), 0%Z ≤ i -> i < n -> mint_0 (shift b i) = l_difference mint_0 a i.
