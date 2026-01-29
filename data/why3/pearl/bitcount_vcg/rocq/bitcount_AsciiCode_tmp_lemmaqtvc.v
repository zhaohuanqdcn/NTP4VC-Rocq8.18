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
Require Import Why3.why3.WellFounded.WellFounded.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.int.NumOf.
Require Import bitcount_vcg.bitcount.BitCounting32.
Require Import bitcount_vcg.bitcount.Hamming.
Require Import Why3.mach.bv.BVCheck32.
Open Scope Z_scope.
Definition validAscii (b : bv 32%N) := Z.Even (count_logic b).
Axiom fun_or : forall {α : Type} `{Inhabited α}, (α -> bool) -> (α -> bool) -> α -> bool.
Axiom fun_or'def : forall  {α : Type} `{Inhabited α} (f : α -> bool) (g : α -> bool) (x : α), (fun_or f g x = true) = (f x = true ∨ g x = true).
Axiom nth_closure : bv 32%N -> Z -> bool.
Axiom nth_diff_closure : bv 32%N -> bv 32%N -> Z -> bool.
Theorem tmp_lemma'vc (i : Z) (j : Z) (a : bv 32%N) (b : bv 32%N) (fact0 : i < j) : (Z.Even (numof (nth_closure a) i j) ∧ Z.Odd (numof (nth_closure b) i j) ∨ Z.Odd (numof (nth_closure a) i j) ∧ Z.Even (numof (nth_closure b) i j)) = Z.Odd (numof (nth_diff_closure a b) i j).
Proof.
Admitted.
