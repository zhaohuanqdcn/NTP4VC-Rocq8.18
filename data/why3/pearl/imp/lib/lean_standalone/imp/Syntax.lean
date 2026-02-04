namespace Syntax
axiom program_var : Type
axiom inhabited_axiom_program_var : Inhabited program_var
attribute [instance] inhabited_axiom_program_var
inductive expr where
  | Elit : ℤ -> expr
  | Evar : program_var -> expr
  | Esub : expr -> expr -> expr
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
inductive cmd where
  | Cskip : cmd
  | Cassign : program_var -> expr -> cmd
  | Cseq : cmd -> cmd -> cmd
  | Cif : expr -> cmd -> cmd -> cmd
  | Cwhile : expr -> cmd -> cmd
axiom inhabited_axiom_cmd : Inhabited cmd
attribute [instance] inhabited_axiom_cmd
end Syntax
