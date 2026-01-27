theory ropes_Rope_emptyqtvc
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
theorem empty'vc:
  shows "let result :: rope = Emp in length result = (0 :: int) \<and> inv result \<and> infix_eqeq (string result) empty"
  sorry
end
