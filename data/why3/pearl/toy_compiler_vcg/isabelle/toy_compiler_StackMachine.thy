theory toy_compiler_StackMachine
  imports "NTP4Verif.NTP4Verif"
begin
datatype  asm = Push "int" | Add | Sub | Mul
typedecl  code
typedecl  stack
fun compute :: "int list \<Rightarrow> asm list \<Rightarrow> int list"
  where "compute s (Nil :: asm list) = s" for s
      | "compute s (Cons a1 r) = (case (a1, s) of (Push n, _) \<Rightarrow> compute (Cons n s) r | (Add, Cons n1 (Cons n2 s1)) \<Rightarrow> compute (Cons (n2 + n1) s1) r | (Sub, Cons n1 (Cons n2 s1)) \<Rightarrow> compute (Cons (n2 - n1) s1) r | (Mul, Cons n1 (Cons n2 s1)) \<Rightarrow> compute (Cons (n2 * n1) s1) r | _ \<Rightarrow> s)" for s a1 r
end
