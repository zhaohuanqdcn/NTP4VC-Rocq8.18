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
Require Import register_allocation_vcg.register_allocation.Spec.
Require Import register_allocation_vcg.register_allocation.DWP.
Open Scope Z_scope.
Axiom k : Z.
Axiom k'def : 2%Z ≤ k.
Program Fixpoint n (e : expr) : Z :=
match e with | Evar _ => 1%Z | Eneg e1 => n e1 | Eadd e1 e2 => (let n1 : Z := n e1 in let n2 : Z := n e2 in if decide (n1 = n2) then 1%Z + n1 else Z.max n1 n2) end.
Admit Obligations.
Program Fixpoint measure (e : expr) : Z :=
match e with | Evar _ => 0%Z | Eneg e1 => 1%Z + measure e1 | Eadd e1 e2 => 1%Z + (if decide (n e2 ≤ n e1) then measure e1 + measure e2 else 1%Z + measure e1 + measure e2) end.
Admit Obligations.
Theorem measure_nonneg'vc (e : expr) : 0%Z ≤ measure e.
Admitted.
