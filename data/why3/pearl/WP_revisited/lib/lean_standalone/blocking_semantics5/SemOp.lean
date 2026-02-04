namespace SemOp
axiom env : Type
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
axiom stack : Type
axiom inhabited_axiom_stack : Inhabited stack
attribute [instance] inhabited_axiom_stack
noncomputable def get_stack : Syntax.ident -> List (Syntax.ident × Syntax.value) -> Syntax.value
  | i, ([] : List (Syntax.ident × Syntax.value)) => Syntax.value.Vvoid
  | i, (List.cons (x, v) r) => if x = i then v else get_stack i r
noncomputable def eval_bin (x : Syntax.value) (op : Syntax.operator) (y : Syntax.value) := match (x, y) with | (Syntax.value.Vint x1, Syntax.value.Vint y1) => (match op with | Syntax.operator.Oplus => Syntax.value.Vint (x1 + y1) | Syntax.operator.Ominus => Syntax.value.Vint (x1 - y1) | Syntax.operator.Omult => Syntax.value.Vint (x1 * y1) | Syntax.operator.Ole => Syntax.value.Vbool (if x1 ≤ y1 then true else false)) | (_, _) => Syntax.value.Vvoid
noncomputable def eval_term : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.term -> Syntax.value
  | sigma, pi, (Syntax.term.Tvalue v) => v
  | sigma, pi, (Syntax.term.Tvar id1) => get_stack id1 pi
  | sigma, pi, (Syntax.term.Tderef id1) => sigma id1
  | sigma, pi, (Syntax.term.Tbin t1 op t2) => eval_bin (eval_term sigma pi t1) op (eval_term sigma pi t2)
noncomputable def eval_fmla : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.fmla -> Prop
  | sigma, pi, (Syntax.fmla.Fterm t) => eval_term sigma pi t = Syntax.value.Vbool true
  | sigma, pi, (Syntax.fmla.Fand f1 f2) => eval_fmla sigma pi f1 ∧ eval_fmla sigma pi f2
  | sigma, pi, (Syntax.fmla.Fnot f1) => ¬eval_fmla sigma pi f1
  | sigma, pi, (Syntax.fmla.Fimplies f1 f2) => eval_fmla sigma pi f1 → eval_fmla sigma pi f2
  | sigma, pi, (Syntax.fmla.Flet x t f1) => eval_fmla sigma (List.cons (x, eval_term sigma pi t) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYint f1) => ∀(n : ℤ), eval_fmla sigma (List.cons (x, Syntax.value.Vint n) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYbool f1) => ∀(b : Bool), eval_fmla sigma (List.cons (x, Syntax.value.Vbool b) pi) f1
  | sigma, pi, (Syntax.fmla.Fforall x Syntax.datatype.TYunit f1) => eval_fmla sigma (List.cons (x, Syntax.value.Vvoid) pi) f1
noncomputable def valid_fmla (p : Syntax.fmla) := ∀(sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)), eval_fmla sigma pi p
inductive one_step : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> Prop where
 | one_step_assign (sigma' : Syntax.mident -> Syntax.value) (sigma : Syntax.mident -> Syntax.value) (x : Syntax.mident) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) : sigma' = Function.update sigma x (eval_term sigma pi t) → one_step sigma pi (Syntax.stmt.Sassign x t) sigma' pi Syntax.stmt.Sskip
 | one_step_seq_noskip (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s1 : Syntax.stmt) (sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (s1' : Syntax.stmt) (s2 : Syntax.stmt) : one_step sigma pi s1 sigma' pi' s1' → one_step sigma pi (Syntax.stmt.Sseq s1 s2) sigma' pi' (Syntax.stmt.Sseq s1' s2)
 | one_step_seq_skip (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) : one_step sigma pi (Syntax.stmt.Sseq Syntax.stmt.Sskip s) sigma pi s
 | one_step_if_true (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : eval_term sigma pi t = Syntax.value.Vbool true → one_step sigma pi (Syntax.stmt.Sif t s1 s2) sigma pi s1
 | one_step_if_false (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (t : Syntax.term) (s1 : Syntax.stmt) (s2 : Syntax.stmt) : eval_term sigma pi t = Syntax.value.Vbool false → one_step sigma pi (Syntax.stmt.Sif t s1 s2) sigma pi s2
 | one_step_assert (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (f : Syntax.fmla) : eval_fmla sigma pi f → one_step sigma pi (Syntax.stmt.Sassert f) sigma pi Syntax.stmt.Sskip
 | one_step_while_true (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (inv : Syntax.fmla) (cond : Syntax.term) (body : Syntax.stmt) : eval_fmla sigma pi inv → eval_term sigma pi cond = Syntax.value.Vbool true → one_step sigma pi (Syntax.stmt.Swhile cond inv body) sigma pi (Syntax.stmt.Sseq body (Syntax.stmt.Swhile cond inv body))
 | one_step_while_false (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (inv : Syntax.fmla) (cond : Syntax.term) (body : Syntax.stmt) : eval_fmla sigma pi inv → eval_term sigma pi cond = Syntax.value.Vbool false → one_step sigma pi (Syntax.stmt.Swhile cond inv body) sigma pi Syntax.stmt.Sskip
inductive many_steps : (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> (Syntax.mident -> Syntax.value) -> List (Syntax.ident × Syntax.value) -> Syntax.stmt -> ℤ -> Prop where
 | many_steps_refl (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) : many_steps sigma pi s sigma pi s (0 : ℤ)
 | many_steps_trans (sigma1 : Syntax.mident -> Syntax.value) (pi1 : List (Syntax.ident × Syntax.value)) (s1 : Syntax.stmt) (sigma2 : Syntax.mident -> Syntax.value) (pi2 : List (Syntax.ident × Syntax.value)) (s2 : Syntax.stmt) (sigma3 : Syntax.mident -> Syntax.value) (pi3 : List (Syntax.ident × Syntax.value)) (s3 : Syntax.stmt) (n : ℤ) : one_step sigma1 pi1 s1 sigma2 pi2 s2 → many_steps sigma2 pi2 s2 sigma3 pi3 s3 n → many_steps sigma1 pi1 s1 sigma3 pi3 s3 (n + (1 : ℤ))
noncomputable def reductible (sigma : Syntax.mident -> Syntax.value) (pi : List (Syntax.ident × Syntax.value)) (s : Syntax.stmt) := ∃(sigma' : Syntax.mident -> Syntax.value) (pi' : List (Syntax.ident × Syntax.value)) (s' : Syntax.stmt), one_step sigma pi s sigma' pi' s'
end SemOp
