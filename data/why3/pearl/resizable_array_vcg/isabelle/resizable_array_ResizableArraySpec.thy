theory resizable_array_ResizableArraySpec
  imports "NTP4Verif.NTP4Verif" "Why3STD.map_Const"
begin
typedecl 'a rarray
consts length :: "'a rarray \<Rightarrow> int"
consts data :: "'a rarray \<Rightarrow> int \<Rightarrow> 'a"
definition mixfix_lbrb :: "'a rarray \<Rightarrow> int \<Rightarrow> 'a"
  where "mixfix_lbrb r i = data r i" for r i
consts mixfix_lblsmnrb :: "'a rarray \<Rightarrow> int \<Rightarrow> 'a \<Rightarrow> 'a rarray"
axiomatization where mixfix_lblsmnrb'spec'0:   "length (mixfix_lblsmnrb r i v) = length r"
  for r :: "'a rarray"
  and i :: "int"
  and v :: "'a"
axiomatization where mixfix_lblsmnrb'spec:   "data (mixfix_lblsmnrb r i v) = (data r)(i := v)"
  for r :: "'a rarray"
  and i :: "int"
  and v :: "'a"
end
