theory zeros_AllZeros_all_zeros5qtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
definition all_zeros :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "all_zeros a hi \<longleftrightarrow> (\<forall>(i :: int). (0 :: int) \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a hi
definition zero_interval :: "int list \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "zero_interval a lo hi \<longleftrightarrow> (\<forall>(i :: int). lo \<le> i \<and> i < hi \<longrightarrow> a ! nat i = (0 :: int))" for a lo hi
theorem all_zeros5'vc:
  fixes a :: "int list"
  shows "\<forall>(lo :: int) (hi :: int). (0 :: int) \<le> lo \<and> lo \<le> hi \<and> hi \<le> int (length a) \<longrightarrow> (\<not>hi \<le> lo \<longrightarrow> \<not>(2 :: int) = (0 :: int) \<and> (let mid :: int = lo + (hi - lo) cdiv (2 :: int) in ((0 :: int) \<le> mid \<and> mid < int (length a)) \<and> (a ! nat mid = (0 :: int) \<longrightarrow> (((0 :: int) \<le> hi - lo \<and> mid - lo < hi - lo) \<and> (0 :: int) \<le> lo \<and> lo \<le> mid \<and> mid \<le> int (length a)) \<and> (zero_interval a lo mid \<longrightarrow> (let o1 :: int = mid + (1 :: int) in ((0 :: int) \<le> hi - lo \<and> hi - o1 < hi - lo) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> hi \<and> hi \<le> int (length a)))))) \<and> (\<forall>(result :: bool). (if hi \<le> lo then result = True else let mid :: int = lo + (hi - lo) cdiv (2 :: int) in if a ! nat mid = (0 :: int) then if zero_interval a lo mid then result = (if zero_interval a (mid + (1 :: int)) hi then True else False) else result = False else result = False) \<longrightarrow> result = True \<longleftrightarrow> zero_interval a lo hi)"
  and "let o1 :: int = int (length a) in ((0 :: int) \<le> (0 :: int) \<and> (0 :: int) \<le> o1 \<and> o1 \<le> int (length a)) \<and> (zero_interval a (0 :: int) o1 \<longleftrightarrow> all_zeros a (int (length a)))"
  sorry
end
