theory ropes_Rope_of_stringqtvc
  imports "NTP4Verif.NTP4Verif" "./ropes_MyString"
begin
datatype  rope = Emp | Str "char_string" "int" "int" | App "rope" "rope" "int"
definition length :: "rope \<Rightarrow> int"
  where "length r = (case r of Emp \<Rightarrow> (0 :: int) | Str _ _ len \<Rightarrow> len | App _ _ len \<Rightarrow> len)" for r
fun inv :: "rope \<Rightarrow> _"
  where "inv Emp = True"
      | "inv (Str s ofs len) = ((0 :: int) < len \<and> ((0 :: int) \<le> ofs \<and> ofs < ropes_MyString.length s) \<and> ofs + len \<le> ropes_MyString.length s)" for s ofs len
      | "inv (App l r1 len) = ((0 :: int) < length l \<and> inv l \<and> (0 :: int) < length r1 \<and> inv r1 \<and> len = length l + length r1)" for l r1 len
fun string :: "rope \<Rightarrow> char_string"
  where "string Emp = empty"
      | "string (Str s ofs len) = sub s ofs len" for s ofs len
      | "string (App l r1 x) = app (string l) (string r1)" for l r1 x
consts empty :: "rope"
axiomatization where empty'def'0:   "length empty = (0 :: int)"
axiomatization where empty'def'1:   "inv empty"
axiomatization where empty'def'2:   "infix_eqeq (string empty) ropes_MyString.empty"
theorem of_string'vc:
  fixes s :: "char_string"
  assumes fact0: "(0 :: int) \<le> ropes_MyString.length s"
  shows "let o1 :: int = ropes_MyString.length s in (0 :: int) \<le> o1 \<longrightarrow> (\<forall>(result :: rope). (if o1 = (0 :: int) then result = Emp else let o2 :: int = ropes_MyString.length s in (0 :: int) \<le> o2 \<and> result = Str s (0 :: int) o2) \<longrightarrow> infix_eqeq (string result) s \<and> inv result)"
  sorry
end
