theory ringdecision_AssocAlgebraDecision_squash_appendqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  r
typedecl  a
consts rzero :: "r"
consts rone :: "r"
consts aone :: "a"
consts azero :: "a"
consts rplus :: "r \<Rightarrow> r \<Rightarrow> r"
consts rtimes :: "r \<Rightarrow> r \<Rightarrow> r"
consts ropp :: "r \<Rightarrow> r"
consts aplus :: "a \<Rightarrow> a \<Rightarrow> a"
consts atimes :: "a \<Rightarrow> a \<Rightarrow> a"
consts aopp :: "a \<Rightarrow> a"
axiomatization where Assoc:   "rplus (rplus x y) z = rplus x (rplus y z)"
  for x :: "r"
  and y :: "r"
  and z :: "r"
axiomatization where Unit_def_l:   "rplus rzero x = x"
  for x :: "r"
axiomatization where Unit_def_r:   "rplus x rzero = x"
  for x :: "r"
axiomatization where Inv_def_l:   "rplus (ropp x) x = rzero"
  for x :: "r"
axiomatization where Inv_def_r:   "rplus x (ropp x) = rzero"
  for x :: "r"
axiomatization where Comm:   "rplus x y = rplus y x"
  for x :: "r"
  and y :: "r"
axiomatization where Assoc1:   "rtimes (rtimes x y) z = rtimes x (rtimes y z)"
  for x :: "r"
  and y :: "r"
  and z :: "r"
axiomatization where Mul_distr_l:   "rtimes x (rplus y z) = rplus (rtimes x y) (rtimes x z)"
  for x :: "r"
  and y :: "r"
  and z :: "r"
axiomatization where Mul_distr_r:   "rtimes (rplus y z) x = rplus (rtimes y x) (rtimes z x)"
  for y :: "r"
  and z :: "r"
  and x :: "r"
axiomatization where Comm1:   "rtimes x y = rtimes y x"
  for x :: "r"
  and y :: "r"
axiomatization where Unitary:   "rtimes rone x = x"
  for x :: "r"
axiomatization where NonTrivialRing:   "\<not>rzero = rone"
axiomatization where Assoc2:   "aplus (aplus x y) z = aplus x (aplus y z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Unit_def_l1:   "aplus azero x = x"
  for x :: "a"
axiomatization where Unit_def_r1:   "aplus x azero = x"
  for x :: "a"
axiomatization where Inv_def_l1:   "aplus (aopp x) x = azero"
  for x :: "a"
axiomatization where Inv_def_r1:   "aplus x (aopp x) = azero"
  for x :: "a"
axiomatization where Comm2:   "aplus x y = aplus y x"
  for x :: "a"
  and y :: "a"
axiomatization where Assoc3:   "atimes (atimes x y) z = atimes x (atimes y z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Mul_distr_l1:   "atimes x (aplus y z) = aplus (atimes x y) (atimes x z)"
  for x :: "a"
  and y :: "a"
  and z :: "a"
axiomatization where Mul_distr_r1:   "atimes (aplus y z) x = aplus (atimes y x) (atimes z x)"
  for y :: "a"
  and z :: "a"
  and x :: "a"
axiomatization where AUnitary'0:   "atimes aone x = atimes x aone"
  for x :: "a"
axiomatization where AUnitary'1:   "atimes x aone = x"
  for x :: "a"
axiomatization where ANonTrivial:   "\<not>azero = aone"
consts infix_dl :: "r \<Rightarrow> a \<Rightarrow> a"
axiomatization where ExtDistSumA:   "infix_dl r1 (aplus x y) = aplus (infix_dl r1 x) (infix_dl r1 y)"
  for r1 :: "r"
  and x :: "a"
  and y :: "a"
axiomatization where ExtDistSumR:   "infix_dl (rplus r1 s) x = aplus (infix_dl r1 x) (infix_dl s x)"
  for r1 :: "r"
  and s :: "r"
  and x :: "a"
axiomatization where AssocMulExt:   "infix_dl (rtimes r1 s) x = infix_dl r1 (infix_dl s x)"
  for r1 :: "r"
  and s :: "r"
  and x :: "a"
axiomatization where UnitExt:   "infix_dl rone x = x"
  for x :: "a"
axiomatization where CommMulExt'0:   "infix_dl r1 (atimes x y) = atimes (infix_dl r1 x) y"
  for r1 :: "r"
  and x :: "a"
  and y :: "a"
axiomatization where CommMulExt'1:   "atimes (infix_dl r1 x) y = atimes x (infix_dl r1 y)"
  for r1 :: "r"
  and x :: "a"
  and y :: "a"
consts eq0 :: "r \<Rightarrow> bool"
axiomatization where eq0'spec:   "eq0 r1 \<longleftrightarrow> r1 = rzero"
  for r1 :: "r"
datatype  t = Var "int" | Add "t" "t" | Mul "t" "t" | Ext "r" "t" | Sub "t" "t"
typedecl  vars
consts asub :: "a \<Rightarrow> a \<Rightarrow> a"
axiomatization where asub_def:   "asub x y = aplus x (aopp y)"
  for x :: "a"
  and y :: "a"
fun interp :: "t \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> a"
  where "interp (Var n) y = y n" for n y
      | "interp (Add x1 x2) y = aplus (interp x1 y) (interp x2 y)" for x1 x2 y
      | "interp (Mul x1 x2) y = atimes (interp x1 y) (interp x2 y)" for x1 x2 y
      | "interp (Sub x1 x2) y = asub (interp x1 y) (interp x2 y)" for x1 x2 y
      | "interp (Ext r1 x1) y = infix_dl r1 (interp x1 y)" for r1 x1 y
definition eq :: "t \<Rightarrow> t \<Rightarrow> _"
  where "eq x1 x2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> a). interp x1 y = interp x2 y)" for x1 x2
datatype  m = M "r" "int list"
typedecl  t'
fun mon :: "int list \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> a"
  where "mon (Nil :: int list) y = aone" for y
      | "mon (Cons x1 l) y = atimes (y x1) (mon l y)" for x1 l y
fun interp' :: "m list \<Rightarrow> (int \<Rightarrow> a) \<Rightarrow> a"
  where "interp' (Nil :: m list) y = azero" for y
      | "interp' (Cons (M r1 m1) l) y = aplus (infix_dl r1 (mon m1 y)) (interp' l y)" for r1 m1 l y
definition eq_mon :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "eq_mon m1 m2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> a). mon m1 y = mon m2 y)" for m1 m2
definition eq' :: "m list \<Rightarrow> m list \<Rightarrow> _"
  where "eq' x1 x2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> a). interp' x1 y = interp' x2 y)" for x1 x2
definition append_mon :: "m \<Rightarrow> m \<Rightarrow> m"
  where "append_mon m1 m2 = (case (m1, m2) of (M r1 l1, M r2 l2) \<Rightarrow> M (rtimes r1 r2) (l1 @ l2))" for m1 m2
axiomatization where append_mon'spec:   "interp' (Cons (append_mon m1 m2) (Nil :: m list)) y = atimes (interp' (Cons m1 (Nil :: m list)) y) (interp' (Cons m2 (Nil :: m list)) y)"
  for m1 :: "m"
  and m2 :: "m"
  and y :: "int \<Rightarrow> a"
fun mul_mon :: "m \<Rightarrow> m list \<Rightarrow> m list"
  where "mul_mon mon1 (Nil :: m list) = (Nil :: m list)" for mon1
      | "mul_mon mon1 (Cons m1 l) = Cons (append_mon mon1 m1) (mul_mon mon1 l)" for mon1 m1 l
axiomatization where mul_mon'spec:   "interp' (mul_mon mon1 x) y = atimes (interp' (Cons mon1 (Nil :: m list)) y) (interp' x y)"
  for mon1 :: "m"
  and x :: "m list"
  and y :: "int \<Rightarrow> a"
fun mul_devel :: "m list \<Rightarrow> m list \<Rightarrow> m list"
  where "mul_devel (Nil :: m list) x2 = (Nil :: m list)" for x2
      | "mul_devel (Cons (M r1 m1) l) x2 = mul_mon (M r1 m1) x2 @ mul_devel l x2" for r1 m1 l x2
axiomatization where mul_devel'spec:   "interp' (mul_devel x1 x2) y = atimes (interp' x1 y) (interp' x2 y)"
  for x1 :: "m list"
  and x2 :: "m list"
  and y :: "int \<Rightarrow> a"
fun ext :: "r \<Rightarrow> m list \<Rightarrow> m list"
  where "ext c (Nil :: m list) = (Nil :: m list)" for c
      | "ext c (Cons (M r1 m1) l) = Cons (M (rtimes c r1) m1) (ext c l)" for c r1 m1 l
axiomatization where ext'spec:   "interp' (ext c x) y = infix_dl c (interp' x y)"
  for c :: "r"
  and x :: "m list"
  and y :: "int \<Rightarrow> a"
fun conv :: "t \<Rightarrow> m list"
  where "conv (Var v) = Cons (M rone (Cons v (Nil :: int list))) (Nil :: m list)" for v
      | "conv (Add x1 x2) = conv x1 @ conv x2" for x1 x2
      | "conv (Mul x1 x2) = mul_devel (conv x1) (conv x2)" for x1 x2
      | "conv (Ext r1 x1) = ext r1 (conv x1)" for r1 x1
      | "conv (Sub x1 x2) = conv x1 @ ext (ropp rone) (conv x2)" for x1 x2
axiomatization where conv'spec:   "interp x y = interp' (conv x) y"
  for x :: "t"
  and y :: "int \<Rightarrow> a"
fun le_mon :: "int list \<Rightarrow> int list \<Rightarrow> bool"
  where "le_mon (Nil :: int list) x = (if length (Nil :: int list) < length x then True else if length (Nil :: int list) = length x then True else False)" for x
      | "le_mon x (Nil :: int list) = (if length x < length (Nil :: int list) then True else False)" for x
      | "le_mon (Cons v1 r1) (Cons v2 r2) = (if length (Cons v1 r1) < length (Cons v2 r2) then True else if length (Cons v1 r1) = length (Cons v2 r2) then if v1 < v2 then True else if v1 = v2 then le_mon r1 r2 else False else False)" for v1 r1 v2 r2
fun same :: "int list \<Rightarrow> int list \<Rightarrow> bool"
  where "same (Nil :: int list) (Nil :: int list) = True"
      | "same (Nil :: int list) x = False" for x
      | "same x (Nil :: int list) = False" for x
      | "same (Cons x1 l11) (Cons x2 l21) = (if x1 = x2 then same l11 l21 else False)" for x1 l11 x2 l21
axiomatization where same'spec:   "eq_mon l1 l2"
 if "same l1 l2 = True"
  for l1 :: "int list"
  and l2 :: "int list"
theorem squash_append'vc:
  fixes l1 :: "int list"
  fixes l2 :: "int list"
  fixes r1 :: "r"
  fixes r2 :: "r"
  fixes l :: "m list"
  assumes fact0: "same l1 l2 = True"
  shows "eq' (Cons (M r1 l1) (Cons (M r2 l2) l)) (Cons (M (rplus r1 r2) l1) l)"
  sorry
end
