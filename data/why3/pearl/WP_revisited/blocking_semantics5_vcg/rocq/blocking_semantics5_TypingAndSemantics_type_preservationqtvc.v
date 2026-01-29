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
Require Import WP_revisited.blocking_semantics5.Syntax.
Require Import WP_revisited.blocking_semantics5.SemOp.
Require Import WP_revisited.blocking_semantics5.Typing.
Open Scope Z_scope.
Definition compatible_env (sigma : mident -> value) (sigmat : mident -> datatype) (pi : list (ident * value)) (pit : list (ident * datatype)) := (∀(id1 : mident), type_value (sigma id1) = sigmat id1) ∧ (∀(id1 : ident), type_value (get_stack id1 pi) = get_vartype id1 pit).
Theorem type_preservation'vc (sigmat : mident -> datatype) (pit : list (ident * datatype)) (s1 : stmt) (sigma1 : mident -> value) (pi1 : list (ident * value)) (sigma2 : mident -> value) (pi2 : list (ident * value)) (s2 : stmt) (fact0 : type_stmt sigmat pit s1) (fact1 : compatible_env sigma1 sigmat pi1 pit) (fact2 : one_step sigma1 pi1 s1 sigma2 pi2 s2) : type_stmt sigmat pit s2 ∧ compatible_env sigma2 sigmat pi2 pit.
Proof.
Admitted.
