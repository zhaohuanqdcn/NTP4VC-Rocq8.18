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
Axiom lm_mdl : (Z -> mat Z) -> Z -> Z -> list mono -> mat Z.
Axiom lm_mdl_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_mdl f r c l = (match l with | [] => create r c zerof | cons x q => add (lm_mdl f r c q) (m_mdl f x) end).
Axiom lm_mdl_simp : (Z -> mat Z) -> Z -> Z -> list mono -> mat Z.
Axiom lm_mdl_simp_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_mdl_simp f r c l = (match l with | [] => create r c zerof | cons x [] => m_mdl f x | cons x q => add (lm_mdl_simp f r c q) (m_mdl f x) end).
Axiom lm_vld : (Z -> mat Z) -> Z -> Z -> list mono -> Prop.
Axiom lm_vld_def : forall (f : Z -> mat Z) (r : Z) (c : Z) (l : list mono), lm_vld f r c l = (match l with | [] => True | cons x q => l_vld f r c (m_prod x) ∧ lm_vld f r c q end).
Axiom l_compare : list Z -> list Z -> Z.
Axiom l_compare_def : forall (l1 : list Z) (l2 : list Z), l_compare l1 l2 = (match (l1, l2) with | ([], []) => 0%Z | ([], _) => - 1%Z | (_, []) => 1%Z | (cons x q, cons y r) => (if decide (x < y) then - 1%Z else if decide (y < x) then 1%Z else l_compare q r) end).
Definition m_lower (m1 : mono) (m2 : mono) := let cmp : Z := l_compare (m_prod m1) (m_prod m2) in cmp < 0%Z ∨ cmp = 0%Z ∧ (m_pos m1 = true -> m_pos m2 = true).
Definition m_collapse (l : list mono) (m : mono) : list mono := match l with | [] => cons m ([] : list mono) | cons x q => (if decide (¬ m_pos x = true ∧ m_pos m = true ∧ l_compare (m_prod m) (m_prod x) = 0%Z) then q else cons m l) end.
Axiom lm_collapse : list mono -> list mono -> list mono.
Axiom lm_collapse_def : forall (acc : list mono) (l : list mono), lm_collapse acc l = (match l with | [] => acc | cons x q => lm_collapse (m_collapse acc x) q end).
Axiom cat_rev : forall {α : Type} `{Inhabited α}, list α -> list α -> list α.
Axiom cat_rev_def : forall {α : Type} `{Inhabited α} (acc : list α) (l : list α), cat_rev acc l = (match l with | [] => acc | cons x q => cat_rev (cons x acc) q end).
Axiom lm_dump : mono -> list mono -> list mono -> list mono * list mono.
Axiom lm_dump_def : forall (x : mono) (acc : list mono) (l : list mono), lm_dump x acc l = (match l with | [] => (acc, ([] : list mono)) | cons y q => (if decide (m_lower x y) then (acc, l) else lm_dump x (m_collapse acc y) q) end).
Axiom lm_merge : list mono -> list mono -> list mono -> list mono.
Axiom lm_merge_def : forall (acc : list mono) (l1 : list mono) (l2 : list mono), lm_merge acc l1 l2 = (match l1 with | [] => cat_rev ([] : list mono) (lm_collapse acc l2) | cons x q => (match lm_dump x acc l2 with | (acc1, l21) => lm_merge (m_collapse acc1 x) q l21 end) end).
Theorem lm_merge_ok'vc (r : Z) (c : Z) (f : Z -> mat Z) (acc : list mono) (l1 : list mono) (l2 : list mono) (fact0 : 0%Z ≤ r) (fact1 : 0%Z ≤ c) (fact2 : lm_vld f r c acc) (fact3 : lm_vld f r c l1) (fact4 : lm_vld f r c l2) : (match l1 with | [] => ((lm_vld f r c acc ∧ lm_vld f r c l2) ∧ 0%Z ≤ r ∧ 0%Z ≤ c) ∧ (let o1 : list mono := lm_collapse acc l2 in lm_vld f r c o1 ∧ lm_mdl f r c o1 = add (lm_mdl f r c acc) (lm_mdl f r c l2) -> (lm_vld f r c ([] : list mono) ∧ lm_vld f r c o1) ∧ 0%Z ≤ r ∧ 0%Z ≤ c) | cons x q => ((0%Z ≤ r ∧ 0%Z ≤ c) ∧ lm_vld f r c acc ∧ lm_vld f r c l2) ∧ (let o1 : list mono * list mono := lm_dump x acc l2 in (match o1 with | (acc2, l21) => lm_vld f r c acc2 ∧ lm_vld f r c l21 ∧ add (lm_mdl f r c acc2) (lm_mdl f r c l21) = add (lm_mdl f r c acc) (lm_mdl f r c l2) end) -> (match o1 with | (acc1, l21) => ((lm_vld f r c acc1 ∧ l_vld f r c (m_prod x)) ∧ 0%Z ≤ r ∧ 0%Z ≤ c) ∧ (let o2 : list mono := m_collapse acc1 x in lm_vld f r c o2 ∧ lm_mdl f r c o2 = add (lm_mdl f r c acc1) (m_mdl f x) -> (match l1 with | [] => False | cons _ f1 => f1 = q end) ∧ (0%Z ≤ r ∧ 0%Z ≤ c ∧ lm_vld f r c o2) ∧ lm_vld f r c q ∧ lm_vld f r c l21) end)) end) ∧ (∀(result : list mono), (match l1 with | [] => (let o1 : list mono := lm_collapse acc l2 in (lm_vld f r c o1 ∧ lm_mdl f r c o1 = add (lm_mdl f r c acc) (lm_mdl f r c l2)) ∧ (let o2 : list mono := ([] : list mono) in result = cat_rev o2 o1 ∧ lm_vld f r c result ∧ lm_mdl f r c result = add (lm_mdl f r c o2) (lm_mdl f r c o1))) | cons x q => (let o1 : list mono * list mono := lm_dump x acc l2 in (match o1 with | (acc2, l21) => lm_vld f r c acc2 ∧ lm_vld f r c l21 ∧ add (lm_mdl f r c acc2) (lm_mdl f r c l21) = add (lm_mdl f r c acc) (lm_mdl f r c l2) end) ∧ (match o1 with | (acc1, l21) => (let o2 : list mono := m_collapse acc1 x in (lm_vld f r c o2 ∧ lm_mdl f r c o2 = add (lm_mdl f r c acc1) (m_mdl f x)) ∧ result = lm_merge o2 q l21 ∧ lm_vld f r c result ∧ lm_mdl f r c result = add (lm_mdl f r c o2) (add (lm_mdl f r c q) (lm_mdl f r c l21))) end)) end) -> (result = lm_merge acc l1 l2 ∧ lm_vld f r c result) ∧ lm_mdl f r c result = add (lm_mdl f r c acc) (add (lm_mdl f r c l1) (lm_mdl f r c l2))).
Proof.
Admitted.
