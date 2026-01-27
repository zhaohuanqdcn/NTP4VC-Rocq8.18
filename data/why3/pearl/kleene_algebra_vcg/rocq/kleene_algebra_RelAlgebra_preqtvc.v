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
Axiom o1 : a -> a * a -> bool.
Axiom o2 : a -> a * a -> bool.
Axiom o3 : a * a -> a.
Axiom o'def : forall  (y : a) (p : a * a), (o1 y p = true) = (match p with | (_, a2) => a2 = y end).
Axiom o'def1 : forall  (y : a) (p : a * a), (o2 y p = true) = (match p with | (_, a2) => a2 = y end).
Axiom o'def2 : forall  (p : a * a), o3 p = (match p with | (a1, _) => a1 end).
Theorem pre'vc (x : a) (s : propset (a * a)) (y : a) : (x ∈ o3 <$> set_comprehension s (o2 y)) = ((x, y) ∈ s).
Admitted.
