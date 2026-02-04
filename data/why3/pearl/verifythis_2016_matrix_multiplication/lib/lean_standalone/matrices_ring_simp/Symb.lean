namespace Symb
structure mono where
  m_prod : List ℤ
  m_pos : Bool
axiom inhabited_axiom_mono : Inhabited mono
attribute [instance] inhabited_axiom_mono
noncomputable def l_mdl : (ℤ -> MyMatrix.mat ℤ) -> List ℤ -> MyMatrix.mat ℤ
  | f, ([] : List ℤ) => MyMatrix.create (-(1 : ℤ)) (-(1 : ℤ)) MatrixArithmetic.zerof
  | f, (List.cons x ([] : List ℤ)) => f x
  | f, (List.cons x q) => MatrixArithmetic.mul (f x) (l_mdl f q)
noncomputable def l_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List ℤ -> Prop
  | f, r, c, ([] : List ℤ) => False
  | f, r, c, (List.cons x ([] : List ℤ)) => MyMatrix.rows (f x) = r ∧ MyMatrix.cols (f x) = c
  | f, r, c, (List.cons x q) => MyMatrix.rows (f x) = r ∧ l_vld f (MyMatrix.cols (f x)) c q
noncomputable def m_mdl (f : ℤ -> MyMatrix.mat ℤ) (m : mono) := let m0 : MyMatrix.mat ℤ := l_mdl f (mono.m_prod m); if mono.m_pos m = true then m0 else MatrixArithmetic.opp m0
noncomputable def lm_mdl : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl f r c q) (m_mdl f x)
noncomputable def lm_mdl_simp : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> MyMatrix.mat ℤ
  | f, r, c, ([] : List mono) => MyMatrix.create r c MatrixArithmetic.zerof
  | f, r, c, (List.cons x ([] : List mono)) => m_mdl f x
  | f, r, c, (List.cons x q) => MatrixArithmetic.add (lm_mdl_simp f r c q) (m_mdl f x)
noncomputable def lm_vld : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> ℤ -> List mono -> Prop
  | f, r, c, ([] : List mono) => True
  | f, r, c, (List.cons x q) => l_vld f r c (mono.m_prod x) ∧ lm_vld f r c q
noncomputable def l_compare : List ℤ -> List ℤ -> ℤ
  | ([] : List ℤ), ([] : List ℤ) => (0 : ℤ)
  | ([] : List ℤ), x => -(1 : ℤ)
  | x, ([] : List ℤ) => (1 : ℤ)
  | (List.cons x q), (List.cons y r) => if x < y then -(1 : ℤ) else if y < x then (1 : ℤ) else l_compare q r
noncomputable def m_lower (m1 : mono) (m2 : mono) := let cmp : ℤ := l_compare (mono.m_prod m1) (mono.m_prod m2); cmp < (0 : ℤ) ∨ cmp = (0 : ℤ) ∧ (mono.m_pos m1 = true → mono.m_pos m2 = true)
noncomputable def m_collapse (l : List mono) (m : mono) := match l with | ([] : List mono) => List.cons m ([] : List mono) | List.cons x q => (if ¬mono.m_pos x = true ∧ mono.m_pos m = true ∧ l_compare (mono.m_prod m) (mono.m_prod x) = (0 : ℤ) then q else List.cons m l)
noncomputable def lm_collapse : List mono -> List mono -> List mono
  | acc, ([] : List mono) => acc
  | acc, (List.cons x q) => lm_collapse (m_collapse acc x) q
noncomputable def cat_rev {α : Type} [Inhabited α] : List α -> List α -> List α
  | acc, ([] : List α) => acc
  | acc, (List.cons x q) => cat_rev (List.cons x acc) q
noncomputable def lm_dump : mono -> List mono -> List mono -> List mono × List mono
  | x, acc, ([] : List mono) => (acc, ([] : List mono))
  | x, acc, (List.cons y q) => if m_lower x y then (acc, List.cons y q) else lm_dump x (m_collapse acc y) q
noncomputable def lm_merge : List mono -> List mono -> List mono -> List mono
  | acc, ([] : List mono), l2 => cat_rev ([] : List mono) (lm_collapse acc l2)
  | acc, (List.cons x q), l2 => match lm_dump x acc l2 with | (acc1, l21) => lm_merge (m_collapse acc1 x) q l21
noncomputable def cat {α : Type} [Inhabited α] : List α -> List α -> List α
  | ([] : List α), l2 => l2
  | (List.cons x q), l2 => List.cons x (cat q l2)
noncomputable def m_mul (m1 : mono) (m2 : mono) := mono.mk (cat (mono.m_prod m1) (mono.m_prod m2)) (if (mono.m_pos m1 = true) = (mono.m_pos m2 = true) then true else false)
noncomputable def m_distribute : mono -> List mono -> List mono
  | m, ([] : List mono) => ([] : List mono)
  | m, (List.cons x q) => List.cons (m_mul m x) (m_distribute m q)
noncomputable def lm_distribute : List mono -> List mono -> List mono
  | ([] : List mono), l2 => ([] : List mono)
  | (List.cons x q), l2 => lm_merge ([] : List mono) (m_distribute x l2) (lm_distribute q l2)
noncomputable def lm_opp : List mono -> List mono
  | ([] : List mono) => ([] : List mono)
  | (List.cons x q) => lm_merge ([] : List mono) (List.cons (mono.mk (mono.m_prod x) (if ¬mono.m_pos x = true then true else false)) ([] : List mono)) (lm_opp q)
axiom fc : ℤ -> ℤ -> MyMatrix.mat ℤ
axiom fc'def (y0 : ℤ) (y1 : ℤ) : fc y0 y1 = MyMatrix.create y0 y1 MatrixArithmetic.zerof
noncomputable def empty := fc (0 : ℤ)
structure env where
  ev_f : ℤ -> MyMatrix.mat ℤ
  ev_c : ℤ
axiom inhabited_axiom_env : Inhabited env
attribute [instance] inhabited_axiom_env
structure expr where
  e_body : List mono
  e_rows : ℤ
  e_cols : ℤ
axiom inhabited_axiom_expr : Inhabited expr
attribute [instance] inhabited_axiom_expr
noncomputable def e_vld (env1 : env) (e : expr) := (0 : ℤ) ≤ expr.e_rows e ∧ (0 : ℤ) ≤ expr.e_cols e ∧ lm_vld (env.ev_f env1) (expr.e_rows e) (expr.e_cols e) (expr.e_body e)
noncomputable def e_mdl (env1 : env) (e : expr) := lm_mdl_simp (env.ev_f env1) (expr.e_rows e) (expr.e_cols e) (expr.e_body e)
axiom extends1 : (ℤ -> MyMatrix.mat ℤ) -> ℤ -> MyMatrix.mat ℤ -> ℤ -> MyMatrix.mat ℤ
axiom extends'def (f : ℤ -> MyMatrix.mat ℤ) (c : ℤ) (v : MyMatrix.mat ℤ) (n : ℤ) : extends1 f c v n = (if ¬n = c then f n else v)
noncomputable def symb_mat (m : MyMatrix.mat ℤ) (n : ℤ) := expr.mk (List.cons (mono.mk (List.cons n ([] : List ℤ)) true) ([] : List mono)) (MyMatrix.rows m) (MyMatrix.cols m)
noncomputable def symb_opp (e : expr) := expr.mk (lm_opp (expr.e_body e)) (expr.e_rows e) (expr.e_cols e)
noncomputable def symb_add (e1 : expr) (e2 : expr) := expr.mk (lm_merge ([] : List mono) (expr.e_body e1) (expr.e_body e2)) (expr.e_rows e1) (expr.e_cols e1)
noncomputable def symb_sub (e1 : expr) (e2 : expr) := symb_add e1 (symb_opp e2)
noncomputable def symb_mul (e1 : expr) (e2 : expr) := expr.mk (lm_distribute (expr.e_body e1) (expr.e_body e2)) (expr.e_rows e1) (expr.e_cols e2)
end Symb
