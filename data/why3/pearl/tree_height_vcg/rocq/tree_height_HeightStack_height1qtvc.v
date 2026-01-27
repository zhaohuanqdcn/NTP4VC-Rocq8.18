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
Require Import Why3.bintree.Tree.
Require Import Why3.bintree.Size.
Require Import Why3.bintree.Height.
Open Scope Z_scope.
Axiom stack : Type -> Type.
Axiom stack_inhabited : forall  {α : Type} `{Inhabited α}, Inhabited (stack α).
Global Existing Instance stack_inhabited.
Program Fixpoint heights {α : Type} `{Inhabited α} (s : list (Z * tree α)) : Z :=
match s with | [] => 0%Z | cons (h, t) s' => Z.max (h + height t) (heights s') end.
Admit Obligations.
Program Fixpoint sizes {α : Type} `{Inhabited α} (s : list (Z * tree α)) : Z :=
match s with | [] => 0%Z | cons (_, t) s' => Size.size t + sizes s' end.
Admit Obligations.
Theorem height1'vc {α : Type} `{Inhabited α} (t : tree α) : 0%Z ≤ 0%Z ∧ Z.max 0%Z (heights (cons (0%Z, t) ([] : list (Z * tree α)))) = height t.
Admitted.
