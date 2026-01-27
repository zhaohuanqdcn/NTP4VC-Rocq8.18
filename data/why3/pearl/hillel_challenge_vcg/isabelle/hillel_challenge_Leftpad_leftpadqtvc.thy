theory hillel_challenge_Leftpad_leftpadqtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
typedecl  char_string
theorem leftpad'vc:
  fixes n :: "int"
  fixes s :: "char list"
  fixes pad :: "char"
  shows "let len :: int = max n (int (length s)) in (0 :: int) \<le> len \<and> (\<forall>(res :: char list). (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < len \<longrightarrow> res ! nat i = pad) \<and> int (length res) = len \<longrightarrow> (let o1 :: int = int (length s); o2 :: int = len - int (length s) in (((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> (0 :: int) + o1 \<le> int (length s)) \<and> (0 :: int) \<le> o2 \<and> o2 + o1 \<le> int (length res)) \<and> (\<forall>(res1 :: char list). length res1 = length res \<longrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < o2 \<or> o2 + o1 \<le> i \<and> i < int (length res1) \<longrightarrow> res1 ! nat i = res ! nat i) \<and> (\<forall>(i :: int). o2 \<le> i \<and> i < o2 + o1 \<longrightarrow> res1 ! nat i = s ! nat ((0 :: int) + i - o2)) \<longrightarrow> int (length res1) = max n (int (length s)) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length res1) - int (length s) \<longrightarrow> res1 ! nat i = pad) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length s) \<longrightarrow> res1 ! nat (int (length res1) - (1 :: int) - i) = s ! nat (int (length s) - (1 :: int) - i)))))"
  sorry
end
