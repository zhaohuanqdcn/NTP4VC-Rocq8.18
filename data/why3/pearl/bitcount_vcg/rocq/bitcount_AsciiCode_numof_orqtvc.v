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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Require Import bitcount_vcg.bitcount.BitCounting32.
Require Import Why3.mach.bv.BVCheck32.
Open Scope Z_scope.
Definition validAscii (b : bv 32%N) := Z.Even (count_logic b).
Axiom fun_or : forall {α : Type} `{Inhabited α}, (α -> bool) -> (α -> bool) -> α -> bool.
Axiom fun_or'def : forall  {α : Type} `{Inhabited α} (f : α -> bool) (g : α -> bool) (x : α), (fun_or f g x = true) = (f x = true ∨ g x = true).
Theorem numof_or'vc (a : Z) (b : Z) (p : Z -> bool) (q : Z -> bool) (fact0 : ∀(i : Z), a ≤ i ∧ i < b -> ¬ p i = true ∨ ¬ q i = true) : numof (fun_or p q) a b = numof p a b + numof q a b.
Admitted.
