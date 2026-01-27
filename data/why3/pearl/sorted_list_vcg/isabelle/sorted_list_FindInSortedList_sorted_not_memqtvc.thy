theory sorted_list_FindInSortedList_sorted_not_memqtvc
  imports "NTP4Verif.NTP4Verif"
begin
theorem sorted_not_mem'vc:
  fixes x :: "int"
  fixes y :: "int"
  fixes l :: "int list"
  assumes fact0: "x < y"
  assumes fact1: "sorted (Cons y l)"
  shows "\<not>x \<in> set (Cons y l)"
  sorry
end
