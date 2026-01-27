theory matrix_Matrix
  imports "NTP4Verif.NTP4Verif"
begin
typedecl 'a matrix
consts elts :: "'a matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> 'a"
consts rows :: "'a matrix \<Rightarrow> int"
consts columns :: "'a matrix \<Rightarrow> int"
axiomatization where matrix'invariant'0:   "(0 :: int) \<le> rows self"
  for self :: "'a matrix"
axiomatization where matrix'invariant'1:   "(0 :: int) \<le> columns self"
  for self :: "'a matrix"
definition valid_index :: "'a matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "valid_index a r c \<longleftrightarrow> ((0 :: int) \<le> r \<and> r < rows a) \<and> (0 :: int) \<le> c \<and> c < columns a" for a r c
definition get :: "'a matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> 'a"
  where "get a r c = elts a r c" for a r c
consts update :: "'a matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> 'a \<Rightarrow> 'a matrix"
axiomatization where update'spec'1:   "rows (update a r c v) = rows a"
  for a :: "'a matrix"
  and r :: "int"
  and c :: "int"
  and v :: "'a"
axiomatization where update'spec'0:   "columns (update a r c v) = columns a"
  for a :: "'a matrix"
  and r :: "int"
  and c :: "int"
  and v :: "'a"
axiomatization where update'spec:   "elts (update a r c v) = (elts a)(r := (elts a r)(c := v))"
  for a :: "'a matrix"
  and r :: "int"
  and c :: "int"
  and v :: "'a"
end
