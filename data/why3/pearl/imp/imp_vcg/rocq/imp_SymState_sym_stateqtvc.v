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
Require Import imp.imp.Syntax.
Require Import imp.imp.Svar.
Require Import imp.imp.Constraint.
Open Scope Z_scope.
Theorem sym_state'vc (o1 : Svar.set) (fact0 : to_fset o1 = (∅ : gset svar)) (fact1 : Z.of_nat (size (to_fset o1)) = 0%Z) : let constr : Constraint.constr := Ctrue in vars_in_constraint constr ⊆ to_fset o1 ∧ (vars_in_constraint constr ⊆ to_fset o1 -> (∀(x : program_var) (v : svar), get empty x = Some v -> v ∈ to_fset o1)).
Admitted.
