theory lineardecision_LinearEquationsDecision_sprodqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "mach.matrix_Matrix63"
begin
typedecl  coeff
typedecl  a
consts infix_pl :: "a \<Rightarrow> a \<Rightarrow> a"
consts infix_as :: "a \<Rightarrow> a \<Rightarrow> a"
consts prefix_mn :: "a \<Rightarrow> a"
consts azero :: "a"
consts aone :: "a"
consts ale :: "a \<Rightarrow> a \<Rightarrow> bool"
axiomatization where Assoc:   "infix_pl (infix_pl x y) z = infix_pl x (infix_pl y z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Unit_def_l:   "infix_pl azero x = x"
  for x :: "a"
axiomatization where Unit_def_r:   "infix_pl x azero = x"
  for x :: "a"
axiomatization where Inv_def_l:   "infix_pl (prefix_mn x) x = azero"
  for x :: "a"
axiomatization where Inv_def_r:   "infix_pl x (prefix_mn x) = azero"
  for x :: "a"
axiomatization where Comm:   "infix_pl x y = infix_pl y x"
  for x :: "a"
  and y :: "a"
axiomatization where Assoc1:   "infix_as (infix_as x y) z = infix_as x (infix_as y z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Mul_distr_l:   "infix_as x (infix_pl y z) = infix_pl (infix_as x y) (infix_as x z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Mul_distr_r:   "infix_as (infix_pl y z) x = infix_pl (infix_as y x) (infix_as z x)"
  for y :: "a"
  and z :: "a"
  and x :: "a"
axiomatization where Comm1:   "infix_as x y = infix_as y x"
  for x :: "a"
  and y :: "a"
axiomatization where Unitary:   "infix_as aone x = x"
  for x :: "a"
axiomatization where NonTrivialRing:   "\<not>azero = aone"
axiomatization where Refl:   "ale x x"
  for x :: "a"
axiomatization where Trans:   "ale x z"
 if "ale x y"
 and "ale y z"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Antisymm:   "x = y"
 if "ale x y"
 and "ale y x"
  for x :: "a"
  and y :: "a"
axiomatization where Total:   "ale x y \<or> ale y x"
  for x :: "a"
  and y :: "a"
axiomatization where ZeroLessOne:   "ale azero aone"
axiomatization where CompatOrderAdd:   "ale (infix_pl x z) (infix_pl y z)"
 if "ale x y"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where CompatOrderMult:   "ale (infix_as x z) (infix_as y z)"
 if "ale x y"
 and "ale azero z"
  for x :: "a"
  and y :: "a"
  and z :: "a"
consts infix_mn :: "a \<Rightarrow> a \<Rightarrow> a"
axiomatization where sub_def:   "infix_mn a1 a2 = infix_pl a1 (prefix_mn a2)"
  for a1 :: "a"
  and a2 :: "a"
typedecl  vars
typedecl  cvars
consts interp :: "coeff \<Rightarrow> cvars \<Rightarrow> a"
consts czero :: "coeff"
consts cone :: "coeff"
axiomatization where zero_def:   "interp czero y = azero"
  for y :: "cvars"
axiomatization where one_def:   "interp cone y = aone"
  for y :: "cvars"
consts eq :: "coeff \<Rightarrow> coeff \<Rightarrow> bool"
axiomatization where eq'spec:   "interp a1 y = interp b y"
 if "eq a1 b"
  for a1 :: "coeff"
  and b :: "coeff"
  and y :: "cvars"
typedecl  vars1
datatype  expr = Term "coeff" "int" | Add "expr" "expr" | Cst "coeff"
fun valid_expr :: "expr \<Rightarrow> _"
  where "valid_expr (Term x i) = ((0 :: int) \<le> i)" for x i
      | "valid_expr (Cst x) = True" for x
      | "valid_expr (Add e1 e2) = (valid_expr e1 \<and> valid_expr e2)" for e1 e2
fun expr_bound :: "expr \<Rightarrow> int \<Rightarrow> _"
  where "expr_bound (Term x i) b = ((0 :: int) \<le> i \<and> i \<le> b)" for x i b
      | "expr_bound (Cst x) b = True" for x b
      | "expr_bound (Add e1 e2) b = (expr_bound e1 b \<and> expr_bound e2 b)" for e1 e2 b
fun interp1 :: "expr \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> cvars \<Rightarrow> a"
  where "interp1 (Term c v) y z = infix_as (interp c z) (y v)" for c v y z
      | "interp1 (Add e1 e2) y z = infix_pl (interp1 e1 y z) (interp1 e2 y z)" for e1 e2 y z
      | "interp1 (Cst c) y z = interp c z" for c y z
typedecl  equality
typedecl  "context"
definition valid_eq :: "expr \<times> expr \<Rightarrow> _"
  where "valid_eq eq1 \<longleftrightarrow> (case eq1 of (e1, e2) \<Rightarrow> valid_expr e1 \<and> valid_expr e2)" for eq1
definition eq_bound :: "expr \<times> expr \<Rightarrow> int \<Rightarrow> _"
  where "eq_bound eq1 b \<longleftrightarrow> (case eq1 of (e1, e2) \<Rightarrow> expr_bound e1 b \<and> expr_bound e2 b)" for eq1 b
fun valid_ctx :: "(expr \<times> expr) list \<Rightarrow> _"
  where "valid_ctx (Nil :: (expr \<times> expr) list) = True"
      | "valid_ctx (Cons eq1 t) = (valid_eq eq1 \<and> valid_ctx t)" for eq1 t
fun ctx_bound :: "(expr \<times> expr) list \<Rightarrow> int \<Rightarrow> _"
  where "ctx_bound (Nil :: (expr \<times> expr) list) b = True" for b
      | "ctx_bound (Cons eq1 t) b = (eq_bound eq1 b \<and> ctx_bound t b)" for eq1 t b
definition interp_eq :: "expr \<times> expr \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> cvars \<Rightarrow> bool"
  where "interp_eq g y z = (if case g of (g1, g2) \<Rightarrow> interp1 g1 y z = interp1 g2 y z then True else False)" for g y z
fun interp_ctx :: "(expr \<times> expr) list \<Rightarrow> expr \<times> expr \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> cvars \<Rightarrow> bool"
  where "interp_ctx l g y z = (if case l of Nil \<Rightarrow> interp_eq g y z = True | Cons h t \<Rightarrow> interp_eq h y z = True \<longrightarrow> interp_ctx t g y z = True then True else False)" for l g y z
theorem sprod'vc:
  fixes a1 :: "coeff array63"
  fixes b :: "coeff array63"
  assumes fact0: "array63_length a1 = array63_length b"
  shows "let o1 :: 63 word = array63_length a1 in int'63_in_bounds (sint o1 - (1 :: int)) \<and> (\<forall>(o2 :: 63 word). sint o2 = sint o1 - (1 :: int) \<longrightarrow> (0 :: int) \<le> sint o2 + (1 :: int) \<longrightarrow> (\<forall>(i :: 63 word). let i1 :: int = sint i in (0 :: int) \<le> i1 \<and> i1 \<le> sint o2 \<longrightarrow> ((0 :: int) \<le> sint i \<and> sint i < sint (array63_length b)) \<and> (0 :: int) \<le> sint i \<and> sint i < sint (array63_length a1)))"
  sorry
end
