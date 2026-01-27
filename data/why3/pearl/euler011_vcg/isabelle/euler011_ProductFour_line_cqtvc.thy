theory euler011_ProductFour_line_cqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref" "Why3STD.matrix_Matrix"
begin
datatype  direction = Left_bottom | Right_bottom | Bottom | Right
definition left_diag :: "int matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int option"
  where "left_diag m i j = (if i < rows m \<and> (0 :: int) \<le> j \<and> (3 :: int) \<le> i \<and> j < columns m - (3 :: int) then Some (elts m i j * elts m (i - (1 :: int)) (j + (1 :: int)) * elts m (i - (2 :: int)) (j + (2 :: int)) * elts m (i - (3 :: int)) (j + (3 :: int))) else None)" for m i j
definition right_diag :: "int matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int option"
  where "right_diag m i j = (if i < rows m - (3 :: int) \<and> (0 :: int) \<le> i \<and> j < columns m - (3 :: int) \<and> (0 :: int) \<le> j then Some (elts m i j * elts m (i + (1 :: int)) (j + (1 :: int)) * elts m (i + (2 :: int)) (j + (2 :: int)) * elts m (i + (3 :: int)) (j + (3 :: int))) else None)" for m i j
definition line :: "int matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int option"
  where "line m i j = (if ((0 :: int) \<le> j \<and> j < columns m) \<and> (0 :: int) \<le> i \<and> i < rows m - (3 :: int) then Some (elts m i j * elts m (i + (1 :: int)) j * elts m (i + (2 :: int)) j * elts m (i + (3 :: int)) j) else None)" for m i j
definition column :: "int matrix \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int option"
  where "column m i j = (if ((0 :: int) \<le> i \<and> i < rows m) \<and> (0 :: int) \<le> j \<and> j < columns m - (3 :: int) then Some (elts m i j * elts m i (j + (1 :: int)) * elts m i (j + (2 :: int)) * elts m i (j + (3 :: int))) else None)" for m i j
theorem line_c'vc:
  fixes j :: "int"
  fixes m :: "int matrix"
  fixes i :: "int"
  fixes o1 :: "bool"
  assumes fact0: "if (0 :: int) \<le> j then if j < columns m then if (0 :: int) \<le> i then o1 = (if i < rows m - (3 :: int) then True else False) else o1 = False else o1 = False else o1 = False"
  shows "o1 = True \<longrightarrow> valid_index m (i + (3 :: int)) j \<and> valid_index m (i + (2 :: int)) j \<and> valid_index m (i + (1 :: int)) j \<and> valid_index m i j"
  and "\<forall>(result :: int option). (if o1 = True then result = Some (elts m i j * elts m (i + (1 :: int)) j * elts m (i + (2 :: int)) j * elts m (i + (3 :: int)) j) else result = None) \<longrightarrow> result = line m i j"
  sorry
end
