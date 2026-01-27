theory unraveling_a_card_trick_GilbreathCardTrickPure
  imports "NTP4Verif.NTP4Verif"
begin
consts m :: "int"
axiomatization where m_positive:   "(0 :: int) < m"
consts n :: "int"
axiomatization where n_nonnegative:   "(0 :: int) \<le> n"
inductive shuffle :: "'a list \<Rightarrow> 'a list \<Rightarrow> 'a list \<Rightarrow> bool" where
   Shuffle_nil_left: "shuffle l (Nil :: 'a list) l" for l :: "'a list"
 | Shuffle_nil_right: "shuffle (Nil :: 'a list) l l" for l :: "'a list"
 | Shuffle_cons_left: "shuffle a b c \<Longrightarrow> shuffle (Cons x a) b (Cons x c)" for a :: "'a list" and b :: "'a list" and c :: "'a list" and x :: "'a"
 | Shuffle_cons_right: "shuffle a b c \<Longrightarrow> shuffle a (Cons x b) (Cons x c)" for a :: "'a list" and b :: "'a list" and c :: "'a list" and x :: "'a"
definition suit_ordered :: "int list \<Rightarrow> _"
  where "suit_ordered l \<longleftrightarrow> (\<forall>(i :: int) (j :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> j \<and> j < m \<longrightarrow> nth_opt l (i * m + j) = Some j)" for l
definition suit_sorted :: "int list \<Rightarrow> _"
  where "suit_sorted l \<longleftrightarrow> (\<forall>(i :: int) (v :: int). nth_opt l i = Some v \<longrightarrow> (0 :: int) \<le> v \<and> v < m) \<and> (\<forall>(i :: int) (j1 :: int) (j2 :: int). (0 :: int) \<le> i \<and> i < n \<longrightarrow> (0 :: int) \<le> j1 \<and> j1 < m \<longrightarrow> (0 :: int) \<le> j2 \<and> j2 < m \<longrightarrow> \<not>nth_opt l (i * m + j1) = nth_opt l (i * m + j2))" for l
axiomatization where gilbreath_card_trick:   "suit_sorted b"
 if "int (length a) = n * m"
 and "suit_ordered a"
 and "a = c @ d"
 and "shuffle c (rev d) b"
  for a :: "int list"
  and c :: "int list"
  and d :: "int list"
  and b :: "int list"
end
