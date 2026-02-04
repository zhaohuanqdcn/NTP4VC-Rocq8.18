import Why3.Base
import pearl.imp.lib.lean.imp.Syntax
import pearl.imp.lib.lean.imp.Svar
import pearl.imp.lib.lean.imp.Constraint
open Classical
open Lean4Why3
namespace SymState
axiom sym_state : Type
axiom inhabited_axiom_sym_state : Inhabited sym_state
attribute [instance] inhabited_axiom_sym_state
axiom sigma : sym_state -> Constraint.t
axiom constr : sym_state -> Constraint.constr
axiom rho : sym_state -> Svar.svar -> ℤ
axiom vars : sym_state -> Svar.set
axiom sym_state'invariant (self : sym_state) : Constraint.vars_in_constraint (constr self) ⊆ Svar.to_fset (vars self) ∧ (∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get (sigma self) x = Option.some v → v ∈ Svar.to_fset (vars self))
noncomputable def sym_state'eq (a : sym_state) (b : sym_state) := sigma a = sigma b ∧ constr a = constr b ∧ rho a = rho b ∧ vars a = vars b
axiom sym_state'inj (a : sym_state) (b : sym_state) (fact0 : sym_state'eq a b) : a = b
axiom eq : sym_state -> sym_state -> Prop
axiom eq'spec (s1 : sym_state) (s2 : sym_state) : eq s1 s2 = (s1 = s2)
axiom mk_sym_state : Constraint.t -> Constraint.constr -> Svar.set -> (Svar.svar -> ℤ) -> sym_state
axiom mk_sym_state'spec'2 (constr1 : Constraint.constr) (vars1 : Svar.set) (sigma1 : Constraint.t) (rho1 : Svar.svar -> ℤ) (fact0 : Constraint.vars_in_constraint constr1 ⊆ Svar.to_fset vars1) (fact1 : ∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get sigma1 x = Option.some v → v ∈ Svar.to_fset vars1) : sigma (mk_sym_state sigma1 constr1 vars1 rho1) = sigma1
axiom mk_sym_state'spec'1 (constr1 : Constraint.constr) (vars1 : Svar.set) (sigma1 : Constraint.t) (rho1 : Svar.svar -> ℤ) (fact0 : Constraint.vars_in_constraint constr1 ⊆ Svar.to_fset vars1) (fact1 : ∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get sigma1 x = Option.some v → v ∈ Svar.to_fset vars1) : constr (mk_sym_state sigma1 constr1 vars1 rho1) = constr1
axiom mk_sym_state'spec'0 (constr1 : Constraint.constr) (vars1 : Svar.set) (sigma1 : Constraint.t) (rho1 : Svar.svar -> ℤ) (fact0 : Constraint.vars_in_constraint constr1 ⊆ Svar.to_fset vars1) (fact1 : ∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get sigma1 x = Option.some v → v ∈ Svar.to_fset vars1) : vars (mk_sym_state sigma1 constr1 vars1 rho1) = vars1
axiom mk_sym_state'spec (constr1 : Constraint.constr) (vars1 : Svar.set) (sigma1 : Constraint.t) (rho1 : Svar.svar -> ℤ) (fact0 : Constraint.vars_in_constraint constr1 ⊆ Svar.to_fset vars1) (fact1 : ∀(x : Syntax.program_var) (v : Svar.svar), Constraint.get sigma1 x = Option.some v → v ∈ Svar.to_fset vars1) : rho (mk_sym_state sigma1 constr1 vars1 rho1) = rho1
end SymState
