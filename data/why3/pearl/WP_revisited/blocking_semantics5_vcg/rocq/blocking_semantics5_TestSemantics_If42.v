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
Require Import WP_revisited.blocking_semantics5.Syntax.
Require Import WP_revisited.blocking_semantics5.SemOp.
Open Scope Z_scope.
Axiom x : ident.
Axiom y : mident.
Theorem If42 (sigma1 : mident -> value) (pi1 : list (ident * value)) (s : stmt) (sigma2 : mident -> value) (pi2 : list (ident * value)) (fact0 : one_step ((const : value -> mident -> value) (Vint 0%Z)) (cons (x, Vint 42%Z) ([] : list (ident * value))) (Sif (Tbin (Tderef y) Ole (Tvalue (Vint 10%Z))) (Sassign y (Tvalue (Vint 13%Z))) (Sassign y (Tvalue (Vint 42%Z)))) sigma1 pi1 s) (fact1 : one_step sigma1 pi1 s sigma2 pi2 Sskip) : sigma2 y = Vint 13%Z.
Admitted.
