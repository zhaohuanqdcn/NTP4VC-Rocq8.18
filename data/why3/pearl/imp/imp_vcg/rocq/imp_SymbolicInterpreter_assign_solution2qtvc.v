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
Require Import imp.imp.ConcreteSemantics.
Require Import imp.imp.Svar.
Require Import imp.imp.Constraint.
Require Import imp.imp.SymState.
Require Import imp.imp.FreshSvar.
Require Import imp.imp.SymStateSet.
Open Scope Z_scope.
Axiom compose : (svar -> Z) -> t -> program_var -> option Z.
Axiom compose'def : forall  (rho : svar -> Z) (sigma : t) (x : program_var), compose rho sigma x = (match get sigma x with | Some v => Some (rho v) | None => None end).
Definition state_extends (s : sym_state) (s' : sym_state) := Svar.to_fset (vars s) ⊆ Svar.to_fset (vars s') ∧ (∀(v : svar), v ∈ Svar.to_fset (vars s) -> SymState.rho s v = SymState.rho s' v).
Axiom svar_set_add : svar -> Svar.set -> Svar.set.
Axiom svar_set_add'def : forall  (v : svar) (vs : Svar.set), Svar.to_fset (svar_set_add v vs) = insert_set v (Svar.to_fset vs) ∧ (if decide (v ∈ Svar.to_fset vs) then size (Svar.to_fset (svar_set_add v vs)) = size (Svar.to_fset vs) else Z.of_nat (size (Svar.to_fset (svar_set_add v vs))) = Z.of_nat (size (Svar.to_fset vs)) + 1%Z).
Definition results_extend (s : sym_state) (normals : gset sym_state) (unbounds : gset sym_state) (limits : gset sym_state) := ∀(s' : sym_state), s' ∈ normals ∨ s' ∈ unbounds ∨ s' ∈ limits -> state_extends s s'.
Theorem assign_solution2'vc (v' : svar) (s : sym_state) (se : symbolic_expr) (v : svar) (fact0 : is_fresh v' (Svar.to_fset (vars s))) (fact1 : is_fresh v' (vars_in_symbolic_expr se)) (fact2 : is_solution (SymState.rho s) (SymState.constr s)) : is_solution (fun_updt (SymState.rho s) v' (interp_symbolic_expr (SymState.rho s) se)) (Cexists v (Cconj (SymState.constr s) (Ceq (Svar v') se))).
Admitted.
