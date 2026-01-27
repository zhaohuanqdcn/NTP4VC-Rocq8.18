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
Require Import WP_revisited.wp2.Imp.
Open Scope Z_scope.
Axiom set : Type.
Axiom set_inhabited : Inhabited set.
Global Existing Instance set_inhabited.
Axiom set_countable : Countable set.
Global Existing Instance set_countable.
Axiom to_fset : set -> gset Z.
Axiom mk : gset Z -> set.
Axiom mk'spec : forall  (s : gset Z), to_fset (mk s) = s.
Axiom choose1 : set -> Z.
Axiom choose'spec : forall  (s : set) (fact0 : ¬ to_fset s = ∅), choose1 s ∈ to_fset s.
Definition assigns (sigma : Z -> value) (a : gset Z) (sigma' : Z -> value) := ∀(i : Z), ¬ i ∈ a -> sigma i = sigma' i.
Theorem assigns_union_right'vc (sigma : Z -> value) (s2 : gset Z) (sigma' : Z -> value) (s1 : gset Z) (fact0 : assigns sigma s2 sigma') : assigns sigma (s1 ∪ s2) sigma'.
Admitted.
