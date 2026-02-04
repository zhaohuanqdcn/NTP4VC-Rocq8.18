import Why3.Base
open Classical
open Lean4Why3
namespace Syntax
inductive datatype where
  | TYunit : datatype
  | TYint : datatype
  | TYbool : datatype
axiom inhabited_axiom_datatype : Inhabited datatype
attribute [instance] inhabited_axiom_datatype
inductive value where
  | Vvoid : value
  | Vint : ℤ -> value
  | Vbool : Bool -> value
axiom inhabited_axiom_value : Inhabited value
attribute [instance] inhabited_axiom_value
inductive operator where
  | Oplus : operator
  | Ominus : operator
  | Omult : operator
  | Ole : operator
axiom inhabited_axiom_operator : Inhabited operator
attribute [instance] inhabited_axiom_operator
axiom mident : Type
axiom inhabited_axiom_mident : Inhabited mident
attribute [instance] inhabited_axiom_mident
axiom ident : Type
axiom inhabited_axiom_ident : Inhabited ident
attribute [instance] inhabited_axiom_ident
inductive term where
  | Tvalue : value -> term
  | Tvar : ident -> term
  | Tderef : mident -> term
  | Tbin : term -> operator -> term -> term
axiom inhabited_axiom_term : Inhabited term
attribute [instance] inhabited_axiom_term
inductive fmla where
  | Fterm : term -> fmla
  | Fand : fmla -> fmla -> fmla
  | Fnot : fmla -> fmla
  | Fimplies : fmla -> fmla -> fmla
  | Flet : ident -> term -> fmla -> fmla
  | Fforall : ident -> datatype -> fmla -> fmla
axiom inhabited_axiom_fmla : Inhabited fmla
attribute [instance] inhabited_axiom_fmla
inductive stmt where
  | Sskip : stmt
  | Sassign : mident -> term -> stmt
  | Sseq : stmt -> stmt -> stmt
  | Sif : term -> stmt -> stmt -> stmt
  | Sassert : fmla -> stmt
  | Swhile : term -> fmla -> stmt -> stmt
axiom inhabited_axiom_stmt : Inhabited stmt
attribute [instance] inhabited_axiom_stmt
end Syntax
