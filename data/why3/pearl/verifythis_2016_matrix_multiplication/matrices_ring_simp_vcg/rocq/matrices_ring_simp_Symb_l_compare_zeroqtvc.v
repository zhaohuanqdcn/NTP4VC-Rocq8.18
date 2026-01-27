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
Require Import Why3.int.Sum.
Require Import verifythis_2016_matrix_multiplication.matrices.MyMatrix.
Require Import verifythis_2016_matrix_multiplication.matrices.MatrixArithmetic.
Require Import verifythis_2016_matrix_multiplication.sum_extended.Sum_extended.
Open Scope Z_scope.
Inductive mono :=
  | mono'mk : list Z -> bool -> mono.
Axiom mono_inhabited : Inhabited mono.
Global Existing Instance mono_inhabited.
Axiom mono_countable : Countable mono.
Global Existing Instance mono_countable.
Definition m_prod (x : mono) := match x with |  mono'mk a _ => a end.
Definition m_pos (x : mono) := match x with |  mono'mk _ a => a end.
Axiom l_mdl : (Z -> mat Z) -> list Z -> mat Z.
Axiom l_mdl_def : forall (f : Z -> mat Z) (l : list Z), l_mdl f l = (match l with | [] => create (- 1%Z) (- 1%Z) zerof | cons x [] => f x | cons x q => mul (f x) (l_mdl f q) end).
Axiom l_vld : (Z -> mat Z) -> Z -> Z -> list Z -> Prop.
Axiom l_vld_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list Z), l_vld f r c l = (match l with | [] => False | cons x [] => rows (f x) = r ∧ cols (f x) = c | cons x q => rows (f x) = r ∧ l_vld f (cols (f x)) c q end).
Definition m_mdl (f : Z -> mat Z) (m : mono) : mat Z := let m0 : mat Z := l_mdl f (m_prod m) in if decide (m_pos m = true) then m0 else opp m0.
Axiom lm_mdl : (Z -> mat Z) -> Z -> Z -> list mono -> mat Z.
Axiom lm_mdl_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_mdl f r c l = (match l with | [] => create r c zerof | cons x q => add (lm_mdl f r c q) (m_mdl f x) end).
Axiom lm_mdl_simp : (Z -> mat Z) -> Z -> Z -> list mono -> mat Z.
Axiom lm_mdl_simp_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_mdl_simp f r c l = (match l with | [] => create r c zerof | cons x [] => m_mdl f x | cons x q => add (lm_mdl_simp f r c q) (m_mdl f x) end).
Axiom lm_vld : (Z -> mat Z) -> Z -> Z -> list mono -> Prop.
Axiom lm_vld_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_vld f r c l = (match l with | [] => True | cons x q => l_vld f r c (m_prod x) ∧ lm_vld f r c q end).
Axiom l_compare : list Z -> list Z -> Z.
Axiom l_compare_def : forall (l1 : list Z) (l2 : list Z), l_compare l1 l2 = (match (l1, l2) with | ([], []) => 0%Z | ([], _) => - 1%Z | (_, []) => 1%Z | (cons x q, cons y r) => (if decide (x < y) then - 1%Z else if decide (y < x) then 1%Z else l_compare q r) end).
Theorem l_compare_zero'vc (l1 : list Z) (l2 : list Z) (fact0 : l_compare l1 l2 = 0%Z) : l1 = l2.
Admitted.
