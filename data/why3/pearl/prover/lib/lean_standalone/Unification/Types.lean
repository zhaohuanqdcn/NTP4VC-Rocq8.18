namespace Config
end Config
namespace Func
noncomputable def extensionalEqual {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) := ∀(x : α), f x = g x
axiom functionExtensionality {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (g : α -> β) (fact0 : extensionalEqual f g) : f = g
axiom update :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> α -> β -> α -> β
axiom update_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : α) (y : β) (z : α) : update f x y z = (if x = z then y else f z)
axiom identity :  {α : Type} -> [Inhabited α] -> α -> α
axiom identity_def {α : Type} [Inhabited α] (x : α) : identity x = x
axiom compose :  {γ : Type} -> [Inhabited γ] ->  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> γ) -> (α -> β) -> α -> γ
axiom compose_def {γ : Type} {β : Type} {α : Type} [Inhabited γ] [Inhabited β] [Inhabited α] (g : β -> γ) (f : α -> β) (x : α) : compose g f x = g (f x)
axiom const :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> β -> α -> β
axiom const_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (x : β) (z : α) : (const : β -> α -> β) x z = x
end Func
namespace Pred
noncomputable def predExtensionalEqual {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) := ∀(x : α), (p x = true) = (q x = true)
axiom predicateExtensionality {α : Type} [Inhabited α] (p : α -> Bool) (q : α -> Bool) (fact0 : predExtensionalEqual p q) : p = q
noncomputable def evalp {α : Type} [Inhabited α] (p : α -> Bool) (x : α) := p x = true
axiom pupdate :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α -> Bool -> α -> Bool
axiom pupdate_def {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (y : Bool) (z : α) : (pupdate p x y z = true) = (if x = z then y = true else p z = true)
axiom pcompose :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (β -> Bool) -> (α -> β) -> α -> Bool
axiom pcompose_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (p : β -> Bool) (f : α -> β) (x : α) : (pcompose p f x = true) = (p (f x) = true)
axiom pfalse :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom pfalse_def {α : Type} [Inhabited α] (x : α) : ¬pfalse x = true
axiom ptrue :  {α : Type} -> [Inhabited α] -> α -> Bool
axiom ptrue_def {α : Type} [Inhabited α] (x : α) : ptrue x = true
end Pred
namespace Types
structure timestamp (α : Type) where
  time : ℤ
  size : ℤ
  table : ℤ -> List α
axiom inhabited_axiom_timestamp {α : Type} [Inhabited α] : Inhabited (timestamp α)
attribute [instance] inhabited_axiom_timestamp
structure t (α : Type) where
  history : List ℤ
  current_time : ℤ
  buffer : List (List α)
  inv : α -> Bool
axiom inhabited_axiom_t {α : Type} [Inhabited α] : Inhabited (t α)
attribute [instance] inhabited_axiom_t
end Types
namespace Choice
axiom default :  {α : Type} -> [Inhabited α] -> α
axiom choice :  {α : Type} -> [Inhabited α] -> (α -> Bool) -> α
axiom choice_behaviour {α : Type} [Inhabited α] (p : α -> Bool) (x : α) (fact0 : p x = true) : p (choice p) = true
end Choice
namespace Logic
axiom func_of_array :  {α : Type} -> [Inhabited α] -> List α -> α -> ℤ -> α
axiom func_of_array_def {α : Type} [Inhabited α] (a : List α) (def1 : α) (x : ℤ) : func_of_array a def1 x = (if (0 : ℤ) ≤ x ∧ x < Int.ofNat (List.length a) then (getElem! a ∘ Int.toNat) x else def1)
noncomputable def current_timestamp {α : Type} [Inhabited α] (x : Types.t α) := Types.timestamp.mk (Types.t.current_time x) (Int.ofNat (List.length (Types.t.buffer x))) (func_of_array (Types.t.buffer x) ([] : List α))
noncomputable def correct_table {α : Type} [Inhabited α] (sz : ℤ) (b : ℤ -> List α) := ∀(x : ℤ), sz ≤ x ∨ x < (0 : ℤ) → b x = ([] : List α)
noncomputable def pop {α : Type} [Inhabited α] (l : List α) := match l with | ([] : List α) => (Choice.default : List α) | List.cons x_x q => q
noncomputable def unroll {α : Type} [Inhabited α] : ℤ -> ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Types.timestamp α
  | tm, t0, h, b, sz => if tm = (0 : ℤ) then Types.timestamp.mk t0 sz b else match h with | ([] : List ℤ) => Types.timestamp.mk (t0 + tm) sz b | List.cons x q => (if x = -(1 : ℤ) then unroll (tm - (1 : ℤ)) t0 q b (Int.tdiv sz (2 : ℤ)) else unroll (tm - (1 : ℤ)) t0 q (Func.update b x (pop (b x))) sz)
noncomputable def unroll_correct {α : Type} [Inhabited α] : ℤ -> List ℤ -> (ℤ -> List α) -> ℤ -> Prop
  | tm, ([] : List ℤ), b, sz => tm = (0 : ℤ)
  | tm, (List.cons x q), b, sz => if x = -(1 : ℤ) then let s0 : ℤ := Int.tdiv sz (2 : ℤ); s0 * (2 : ℤ) = sz ∧ unroll_correct (tm - (1 : ℤ)) q b s0 ∧ (∀(i : ℤ), s0 ≤ i ∨ i < (0 : ℤ) → b i = ([] : List α)) else ¬b x = ([] : List α) ∧ ((0 : ℤ) ≤ x ∧ x < sz) ∧ unroll_correct (tm - (1 : ℤ)) q (Func.update b x (pop (b x))) sz
noncomputable def past_time {α : Type} [Inhabited α] (t : Types.timestamp α) (tb : Types.t α) := Types.timestamp.time t ≤ Types.t.current_time tb ∧ unroll (Types.t.current_time tb - Types.timestamp.time t) (Types.timestamp.time t) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb))) = t
noncomputable def precede {α : Type} [Inhabited α] (tb1 : Types.t α) (tb2 : Types.t α) := ∀(t : Types.timestamp α), past_time t tb1 → past_time t tb2
noncomputable def before {α : Type} [Inhabited α] (t1 : Types.timestamp α) (t2 : Types.timestamp α) := Types.timestamp.time t1 ≤ Types.timestamp.time t2
noncomputable def list_forall {α : Type} [Inhabited α] : (α -> Bool) -> List α -> Prop
  | p, ([] : List α) => True
  | p, (List.cons x q) => p x = true ∧ list_forall p q
noncomputable def correct {α : Type} [Inhabited α] (tb : Types.t α) := (∀(t : Types.timestamp α), past_time t tb → (0 : ℤ) < Types.timestamp.size t) ∧ (∀(t : Types.timestamp α) (i : ℤ), past_time t tb ∧ (0 : ℤ) ≤ i → list_forall (Types.t.inv tb) (Types.timestamp.table t i)) ∧ (∀(t : Types.timestamp α), past_time t tb → correct_table (Types.timestamp.size t) (Types.timestamp.table t)) ∧ unroll_correct (Types.t.current_time tb) (Types.t.history tb) (func_of_array (Types.t.buffer tb) ([] : List α)) (Int.ofNat (List.length (Types.t.buffer tb)))
noncomputable def backtrack_to {α : Type} [Inhabited α] (tbold : Types.t α) (tbinter : Types.t α) (tbnew : Types.t α) := (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbinter ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbold) ∧ Types.timestamp.time tm ≤ Types.timestamp.time (current_timestamp tbnew) ∧ before tm (current_timestamp tbnew) ∧ past_time tm tbnew) ∧ (∀(tm : Types.timestamp α), past_time tm tbold → past_time tm tbnew) ∧ precede tbold tbnew
end Logic
namespace Impl
end Impl
namespace Nat
inductive nat where
  | ONat : nat
  | SNat : nat -> nat
axiom inhabited_axiom_nat : Inhabited nat
attribute [instance] inhabited_axiom_nat
noncomputable def nat_to_int : nat -> ℤ
  | nat.ONat => (0 : ℤ)
  | (nat.SNat n1) => (1 : ℤ) + nat_to_int n1
noncomputable def add_nat : nat -> nat -> nat
  | nat.ONat, n2 => n2
  | (nat.SNat n11), n2 => nat.SNat (add_nat n11 n2)
end Nat
namespace Funcs
axiom some :  {α : Type} -> [Inhabited α] -> α -> Option α
axiom some_def {α : Type} [Inhabited α] (x : α) : some x = Option.some x
axiom ocase :  {β : Type} -> [Inhabited β] ->  {α : Type} -> [Inhabited α] -> (α -> β) -> β -> Option α -> β
axiom ocase_def {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (d : β) (x : Option α) : ocase f d x = (match x with | (Option.none : Option α) => d | Option.some x1 => f x1)
noncomputable def omap {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) (x : Option α) := match x with | (Option.none : Option α) => (Option.none : Option β) | Option.some x1 => Option.some (f x1)
noncomputable def olift {β : Type} {α : Type} [Inhabited β] [Inhabited α] (f : α -> β) := ocase (Func.compose some f) (Option.none : Option β)
end Funcs
namespace Sum.Sum
inductive sum (α : Type) (β : Type) where
  | Left : α -> sum α β
  | Right : β -> sum α β
axiom inhabited_axiom_sum {α : Type} [Inhabited α] {β : Type} [Inhabited β] : Inhabited (sum α β)
attribute [instance] inhabited_axiom_sum
end Sum.Sum
namespace Spec
inductive symbol (ty'b0 : Type) where
  | Var_symbol : ty'b0 -> symbol ty'b0
axiom inhabited_axiom_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (symbol ty'b0)
attribute [instance] inhabited_axiom_symbol
mutual
noncomputable def nat_size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> Nat.nat
  | (symbol.Var_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def size_symbol {ty'b0 : Type} [Inhabited ty'b0] : symbol ty'b0 -> ℤ
  | (symbol.Var_symbol v0) => (1 : ℤ)
end
noncomputable def rename_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) := match t with | symbol.Var_symbol v0 => symbol.Var_symbol (s0 v0)
axiom rename_subst_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> ty'd0) -> ty'b0 -> symbol ty'd0
axiom rename_subst_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> ty'd0) (x : ty'b0) : rename_subst_symbol s0 s10 x = rename_symbol (s0 x) s10
noncomputable def olifts_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (s : ty'b0 -> symbol ty'c0) := Funcs.ocase (rename_subst_symbol s Funcs.some) (symbol.Var_symbol (Option.none : Option ty'c0))
noncomputable def subst_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (t : symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) := match t with | symbol.Var_symbol v0 => s0 v0
axiom subst_compose_symbol :  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ty'b0 -> symbol ty'c0) -> (ty'c0 -> symbol ty'd0) -> ty'b0 -> symbol ty'd0
axiom subst_compose_symbol_definition {ty'd0 : Type} {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'd0] [Inhabited ty'c0] [Inhabited ty'b0] (s0 : ty'b0 -> symbol ty'c0) (s10 : ty'c0 -> symbol ty'd0) (x : ty'b0) : subst_compose_symbol s0 s10 x = subst_symbol (s0 x) s10
axiom subst_id_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> ty'b0 -> symbol ty'b0
axiom subst_id_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (x : ty'b0) : subst_id_symbol x = symbol.Var_symbol x
noncomputable def is_symbol_free_var_in_symbol {ty'b0 : Type} [Inhabited ty'b0] (x : ty'b0) (t : symbol ty'b0) := match t with | symbol.Var_symbol v0 => v0 = x
axiom rename_free_var_inversion_symbol_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (x : ty'c0) (t : symbol ty'b0) (s0 : ty'b0 -> ty'c0) (fact0 : is_symbol_free_var_in_symbol x (rename_symbol t s0)) : ∃(y : ty'b0), is_symbol_free_var_in_symbol y t ∧ s0 y = x
axiom subst_free_var_inversion_symbol_symbol {ty'c0 : Type} {ty'b0 : Type} [Inhabited ty'c0] [Inhabited ty'b0] (x : ty'c0) (t : symbol ty'b0) (s0 : ty'b0 -> symbol ty'c0) (fact0 : is_symbol_free_var_in_symbol x (subst_symbol t s0)) : ∃(y : ty'b0), is_symbol_free_var_in_symbol y t ∧ is_symbol_free_var_in_symbol x (s0 y)
end Spec
namespace Types
inductive nl_symbol (ty'b0 : Type) where
  | NLFVar_symbol : ty'b0 -> nl_symbol ty'b0
  | NLBruijn_symbol : ℤ -> nl_symbol ty'b0
axiom inhabited_axiom_nl_symbol {ty'b0 : Type} [Inhabited ty'b0] : Inhabited (nl_symbol ty'b0)
attribute [instance] inhabited_axiom_nl_symbol
structure nlimpl_symbol where
  nlrepr_symbol_field : nl_symbol ℤ
  nlfree_var_symbol_set_abstraction_symbol_field : ℤ
  model_symbol_field : Spec.symbol ℤ
axiom inhabited_axiom_nlimpl_symbol : Inhabited nlimpl_symbol
attribute [instance] inhabited_axiom_nlimpl_symbol
inductive cons_symbol where
  | NLCVar_symbol : ℤ -> cons_symbol
axiom inhabited_axiom_cons_symbol : Inhabited cons_symbol
attribute [instance] inhabited_axiom_cons_symbol
end Types
namespace Logic
mutual
noncomputable def nat_nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> Nat.nat
  | (Types.nl_symbol.NLFVar_symbol v0) => Nat.nat.SNat Nat.nat.ONat
  | (Types.nl_symbol.NLBruijn_symbol v0) => Nat.nat.SNat Nat.nat.ONat
noncomputable def nlsize_symbol {ty'b0 : Type} [Inhabited ty'b0] : Types.nl_symbol ty'b0 -> ℤ
  | (Types.nl_symbol.NLFVar_symbol v0) => (1 : ℤ)
  | (Types.nl_symbol.NLBruijn_symbol v0) => (1 : ℤ)
end
axiom shiftb_symbol :  {ty'b0 : Type} -> [Inhabited ty'b0] -> (ℤ -> Spec.symbol ty'b0) -> ℤ -> Spec.symbol (Option ty'b0)
axiom shiftb_symbol_definition {ty'b0 : Type} [Inhabited ty'b0] (bnd : ℤ -> Spec.symbol ty'b0) (i : ℤ) : shiftb_symbol bnd i = (if i = (0 : ℤ) then Spec.symbol.Var_symbol (Option.none : Option ty'b0) else Spec.rename_symbol (bnd (i - (1 : ℤ))) Funcs.some)
noncomputable def nlmodel_symbol {ty'b0 : Type} {ty'c0 : Type} [Inhabited ty'b0] [Inhabited ty'c0] (t : Types.nl_symbol ty'b0) (fr0 : ty'b0 -> Spec.symbol ty'c0) (bnd0 : ℤ -> Spec.symbol ty'c0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => fr0 v0 | Types.nl_symbol.NLBruijn_symbol v0 => bnd0 v0
noncomputable def correct_indexes_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => True | Types.nl_symbol.NLBruijn_symbol v0 => (0 : ℤ) ≤ v0
noncomputable def bound_depth_of_symbol_in_symbol {ty'b0 : Type} [Inhabited ty'b0] (t : Types.nl_symbol ty'b0) := match t with | Types.nl_symbol.NLFVar_symbol v0 => (0 : ℤ) | Types.nl_symbol.NLBruijn_symbol v0 => (1 : ℤ) + v0
noncomputable def nlimpl_symbol_ok (t : Types.nlimpl_symbol) := nlmodel_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) Spec.subst_id_symbol (Func.const (Spec.symbol.Var_symbol (-(1 : ℤ)))) = Types.nlimpl_symbol.model_symbol_field t ∧ correct_indexes_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) ∧ bound_depth_of_symbol_in_symbol (Types.nlimpl_symbol.nlrepr_symbol_field t) = (0 : ℤ) ∧ (∀(x : ℤ), Spec.is_symbol_free_var_in_symbol x (Types.nlimpl_symbol.model_symbol_field t) → x < Types.nlimpl_symbol.nlfree_var_symbol_set_abstraction_symbol_field t)
noncomputable def cons_ok_symbol (c : Types.cons_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => True
noncomputable def cons_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
noncomputable def cons_open_rel_symbol (c : Types.cons_symbol) (t : Types.nlimpl_symbol) := match c with | Types.cons_symbol.NLCVar_symbol v0 => Types.nlimpl_symbol.model_symbol_field t = Spec.symbol.Var_symbol v0
end Logic
namespace Impl
end Impl
namespace Spec
mutual
inductive fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | FONil : fo_term_list ty'b0 ty'b3
  | FOCons : fo_term ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3 -> fo_term_list ty'b0 ty'b3
inductive fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | Var_fo_term : ty'b3 -> fo_term ty'b0 ty'b3
  | App : Spec.symbol ty'b0 -> fo_term_list ty'b0 ty'b3 -> fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term_list
axiom inhabited_axiom_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_fo_term
mutual
noncomputable def nat_size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> Nat.nat
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; s
  | (fo_term_list.FOCons v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (nat_size_fo_term v0) s1; s2
noncomputable def nat_size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> Nat.nat
  | (fo_term.Var_fo_term v0) => Nat.nat.SNat Nat.nat.ONat
  | (fo_term.App v0 v1) => let s : Nat.nat := Nat.nat.SNat Nat.nat.ONat; let s1 : Nat.nat := Nat.add_nat (nat_size_fo_term_list v1) s; let s2 : Nat.nat := Nat.add_nat (Spec.nat_size_symbol v0) s1; s2
noncomputable def size_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> ℤ
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => let s : ℤ := (1 : ℤ); s
  | (fo_term_list.FOCons v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := size_fo_term v0 + s1; s2
noncomputable def size_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> ℤ
  | (fo_term.Var_fo_term v0) => (1 : ℤ)
  | (fo_term.App v0 v1) => let s : ℤ := (1 : ℤ); let s1 : ℤ := size_fo_term_list v1 + s; let s2 : ℤ := Spec.size_symbol v0 + s1; s2
end
mutual
noncomputable def rename_fo_term_list {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term_list ty'c0 ty'c3
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3), s0, s3 => (fo_term_list.FONil : fo_term_list ty'c0 ty'c3)
  | (fo_term_list.FOCons v0 v1), s0, s3 => fo_term_list.FOCons (rename_fo_term v0 s0 s3) (rename_fo_term_list v1 s0 s3)
noncomputable def rename_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> (ty'b0 -> ty'c0) -> (ty'b3 -> ty'c3) -> fo_term ty'c0 ty'c3
  | (fo_term.Var_fo_term v0), s0, s3 => fo_term.Var_fo_term (s3 v0)
  | (fo_term.App v0 v1), s0, s3 => fo_term.App (Spec.rename_symbol v0 s0) (rename_fo_term_list v1 s0 s3)
end
axiom rename_subst_fo_term :  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] ->  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'd3 : Type} -> [Inhabited ty'd3] ->  {ty'c3 : Type} -> [Inhabited ty'c3] -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (ty'c0 -> ty'd0) -> (ty'c3 -> ty'd3) -> ty'b3 -> fo_term ty'd0 ty'd3
axiom rename_subst_fo_term_definition {ty'c0 : Type} {ty'b3 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'c3 : Type} [Inhabited ty'c0] [Inhabited ty'b3] [Inhabited ty'd0] [Inhabited ty'd3] [Inhabited ty'c3] (s0 : ty'b3 -> fo_term ty'c0 ty'c3) (s10 : ty'c0 -> ty'd0) (s13 : ty'c3 -> ty'd3) (x : ty'b3) : rename_subst_fo_term s0 s10 s13 x = rename_fo_term (s0 x) s10 s13
noncomputable def olifts_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b3] (s : ty'b3 -> fo_term ty'c0 ty'c3) := Funcs.ocase (rename_subst_fo_term s Func.identity Funcs.some) (fo_term.Var_fo_term (Option.none : Option ty'c3))
mutual
noncomputable def subst_fo_term_list {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term_list ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> fo_term_list ty'c0 ty'c3
  | (fo_term_list.FONil : fo_term_list ty'b0 ty'b3), s0, s3 => (fo_term_list.FONil : fo_term_list ty'c0 ty'c3)
  | (fo_term_list.FOCons v0 v1), s0, s3 => fo_term_list.FOCons (subst_fo_term v0 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity)) (subst_fo_term_list v1 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity))
noncomputable def subst_fo_term {ty'c0 : Type} {ty'c3 : Type} {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'c0] [Inhabited ty'c3] [Inhabited ty'b0] [Inhabited ty'b3] : fo_term ty'b0 ty'b3 -> (ty'b0 -> Spec.symbol ty'c0) -> (ty'b3 -> fo_term ty'c0 ty'c3) -> fo_term ty'c0 ty'c3
  | (fo_term.Var_fo_term v0), s0, s3 => s3 v0
  | (fo_term.App v0 v1), s0, s3 => fo_term.App (Spec.subst_symbol v0 (Spec.rename_subst_symbol s0 Func.identity)) (subst_fo_term_list v1 (Spec.rename_subst_symbol s0 Func.identity) (rename_subst_fo_term s3 Func.identity Func.identity))
end
axiom subst_compose_fo_term :  {ty'c0 : Type} -> [Inhabited ty'c0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] ->  {ty'd0 : Type} -> [Inhabited ty'd0] ->  {ty'd3 : Type} -> [Inhabited ty'd3] ->  {ty'c3 : Type} -> [Inhabited ty'c3] -> (ty'b3 -> fo_term ty'c0 ty'c3) -> (ty'c0 -> Spec.symbol ty'd0) -> (ty'c3 -> fo_term ty'd0 ty'd3) -> ty'b3 -> fo_term ty'd0 ty'd3
axiom subst_compose_fo_term_definition {ty'c0 : Type} {ty'b3 : Type} {ty'd0 : Type} {ty'd3 : Type} {ty'c3 : Type} [Inhabited ty'c0] [Inhabited ty'b3] [Inhabited ty'd0] [Inhabited ty'd3] [Inhabited ty'c3] (s0 : ty'b3 -> fo_term ty'c0 ty'c3) (s10 : ty'c0 -> Spec.symbol ty'd0) (s13 : ty'c3 -> fo_term ty'd0 ty'd3) (x : ty'b3) : subst_compose_fo_term s0 s10 s13 x = subst_fo_term (s0 x) s10 s13
axiom subst_id_fo_term :  {ty'b0 : Type} -> [Inhabited ty'b0] ->  {ty'b3 : Type} -> [Inhabited ty'b3] -> ty'b3 -> fo_term ty'b0 ty'b3
axiom subst_id_fo_term_definition {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] (x : ty'b3) : (subst_id_fo_term : ty'b3 -> fo_term ty'b0 ty'b3) x = fo_term.Var_fo_term x
mutual
noncomputable def is_symbol_free_var_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b0 -> fo_term_list ty'b0 ty'b3 -> Prop
  | x, (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => False
  | x, (fo_term_list.FOCons v0 v1) => is_symbol_free_var_in_fo_term x v0 ∨ is_symbol_free_var_in_fo_term_list x v1
noncomputable def is_fo_term_free_var_in_fo_term_list {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b3 -> fo_term_list ty'b0 ty'b3 -> Prop
  | x, (fo_term_list.FONil : fo_term_list ty'b0 ty'b3) => False
  | x, (fo_term_list.FOCons v0 v1) => is_fo_term_free_var_in_fo_term x v0 ∨ is_fo_term_free_var_in_fo_term_list x v1
noncomputable def is_symbol_free_var_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b0 -> fo_term ty'b0 ty'b3 -> Prop
  | x, (fo_term.Var_fo_term v0) => False
  | x, (fo_term.App v0 v1) => Spec.is_symbol_free_var_in_symbol x v0 ∨ is_symbol_free_var_in_fo_term_list x v1
noncomputable def is_fo_term_free_var_in_fo_term {ty'b0 : Type} {ty'b3 : Type} [Inhabited ty'b0] [Inhabited ty'b3] : ty'b3 -> fo_term ty'b0 ty'b3 -> Prop
  | x, (fo_term.Var_fo_term v0) => v0 = x
  | x, (fo_term.App v0 v1) => is_fo_term_free_var_in_fo_term_list x v1
end
end Spec
namespace Types
mutual
inductive nl_fo_term_list (ty'b0 : Type) (ty'b3 : Type) where
  | NL_FONil : nl_fo_term_list ty'b0 ty'b3
  | NL_FOCons : nl_fo_term ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term_list ty'b0 ty'b3
inductive nl_fo_term (ty'b0 : Type) (ty'b3 : Type) where
  | NLFVar_fo_term : ty'b3 -> nl_fo_term ty'b0 ty'b3
  | NLBruijn_fo_term : ℤ -> nl_fo_term ty'b0 ty'b3
  | NL_App : Types.nl_symbol ty'b0 -> nl_fo_term_list ty'b0 ty'b3 -> nl_fo_term ty'b0 ty'b3
end
axiom inhabited_axiom_nl_fo_term_list {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term_list ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term_list
axiom inhabited_axiom_nl_fo_term {ty'b0 : Type} [Inhabited ty'b0] {ty'b3 : Type} [Inhabited ty'b3] : Inhabited (nl_fo_term ty'b0 ty'b3)
attribute [instance] inhabited_axiom_nl_fo_term
structure nlimpl_fo_term_list where
  nlrepr_fo_term_list_field : nl_fo_term_list ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_list_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_list_field : ℤ
  model_fo_term_list_field : Spec.fo_term_list ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term_list : Inhabited nlimpl_fo_term_list
attribute [instance] inhabited_axiom_nlimpl_fo_term_list
structure nlimpl_fo_term where
  nlrepr_fo_term_field : nl_fo_term ℤ ℤ
  nlfree_var_symbol_set_abstraction_fo_term_field : ℤ
  nlfree_var_fo_term_set_abstraction_fo_term_field : ℤ
  model_fo_term_field : Spec.fo_term ℤ ℤ
axiom inhabited_axiom_nlimpl_fo_term : Inhabited nlimpl_fo_term
attribute [instance] inhabited_axiom_nlimpl_fo_term
inductive cons_fo_term_list where
  | NLC_FONil : cons_fo_term_list
  | NLC_FOCons : nlimpl_fo_term -> nlimpl_fo_term_list -> cons_fo_term_list
axiom inhabited_axiom_cons_fo_term_list : Inhabited cons_fo_term_list
attribute [instance] inhabited_axiom_cons_fo_term_list
inductive cons_fo_term where
  | NLCVar_fo_term : ℤ -> cons_fo_term
  | NLC_App : Types.nlimpl_symbol -> nlimpl_fo_term_list -> cons_fo_term
axiom inhabited_axiom_cons_fo_term : Inhabited cons_fo_term
attribute [instance] inhabited_axiom_cons_fo_term
end Types
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
namespace Impl
end Impl
namespace Types
inductive sdata where
  | PConflict : Types.nlimpl_fo_term_list -> Types.nlimpl_fo_term_list -> sdata
  | Assign : Types.nlimpl_fo_term -> sdata
axiom inhabited_axiom_sdata : Inhabited sdata
attribute [instance] inhabited_axiom_sdata
axiom subst : Type
axiom inhabited_axiom_subst : Inhabited subst
attribute [instance] inhabited_axiom_subst
axiom timesubst : Type
axiom inhabited_axiom_timesubst : Inhabited timesubst
attribute [instance] inhabited_axiom_timesubst
structure unifier_subst where
  unifier_base_model : ℤ -> Spec.fo_term ℤ ℤ
  unifier : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unifier_subst : Inhabited unifier_subst
attribute [instance] inhabited_axiom_unifier_subst
structure unification_return where
  final_unifier : unifier_subst
  unifier_factor : ℤ -> Spec.fo_term ℤ ℤ
axiom inhabited_axiom_unification_return : Inhabited unification_return
attribute [instance] inhabited_axiom_unification_return
end Types
