From Stdlib Require Import Strings.String.
Require Import String Ascii.
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
Require Import Why3.Base.
Require Import Why3.why3.Ref.Ref.
Require Import Why3.mach.c.C.
Require Import Why3.mach.int.Unsigned.
Open Scope Z_scope.
Axiom cast_mem : Type.
Axiom cast_mem_inhabited : Inhabited cast_mem.
Global Existing Instance cast_mem_inhabited.
Axiom cast_mem_countable : Countable cast_mem.
Global Existing Instance cast_mem_countable.
Axiom mi : cast_mem -> Z.
Axiom ma : cast_mem -> Z.
Axiom z : cast_mem -> zone.
Axiom l : cast_mem -> Z.
Axiom ok : cast_mem -> bool.
