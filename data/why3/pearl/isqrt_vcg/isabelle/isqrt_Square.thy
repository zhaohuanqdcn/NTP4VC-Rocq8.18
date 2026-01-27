theory isqrt_Square
  imports "NTP4Verif.NTP4Verif"
begin
definition sqr :: "int \<Rightarrow> int"
  where "sqr x = x * x" for x
definition isqrt_spec :: "int \<Rightarrow> int \<Rightarrow> _"
  where "isqrt_spec x res \<longleftrightarrow> (0 :: int) \<le> res \<and> sqr res \<le> x \<and> x < sqr (res + (1 :: int))" for x res
end
