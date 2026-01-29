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
Require Import Why3.map.Const.
Require Import Why3.map.MapExt.
Open Scope Z_scope.
Axiom a : Type.
Axiom a_inhabited : Inhabited a.
Global Existing Instance a_inhabited.
Axiom a_countable : Countable a.
Global Existing Instance a_countable.
Axiom t : Type.
Axiom t_inhabited : Inhabited t.
Global Existing Instance t_inhabited.
Axiom t_countable : Countable t.
Global Existing Instance t_countable.
Axiom fc : a -> a * a.
Axiom fc'def : forall  (a1 : a), fc a1 = (a1, a1).
Definition one : propset (a * a) := fc <$> (⊤ : propset a).
Axiom result : a * a -> a.
Axiom result1 : a -> a * a -> bool.
Axiom result'def : forall  (p : a * a), result p = (match p with | (_, a2) => a2 end).
Axiom result'def1 : forall  (x : a) (p : a * a), (result1 x p = true) = (match p with | (a1, _) => a1 = x end).
Definition post (s : propset (a * a)) (x : a) : propset a := result <$> set_comprehension s (result1 x).
Axiom post'spec : forall  (y : a) (s : propset (a * a)) (x : a), (y ∈ post s x) = ((x, y) ∈ s).
Axiom result2 : a * a -> a.
Axiom result3 : a -> a * a -> bool.
Axiom result'def2 : forall  (p : a * a), result2 p = (match p with | (a1, _) => a1 end).
Axiom result'def3 : forall  (y : a) (p : a * a), (result3 y p = true) = (match p with | (_, a2) => a2 = y end).
Definition pre (s : propset (a * a)) (y : a) : propset a := result2 <$> set_comprehension s (result3 y).
Axiom pre'spec : forall  (x : a) (s : propset (a * a)) (y : a), (x ∈ pre s y) = ((x, y) ∈ s).
Axiom infix_pl'spec : forall  (x : a * a) (s1 : propset (a * a)) (s2 : propset (a * a)), (x ∈ s1 ∪ s2) = (x ∈ s1 ∨ x ∈ s2).
Axiom result4 : propset (a * a) -> propset (a * a) -> a * a -> bool.
Axiom result'def4 : forall  (s1 : propset (a * a)) (s2 : propset (a * a)) (p : a * a), (result4 s1 s2 p = true) = (match p with | (a1, a2) => ¬ post s1 a1 ## pre s2 a2 end).
Definition infix_as (s1 : propset (a * a)) (s2 : propset (a * a)) : propset (a * a) := set_comprehension (⊤ : propset (a * a)) (result4 s1 s2).
Axiom infix_as'spec : forall  (a1 : a) (a2 : a) (s1 : propset (a * a)) (s2 : propset (a * a)), ((a1, a2) ∈ infix_as s1 s2) = (∃(x : a), (a1, x) ∈ s1 ∧ (x, a2) ∈ s2).
Axiom Assoc : forall  (x : propset (a * a)) (y : propset (a * a)) (z : propset (a * a)), x ∪ y ∪ z = x ∪ (y ∪ z).
Axiom Unit_def_l : forall  (x : propset (a * a)), (∅ : propset (a * a)) ∪ x = x.
Axiom Unit_def_r : forall  (x : propset (a * a)), x ∪ (∅ : propset (a * a)) = x.
Axiom Comm : forall  (x : propset (a * a)) (y : propset (a * a)), x ∪ y = y ∪ x.
Axiom Assoc1 : forall  (x : propset (a * a)) (y : propset (a * a)) (z : propset (a * a)), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Unit_def_l1 : forall  (x : propset (a * a)), infix_as one x = x.
Axiom Unit_def_r1 : forall  (x : propset (a * a)), infix_as x one = x.
Axiom Mul_zero_l : forall  (x : propset (a * a)), infix_as (∅ : propset (a * a)) x = (∅ : propset (a * a)).
Axiom Mul_zero_r : forall  (x : propset (a * a)), infix_as x (∅ : propset (a * a)) = (∅ : propset (a * a)).
Axiom Mul_distr_l : forall  (x : propset (a * a)) (y : propset (a * a)) (z : propset (a * a)), infix_as x (y ∪ z) = infix_as x y ∪ infix_as x z.
Axiom Mul_distr_r : forall  (y : propset (a * a)) (z : propset (a * a)) (x : propset (a * a)), infix_as (y ∪ z) x = infix_as y x ∪ infix_as z x.
Axiom infix_cf : propset (a * a) -> Z -> propset (a * a).
Axiom infix_cf'def : forall  (n : Z) (x : propset (a * a)) (fact0 : 0%Z ≤ n), if decide (n = 0%Z) then infix_cf x n = one else infix_cf x n = infix_as x (infix_cf x (n - 1%Z)).
Axiom Assoc2 : forall  (x : propset (a * a)) (y : propset (a * a)) (z : propset (a * a)), infix_as (infix_as x y) z = infix_as x (infix_as y z).
Axiom Unit_def_l2 : forall  (x : propset (a * a)), infix_as one x = x.
Axiom Unit_def_r2 : forall  (x : propset (a * a)), infix_as x one = x.
Axiom Power_0 : forall  (x : propset (a * a)), infix_cf x 0%Z = one.
Axiom Power_s : forall  (n : Z) (x : propset (a * a)) (fact0 : 0%Z ≤ n), infix_cf x (n + 1%Z) = infix_as x (infix_cf x n).
Axiom Power_s_alt : forall  (n : Z) (x : propset (a * a)) (fact0 : 0%Z < n), infix_cf x n = infix_as x (infix_cf x (n - 1%Z)).
Axiom Power_1 : forall  (x : propset (a * a)), infix_cf x 1%Z = x.
Axiom Power_sum : forall  (n : Z) (m : Z) (x : propset (a * a)) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), infix_cf x (n + m) = infix_as (infix_cf x n) (infix_cf x m).
Axiom Power_mult : forall  (n : Z) (m : Z) (x : propset (a * a)) (fact0 : 0%Z ≤ n) (fact1 : 0%Z ≤ m), infix_cf x (n * m) = infix_cf (infix_cf x n) m.
Axiom Power_comm1 : forall  (x : propset (a * a)) (y : propset (a * a)) (n : Z) (fact0 : infix_as x y = infix_as y x) (fact1 : 0%Z ≤ n), infix_as (infix_cf x n) y = infix_as y (infix_cf x n).
Axiom Power_comm2 : forall  (x : propset (a * a)) (y : propset (a * a)) (n : Z) (fact0 : infix_as x y = infix_as y x) (fact1 : 0%Z ≤ n), infix_cf (infix_as x y) n = infix_as (infix_cf x n) (infix_cf y n).
Axiom Idem : forall  (x : propset (a * a)), x ∪ x = x.
Definition infix_lseq (x : propset (a * a)) (y : propset (a * a)) := x ∪ y = y.
Inductive in_star : propset (a * a) -> a * a -> Prop :=
 | Star_0 (s : propset (a * a)) (x : a) : in_star s (x, x)
 | Star_s (s : propset (a * a)) (x : a) (y : a) (z : a) : in_star s (x, y) -> (y, z) ∈ s -> in_star s (x, z).
Axiom in_star_closure : propset (a * a) -> a * a -> bool.
Axiom in_star_closure_def : forall  (y : propset (a * a)) (y1 : a * a), (in_star_closure y y1 = true) = in_star y y1.
Definition prefix_ex (s : propset (a * a)) : propset (a * a) := set_comprehension (⊤ : propset (a * a)) (in_star_closure s).
Theorem star_induct_left_ind'vc (i : Z) (z : propset (a * a)) (x : propset (a * a)) (y : propset (a * a)) (fact0 : 0%Z ≤ i) (fact1 : infix_lseq (z ∪ infix_as x y) y) : infix_lseq (infix_as (infix_cf x i) z) y.
Proof.
Admitted.
