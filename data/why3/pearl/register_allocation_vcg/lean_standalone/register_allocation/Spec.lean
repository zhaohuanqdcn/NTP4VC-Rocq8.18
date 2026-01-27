namespace Spec
axiom addr : Type
axiom inhabited_axiom_addr : Inhabited addr
attribute [instance] inhabited_axiom_addr
inductive expr where
  | Evar : addr -> expr
  | Eneg : expr -> expr
  | Eadd : expr -> expr -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
axiom memory : Type
axiom inhabited_axiom_memory : Inhabited memory
attribute [instance] inhabited_axiom_memory
noncomputable def eval : (addr -> ℤ) -> expr -> ℤ
  | m, (expr.Evar x) => m x
  | m, (expr.Eneg e1) => -eval m e1
  | m, (expr.Eadd e1 e2) => eval m e1 + eval m e2
axiom register : Type
axiom inhabited_axiom_register : Inhabited register
attribute [instance] inhabited_axiom_register
inductive instr where
  | Iload : addr -> ℤ -> instr
  | Ineg : ℤ -> instr
  | Iadd : ℤ -> ℤ -> instr
  | Ipush : ℤ -> instr
  | Ipop : ℤ -> instr
axiom inhabited_axiom_instr : Inhabited instr
attribute [instance] inhabited_axiom_instr
axiom registers : Type
axiom inhabited_axiom_registers : Inhabited registers
attribute [instance] inhabited_axiom_registers
axiom update : (ℤ -> ℤ) -> ℤ -> ℤ -> ℤ -> ℤ
axiom update'def (reg1 : ℤ -> ℤ) (r : ℤ) (v : ℤ) (r' : ℤ) : update reg1 r v r' = (if r' = r then v else reg1 r')
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
structure state where
  mem : addr -> ℤ
  reg : ℤ -> ℤ
  st : List ℤ
axiom inhabited_axiom_state : Inhabited state
attribute [instance] inhabited_axiom_state
noncomputable def exec (i : instr) (s : state) := match i with | instr.Iload x r => state.mk (state.mem s) (update (state.reg s) r (state.mem s x)) (state.st s) | instr.Ineg r => state.mk (state.mem s) (update (state.reg s) r (-state.reg s r)) (state.st s) | instr.Iadd r1 r2 => state.mk (state.mem s) (update (state.reg s) r2 (state.reg s r1 + state.reg s r2)) (state.st s) | instr.Ipush r => state.mk (state.mem s) (state.reg s) (List.cons (state.reg s r) (state.st s)) | instr.Ipop r => (match state.st s with | ([] : List ℤ) => s | List.cons v st1 => state.mk (state.mem s) (update (state.reg s) r v) st1)
axiom code : Type
axiom inhabited_axiom_code : Inhabited code
attribute [instance] inhabited_axiom_code
noncomputable def exec_list : List instr -> state -> state
  | ([] : List instr), s => s
  | (List.cons i l), s => exec_list l (exec i s)
axiom expr_post : expr -> ℤ -> state -> state -> Bool
axiom expr_post'def (e : expr) (r : ℤ) (s : state) (s' : state) : (expr_post e r s s' = true) = (state.mem s' = state.mem s ∧ state.reg s' r = eval (state.mem s) e ∧ state.st s' = state.st s ∧ (∀(r' : ℤ), r' < r → state.reg s' r' = state.reg s r'))
end Spec
