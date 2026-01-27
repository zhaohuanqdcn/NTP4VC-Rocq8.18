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
Theorem recover'vc (h : hcode) (e : expr) (r : Z) (s : state) (fact0 : hcode_ok h) (fact1 : post1 h = expr_post e r) : let s' : state := exec_list (hcode1 h) s in mem s' = mem s ∧ reg s' r = eval (mem s) e ∧ st s' = st s ∧ (∀(r' : Z), r' < r -> reg s' r' = reg s r').
Admitted.
