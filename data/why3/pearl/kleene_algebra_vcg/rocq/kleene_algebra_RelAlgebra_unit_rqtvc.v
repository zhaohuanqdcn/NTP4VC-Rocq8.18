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
Theorem unit_r'vc (x : propset (a * a)) : infix_as x one = x.
Admitted.
