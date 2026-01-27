theory dyck_Dyck
  imports "NTP4Verif.NTP4Verif"
begin
datatype  paren = L | R
inductive dyck :: "paren list \<Rightarrow> bool" where
   Dyck_nil: "dyck (Nil :: paren list)"
 | Dyck_ind: "dyck w1 \<Longrightarrow> dyck w2 \<Longrightarrow> dyck (Cons L (w1 @ Cons R w2))" for w1 :: "paren list" and w2 :: "paren list"
end
