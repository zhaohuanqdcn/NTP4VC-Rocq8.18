theory ropes_Rope_is_emptyqtvc
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
theorem is_empty'vc:
  fixes r :: "rope"
  fixes result :: "bool"
  assumes fact0: "inv r"
  assumes fact1: "case r of Emp \<Rightarrow> result = True | _ \<Rightarrow> result = False"
  shows "result = True \<longleftrightarrow> infix_eqeq (string r) ropes_MyString.empty"
  sorry
end
