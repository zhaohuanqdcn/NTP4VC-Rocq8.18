theory unraveling_a_card_trick_GilbreathCardTrickPure_shuffle_symqtvc
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
theorem shuffle_sym'vc:
  fixes a :: "'a list"
  fixes b :: "'a list"
  fixes c :: "'a list"
  assumes fact0: "shuffle a b c"
  shows "shuffle b a c"
  sorry
end
