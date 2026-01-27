theory ringdecision_Tests_g
  imports "NTP4Verif.NTP4Verif"
begin
axiomatization where Assoc:   "x + y + z = x + (y + z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Unit_def_l:   "(0 :: int) + x = x"
  for x :: "int"
axiomatization where Unit_def_r:   "x + (0 :: int) = x"
  for x :: "int"
axiomatization where Inv_def_l:   "-x + x = (0 :: int)"
  for x :: "int"
axiomatization where Inv_def_r:   "x + -x = (0 :: int)"
  for x :: "int"
axiomatization where Comm:   "x + y = y + x"
  for x :: "int"
  and y :: "int"
axiomatization where Assoc1:   "x * y * z = x * (y * z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Mul_distr_l:   "x * (y + z) = x * y + x * z"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Mul_distr_r:   "(y + z) * x = y * x + z * x"
  for y :: "int"
  and z :: "int"
  and x :: "int"
axiomatization where Comm1:   "x * y = y * x"
  for x :: "int"
  and y :: "int"
axiomatization where Unitary:   "(1 :: int) * x = x"
  for x :: "int"
axiomatization where NonTrivialRing:   "\<not>(0 :: int) = (1 :: int)"
axiomatization where Assoc2:   "x + y + z = x + (y + z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Unit_def_l1:   "(0 :: int) + x = x"
  for x :: "int"
axiomatization where Unit_def_r1:   "x + (0 :: int) = x"
  for x :: "int"
axiomatization where Inv_def_l1:   "-x + x = (0 :: int)"
  for x :: "int"
axiomatization where Inv_def_r1:   "x + -x = (0 :: int)"
  for x :: "int"
axiomatization where Comm2:   "x + y = y + x"
  for x :: "int"
  and y :: "int"
axiomatization where Assoc3:   "x * y * z = x * (y * z)"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Mul_distr_l1:   "x * (y + z) = x * y + x * z"
  for x :: "int"
  and y :: "int"
  and z :: "int"
axiomatization where Mul_distr_r1:   "(y + z) * x = y * x + z * x"
  for y :: "int"
  and z :: "int"
  and x :: "int"
axiomatization where Comm3:   "x * y = y * x"
  for x :: "int"
  and y :: "int"
axiomatization where Unitary1:   "(1 :: int) * x = x"
  for x :: "int"
axiomatization where NonTrivialRing1:   "\<not>(0 :: int) = (1 :: int)"
datatype  t = Var "int" | Add "t" "t" | Mul "t" "t" | Cst "int"
typedecl  vars
fun interp :: "t \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp (Var n) y = y n" for n y
      | "interp (Add x1 x2) y = interp x1 y + interp x2 y" for x1 x2 y
      | "interp (Mul x1 x2) y = interp x1 y * interp x2 y" for x1 x2 y
      | "interp (Cst c) y = c" for c y
definition eq :: "t \<Rightarrow> t \<Rightarrow> _"
  where "eq x1 x2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> int). interp x1 y = interp x2 y)" for x1 x2
datatype  m = M "int" "int list"
typedecl  t'
fun mon :: "int list \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "mon (Nil :: int list) y = (1 :: int)" for y
      | "mon (Cons x1 r) y = y x1 * mon r y" for x1 r y
fun interp' :: "m list \<Rightarrow> (int \<Rightarrow> int) \<Rightarrow> int"
  where "interp' (Nil :: m list) y = (0 :: int)" for y
      | "interp' (Cons (M a m1) r) y = a * mon m1 y + interp' r y" for a m1 r y
definition eq_mon :: "int list \<Rightarrow> int list \<Rightarrow> _"
  where "eq_mon m1 m2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> int). mon m1 y = mon m2 y)" for m1 m2
definition eq' :: "m list \<Rightarrow> m list \<Rightarrow> _"
  where "eq' x1 x2 \<longleftrightarrow> (\<forall>(y :: int \<Rightarrow> int). interp' x1 y = interp' x2 y)" for x1 x2
definition append_mon :: "m \<Rightarrow> m \<Rightarrow> m"
  where "append_mon m1 m2 = (case (m1, m2) of (M a1 l1, M a2 l2) \<Rightarrow> M (a1 * a2) (l1 @ l2))" for m1 m2
axiomatization where append_mon'spec:   "interp' (Cons (append_mon m1 m2) (Nil :: m list)) y = interp' (Cons m1 (Nil :: m list)) y * interp' (Cons m2 (Nil :: m list)) y"
  for m1 :: "m"
  and m2 :: "m"
  and y :: "int \<Rightarrow> int"
fun mul_mon :: "m list \<Rightarrow> m \<Rightarrow> m list"
  where "mul_mon (Nil :: m list) mon1 = (Nil :: m list)" for mon1
      | "mul_mon (Cons m1 r) mon1 = Cons (append_mon m1 mon1) (mul_mon r mon1)" for m1 r mon1
axiomatization where mul_mon'spec:   "interp' (mul_mon x mon1) y = interp' x y * interp' (Cons mon1 (Nil :: m list)) y"
  for x :: "m list"
  and mon1 :: "m"
  and y :: "int \<Rightarrow> int"
fun mul_devel :: "m list \<Rightarrow> m list \<Rightarrow> m list"
  where "mul_devel (Nil :: m list) x2 = (Nil :: m list)" for x2
      | "mul_devel (Cons (M a m1) r) x2 = mul_mon x2 (M a m1) @ mul_devel r x2" for a m1 r x2
axiomatization where mul_devel'spec:   "interp' (mul_devel x1 x2) y = interp' x1 y * interp' x2 y"
  for x1 :: "m list"
  and x2 :: "m list"
  and y :: "int \<Rightarrow> int"
fun conv :: "t \<Rightarrow> m list"
  where "conv (Var v) = Cons (M (1 :: int) (Cons v (Nil :: int list))) (Nil :: m list)" for v
      | "conv (Add x1 x2) = conv x1 @ conv x2" for x1 x2
      | "conv (Mul x1 x2) = mul_devel (conv x1) (conv x2)" for x1 x2
      | "conv (Cst n) = Cons (M n (Nil :: int list)) (Nil :: m list)" for n
axiomatization where conv'spec:   "interp x y = interp' (conv x) y"
  for x :: "t"
  and y :: "int \<Rightarrow> int"
fun insert :: "int \<Rightarrow> int list \<Rightarrow> int list"
  where "insert x (Nil :: int list) = Cons x (Nil :: int list)" for x
      | "insert x (Cons y r) = (if x \<le> y then Cons x (Cons y r) else Cons y (insert x r))" for x y r
axiomatization where insert'spec:   "eq_mon (Cons x l) (insert x l)"
  for x :: "int"
  and l :: "int list"
fun insertion_sort :: "int list \<Rightarrow> int list"
  where "insertion_sort (Nil :: int list) = (Nil :: int list)"
      | "insertion_sort (Cons x r) = insert x (insertion_sort r)" for x r
axiomatization where insertion_sort'spec:   "eq_mon l (insertion_sort l)"
  for l :: "int list"
definition sort_mon :: "m \<Rightarrow> m"
  where "sort_mon x = (case x of M a m1 \<Rightarrow> M a (insertion_sort m1))" for x
axiomatization where sort_mon'spec:   "eq' (Cons x (Nil :: m list)) (Cons (sort_mon x) (Nil :: m list))"
  for x :: "m"
fun sort_mons :: "m list \<Rightarrow> m list"
  where "sort_mons (Nil :: m list) = (Nil :: m list)"
      | "sort_mons (Cons m1 r) = Cons (sort_mon m1) (sort_mons r)" for m1 r
axiomatization where sort_mons'spec:   "eq' (sort_mons x) x"
  for x :: "m list"
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
fun insert_mon :: "m \<Rightarrow> m list \<Rightarrow> m list"
  where "insert_mon x (Nil :: m list) = Cons x (Nil :: m list)" for x
      | "insert_mon (M a1 l1) (Cons (M a2 l2) r) = (if same l1 l2 = True then let s :: int = a1 + a2 in if s = (0 :: int) then r else Cons (M s l1) r else if le_mon l1 l2 = True then Cons (M a1 l1) (Cons (M a2 l2) r) else Cons (M a2 l2) (insert_mon (M a1 l1) r))" for a1 l1 a2 l2 r
axiomatization where insert_mon'spec:   "eq' (insert_mon m1 x) (Cons m1 x)"
  for m1 :: "m"
  and x :: "m list"
fun insertion_sort_mon :: "m list \<Rightarrow> m list"
  where "insertion_sort_mon (Nil :: m list) = (Nil :: m list)"
      | "insertion_sort_mon (Cons m1 r) = insert_mon m1 (insertion_sort_mon r)" for m1 r
axiomatization where insertion_sort_mon'spec:   "eq' (insertion_sort_mon x) x"
  for x :: "m list"
definition normalize :: "m list \<Rightarrow> m list"
  where "normalize x = insertion_sort_mon (sort_mons x)" for x
axiomatization where normalize'spec:   "eq' (normalize x) x"
  for x :: "m list"
theorem g:
  fixes x :: "int"
  shows "(x + (3 :: int)) * (x + (2 :: int)) = x * x + (5 :: int) * x + (6 :: int)"
  sorry
end
