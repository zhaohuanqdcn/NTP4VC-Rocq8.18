import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.Svar
open Classical
open Lean4Why3
namespace Constraint
axiom model : Type
axiom inhabited_axiom_model : Inhabited model
attribute [instance] inhabited_axiom_model
axiom t : Type
axiom inhabited_axiom_t : Inhabited t
attribute [instance] inhabited_axiom_t
axiom model1 : t -> Syntax.program_var -> Option Svar.svar
axiom empty : t
axiom empty1 (k : Syntax.program_var) : model1 empty k = Option.none
noncomputable def get (d : t) (k : Syntax.program_var) := model1 d k
axiom set : t -> Syntax.program_var -> Svar.svar -> t
axiom set'spec'0 (d : t) (k : Syntax.program_var) (v : Svar.svar) : get (set d k v) k = Option.some v
axiom set'spec (k' : Syntax.program_var) (k : Syntax.program_var) (d : t) (v : Svar.svar) (fact0 : ¬k' = k) : get (set d k v) k' = get d k'
axiom rho : Type
axiom inhabited_axiom_rho : Inhabited rho
attribute [instance] inhabited_axiom_rho
inductive symbolic_expr where
  | Slit : ℤ -> symbolic_expr
  | Svar : Svar.svar -> symbolic_expr
  | Ssub : symbolic_expr -> symbolic_expr -> symbolic_expr
axiom inhabited_axiom_symbolic_expr : Inhabited symbolic_expr
attribute [instance] inhabited_axiom_symbolic_expr
noncomputable def interp_symbolic_expr : (Svar.svar -> ℤ) -> symbolic_expr -> ℤ
  | rho1, (symbolic_expr.Slit n) => n
  | rho1, (symbolic_expr.Svar v) => rho1 v
  | rho1, (symbolic_expr.Ssub e1 e2) => interp_symbolic_expr rho1 e1 - interp_symbolic_expr rho1 e2
inductive constr where
  | Ctrue : constr
  | Cfalse : constr
  | Ceq : symbolic_expr -> symbolic_expr -> constr
  | Cneq : symbolic_expr -> symbolic_expr -> constr
  | Cconj : constr -> constr -> constr
  | Cexists : Svar.svar -> constr -> constr
axiom inhabited_axiom_constr : Inhabited constr
attribute [instance] inhabited_axiom_constr
noncomputable def is_solution : (Svar.svar -> ℤ) -> constr -> Prop
  | rho1, constr.Ctrue => True
  | rho1, constr.Cfalse => False
  | rho1, (constr.Ceq e1 e2) => interp_symbolic_expr rho1 e1 = interp_symbolic_expr rho1 e2
  | rho1, (constr.Cneq e1 e2) => ¬interp_symbolic_expr rho1 e1 = interp_symbolic_expr rho1 e2
  | rho1, (constr.Cconj c1 c2) => is_solution rho1 c1 ∧ is_solution rho1 c2
  | rho1, (constr.Cexists x c1) => is_solution rho1 c1
noncomputable def vars_in_symbolic_expr : symbolic_expr -> Finset Svar.svar
  | (symbolic_expr.Slit x) => (∅ : Finset Svar.svar)
  | (symbolic_expr.Svar v) => insert v (∅ : Finset Svar.svar)
  | (symbolic_expr.Ssub e1 e2) => vars_in_symbolic_expr e1 ∪ vars_in_symbolic_expr e2
noncomputable def vars_in_constraint : constr -> Finset Svar.svar
  | constr.Ctrue => (∅ : Finset Svar.svar)
  | constr.Cfalse => (∅ : Finset Svar.svar)
  | (constr.Ceq e1 e2) => vars_in_symbolic_expr e1 ∪ vars_in_symbolic_expr e2
  | (constr.Cneq e1 e2) => vars_in_symbolic_expr e1 ∪ vars_in_symbolic_expr e2
  | (constr.Cconj c1 c2) => vars_in_constraint c1 ∪ vars_in_constraint c2
  | (constr.Cexists v c1) => insert v (vars_in_constraint c1)
noncomputable def existential_vars_in_constraint : constr -> Finset Svar.svar
  | constr.Ctrue => (∅ : Finset Svar.svar)
  | constr.Cfalse => (∅ : Finset Svar.svar)
  | (constr.Ceq e1 e2) => vars_in_symbolic_expr e1 ∪ vars_in_symbolic_expr e2
  | (constr.Cneq e1 e2) => vars_in_symbolic_expr e1 ∪ vars_in_symbolic_expr e2
  | (constr.Cconj c1 c2) => existential_vars_in_constraint c1 ∪ existential_vars_in_constraint c2
  | (constr.Cexists v c1) => Finset.erase (existential_vars_in_constraint c1) v
noncomputable def free_vars_in_constraint (c : constr) := vars_in_constraint c \ existential_vars_in_constraint c
noncomputable def entails (c1 : constr) (c2 : constr) := ∀(rho1 : Svar.svar -> ℤ), is_solution rho1 c1 → is_solution rho1 c2
end Constraint
