theory verifythis_2024_challenge0_Top_concat2qtvc
  imports "NTP4Verif.NTP4Verif"
begin
typedecl  char
typedecl  str
datatype  rope = Leaf "char list" | Node "int" "rope" "rope"
fun to_str :: "rope \<Rightarrow> char list"
  where "to_str (Leaf s) = s" for s
      | "to_str (Node x rl rr) = to_str rl @ to_str rr" for x rl rr
fun valid :: "rope \<Rightarrow> _"
  where "valid (Leaf x_s) = True" for x_s
      | "valid (Node wl rl rr) = (wl = int (length (to_str rl)) \<and> valid rl \<and> valid rr)" for wl rl rr
consts is_short :: "char list \<Rightarrow> bool"
theorem concat2'vc:
  fixes left1 :: "rope"
  fixes right1 :: "rope"
  assumes fact0: "valid left1"
  assumes fact1: "valid right1"
  shows "case right1 of Leaf sr \<Rightarrow> (if is_short sr then case left1 of Leaf sl \<Rightarrow> \<not>is_short sl \<longrightarrow> valid left1 \<and> valid right1 | Node wl rl (Leaf sl) \<Rightarrow> \<not>is_short sl \<longrightarrow> valid left1 \<and> valid right1 | _ \<Rightarrow> valid left1 \<and> valid right1 else valid left1 \<and> valid right1) | _ \<Rightarrow> valid left1 \<and> valid right1"
  and "\<forall>(result :: rope). (case right1 of Leaf sr \<Rightarrow> (if is_short sr then case left1 of Leaf sl \<Rightarrow> (if is_short sl then let o1 :: char list = sl @ sr in (int (length o1) = int (length sl) + int (length sr) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length sl) \<longrightarrow> o1 ! nat i = sl ! nat i) \<and> (\<forall>(i :: int). int (length sl) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = sr ! nat (i - int (length sl)))) \<and> result = Leaf o1 else valid result \<and> to_str result = to_str left1 @ to_str right1) | Node wl rl (Leaf sl) \<Rightarrow> (if is_short sl then let o1 :: char list = sl @ sr in (int (length o1) = int (length sl) + int (length sr) \<and> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < int (length sl) \<longrightarrow> o1 ! nat i = sl ! nat i) \<and> (\<forall>(i :: int). int (length sl) \<le> i \<and> i < int (length o1) \<longrightarrow> o1 ! nat i = sr ! nat (i - int (length sl)))) \<and> result = Node wl rl (Leaf o1) else valid result \<and> to_str result = to_str left1 @ to_str right1) | _ \<Rightarrow> valid result \<and> to_str result = to_str left1 @ to_str right1 else valid result \<and> to_str result = to_str left1 @ to_str right1) | _ \<Rightarrow> valid result \<and> to_str result = to_str left1 @ to_str right1) \<longrightarrow> valid result \<and> to_str result = to_str left1 @ to_str right1"
  sorry
end
