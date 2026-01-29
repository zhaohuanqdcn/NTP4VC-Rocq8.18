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
Theorem m_mdl_ok'vc (f : Z -> mat Z) (r : Z) (c : Z) (m : mono) (fact0 : l_vld f r c (m_prod m)) : let rs : mat Z := m_mdl f m in rows rs = r ∧ cols rs = c.
Proof.
Admitted.
