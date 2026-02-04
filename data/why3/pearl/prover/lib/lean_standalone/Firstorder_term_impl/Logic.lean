namespace Logic
mutual
noncomputable def nat_nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term v0) s1; s2
noncomputable def nat_nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> Nat.nat
  | (Types.nl_fo_term.NLFVar_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_fo_term.NL_App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_nlsize_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Logic.nat_nlsize_symbol v0) s1; s2
noncomputable def nlsize_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := nlsize_fo_term v0 + s1; s2
noncomputable def nlsize_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (1 : ℤ)
  | (Types.nl_fo_term.NL_App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := nlsize_fo_term_list v1 + s; let s2 : ℤ := Logic.nlsize_symbol v0 + s1; s2
end
axiom shiftb_fo_term :  {ty'b0 : Type} -> [Inhabited ty'b0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] -> (ℤ -> Spec.fo_term ty'b0 ty'b3) -> ℤ -> Spec.fo_term ty'b0 (Option ty'b3)
axiom shiftb_fo_term_definition {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] (bnd : ℤ -> Spec.fo_term ty'b0 ty'b3) (i : ℤ) : shiftb_fo_term bnd i = (if i = (0 : ℤ) then Spec.fo_term.Var_fo_term (Option.none : Option ty'b3) else Spec.rename_fo_term (bnd (i - (1 : ℤ))) Func.identity Funcs.some)
mutual
noncomputable def nlmodel_fo_term_list {ty'b0 : Type} {ty'c3 : Type} {ty'c0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'c3] [Inhabited ty'c0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ℤ -> Spec.symbol ty'c0) -> (ty'b3 -> Spec.fo_term ty'c0 ty'c3) -> (ℤ -> Spec.fo_term ty'c0 ty'c3) -> Spec.fo_term_list ty'c0 ty'c3
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3), fr0, bnd0, fr3, bnd3 => (Spec.fo_term_list.FONil : Spec.fo_term_list ty'c0 ty'c3)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1), fr0, bnd0, fr3, bnd3 => Spec.fo_term_list.FOCons (nlmodel_fo_term v0 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity)) (nlmodel_fo_term_list v1 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity))
noncomputable def nlmodel_fo_term {ty'b0 : Type} {ty'c3 : Type} {ty'c0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'c3] [Inhabited ty'c0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ℤ -> Spec.symbol ty'c0) -> (ty'b3 -> Spec.fo_term ty'c0 ty'c3) -> (ℤ -> Spec.fo_term ty'c0 ty'c3) -> Spec.fo_term ty'c0 ty'c3
  | (Types.nl_fo_term.NLFVar_fo_term v0), fr0, bnd0, fr3, bnd3 => fr3 v0
  | (Types.nl_fo_term.NLBruijn_fo_term v0), fr0, bnd0, fr3, bnd3 => bnd3 v0
  | (Types.nl_fo_term.NL_App v0 v1), fr0, bnd0, fr3, bnd3 => Spec.fo_term.App (Logic.nlmodel_symbol v0 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity)) (nlmodel_fo_term_list v1 (Spec.rename_subst_symbol fr0 Func.identity) (Spec.rename_subst_symbol bnd0 Func.identity) (Spec.rename_subst_fo_term fr3 Func.identity Func.identity) (Spec.rename_subst_fo_term bnd3 Func.identity Func.identity))
end
mutual
noncomputable def correct_indexes_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> Prop
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => True
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => correct_indexes_fo_term v0 ∧ correct_indexes_fo_term_list v1
noncomputable def correct_indexes_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> Prop
  | (Types.nl_fo_term.NLFVar_fo_term v0) => True
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (0 : ℤ) ≤ v0
  | (Types.nl_fo_term.NL_App v0 v1) => Logic.correct_indexes_symbol v0 ∧ correct_indexes_fo_term_list v1
end
mutual
noncomputable def bound_depth_of_symbol_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => (0 : ℤ)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let b : ℤ := bound_depth_of_symbol_in_fo_term v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_symbol_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_fo_term_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term_list ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term_list.NL_FONil : Types.nl_fo_term_list ty'b0 ty'b3) => (0 : ℤ)
  | (Types.nl_fo_term_list.NL_FOCons v0 v1) => let b : ℤ := bound_depth_of_fo_term_in_fo_term v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_fo_term_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_symbol_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NL_App v0 v1) => let b : ℤ := Logic.bound_depth_of_symbol_in_symbol v0; let a : ℤ := b; let b1 : ℤ := bound_depth_of_symbol_in_fo_term_list v1; let a1 : ℤ := (if b1 < a then a else b1); a1
noncomputable def bound_depth_of_fo_term_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : Types.nl_fo_term ty'b0 ty'b3 -> ℤ
  | (Types.nl_fo_term.NLFVar_fo_term v0) => (0 : ℤ)
  | (Types.nl_fo_term.NLBruijn_fo_term v0) => (1 : ℤ) + v0
  | (Types.nl_fo_term.NL_App v0 v1) => let b : ℤ := bound_depth_of_fo_term_in_fo_term_list v1; let a : ℤ := b; a
end
noncomputable def nlimpl_fo_term_list_ok (t : Types.nlimpl_fo_term_list) := nlmodel_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) Spec.subst_id_fo_term (Func.const (Spec.fo_term.Var_fo_term (-(1 : ℤ)))) = Types.nlimpl_fo_term_list.model_fo_term_list_field t ∧ correct_indexes_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) ∧ bound_depth_of_symbol_in_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) = (0 : ℤ) ∧ bound_depth_of_fo_term_in_fo_term_list (Types.nlimpl_fo_term_list.nlrepr_fo_term_list_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_fo_term_list x (Types.nlimpl_fo_term_list.model_fo_term_list_field t) → x < Types.nlimpl_fo_term_list.nlfree_var_symbol_set_abstraction_fo_term_list_field t) ∧ (∀(x : ℤ), Spec.is_fo_term_free_var_in_fo_term_list x (Types.nlimpl_fo_term_list.model_fo_term_list_field t) → x < Types.nlimpl_fo_term_list.nlfree_var_fo_term_set_abstraction_fo_term_list_field t)
noncomputable def nlimpl_fo_term_ok (t : Types.nlimpl_fo_term) := nlmodel_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) Spec.subst_id_fo_term (Func.const (Spec.fo_term.Var_fo_term (-(1 : ℤ)))) = Types.nlimpl_fo_term.model_fo_term_field t ∧ correct_indexes_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) ∧ bound_depth_of_symbol_in_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) = (0 : ℤ) ∧ bound_depth_of_fo_term_in_fo_term (Types.nlimpl_fo_term.nlrepr_fo_term_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_fo_term x (Types.nlimpl_fo_term.model_fo_term_field t) → x < Types.nlimpl_fo_term.nlfree_var_symbol_set_abstraction_fo_term_field t) ∧ (∀(x : ℤ), Spec.is_fo_term_free_var_in_fo_term x (Types.nlimpl_fo_term.model_fo_term_field t) → x < Types.nlimpl_fo_term.nlfree_var_fo_term_set_abstraction_fo_term_field t)
noncomputable def cons_ok_fo_term_list (c : Types.cons_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => True | Types.cons_fo_term_list.NLC_FOCons v0 v1 => nlimpl_fo_term_ok v0 ∧ nlimpl_fo_term_list_ok v1
noncomputable def cons_ok_fo_term (c : Types.cons_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => True | Types.cons_fo_term.NLC_App v0 v1 => Logic.nlimpl_symbol_ok v0 ∧ nlimpl_fo_term_list_ok v1
noncomputable def cons_rel_fo_term_list (c : Types.cons_fo_term_list) (t : Types.nlimpl_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => Types.nlimpl_fo_term_list.model_fo_term_list_field t = Spec.fo_term_list.FONil | Types.cons_fo_term_list.NLC_FOCons v0 v1 => Types.nlimpl_fo_term_list.model_fo_term_list_field t = Spec.fo_term_list.FOCons (Spec.rename_fo_term (Types.nlimpl_fo_term.model_fo_term_field v0) Func.identity Func.identity) (Spec.rename_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field v1) Func.identity Func.identity)
noncomputable def cons_rel_fo_term (c : Types.cons_fo_term) (t : Types.nlimpl_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.Var_fo_term v0 | Types.cons_fo_term.NLC_App v0 v1 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.App (Spec.rename_symbol (Types.nlimpl_symbol.model_symbol_field v0) Func.identity) (Spec.rename_fo_term_list (Types.nlimpl_fo_term_list.model_fo_term_list_field v1) Func.identity Func.identity)
noncomputable def cons_open_rel_fo_term_list (c : Types.cons_fo_term_list) (t : Types.nlimpl_fo_term_list) := match c with | Types.cons_fo_term_list.NLC_FONil => (match Types.nlimpl_fo_term_list.model_fo_term_list_field t with | Spec.fo_term_list.FONil => True | Spec.fo_term_list.FOCons w0 w1 => False) | Types.cons_fo_term_list.NLC_FOCons v0 v1 => (match Types.nlimpl_fo_term_list.model_fo_term_list_field t with | Spec.fo_term_list.FONil => False | Spec.fo_term_list.FOCons w0 w1 => Types.nlimpl_fo_term.model_fo_term_field v0 = Spec.rename_fo_term w0 Func.identity Func.identity ∧ Types.nlimpl_fo_term_list.model_fo_term_list_field v1 = Spec.rename_fo_term_list w1 Func.identity Func.identity)
noncomputable def cons_open_rel_fo_term (c : Types.cons_fo_term) (t : Types.nlimpl_fo_term) := match c with | Types.cons_fo_term.NLCVar_fo_term v0 => Types.nlimpl_fo_term.model_fo_term_field t = Spec.fo_term.Var_fo_term v0 | Types.cons_fo_term.NLC_App v0 v1 => (match Types.nlimpl_fo_term.model_fo_term_field t with | Spec.fo_term.Var_fo_term w0 => False | Spec.fo_term.App w0 w1 => Types.nlimpl_symbol.model_symbol_field v0 = Spec.rename_symbol w0 Func.identity ∧ Types.nlimpl_fo_term_list.model_fo_term_list_field v1 = Spec.rename_fo_term_list w1 Func.identity Func.identity)
end Logic
