theory vstte10_inverting_InvertingAnInjection
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_MapInjection"
begin
definition injective :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "injective a n \<longleftrightarrow> map_MapInjection.injective (nth a o nat) n" for a n
definition surjective :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "surjective a n \<longleftrightarrow> map_MapInjection.surjective (nth a o nat) n" for a n
definition range :: "int list \<Rightarrow> int \<Rightarrow> _"
  where "range a n \<longleftrightarrow> map_MapInjection.range (nth a o nat) n" for a n
end
