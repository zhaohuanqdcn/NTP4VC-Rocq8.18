theory verifythis_2015_parallel_gcd_Interleaving_can_progressqtvc
  imports "NTP4Verif.NTP4Verif" "Why3STD.Ref_Ref"
begin
datatype  state = ReadA | ReadB | Compare | Halt
datatype  thread = thread'mk (local_a: "int") (local_b: "int") (state1: "state")
definition inv :: "thread \<Rightarrow> int \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "inv th d a b \<longleftrightarrow> (0 :: int) < a \<and> (0 :: int) < b \<and> gcd a b = d \<and> (case state1 th of ReadA \<Rightarrow> True | ReadB \<Rightarrow> local_a th = a | Compare \<Rightarrow> local_a th = a \<and> b \<le> local_b th \<and> (local_b th \<le> local_a th \<longrightarrow> local_b th = b) | Halt \<Rightarrow> local_a th = a \<and> a = b)" for th d a b
definition progress_thread :: "thread \<Rightarrow> int \<Rightarrow> int \<Rightarrow> _"
  where "progress_thread th a b \<longleftrightarrow> b < a \<or> a = b \<and> \<not>state1 th = Halt" for th a b
definition state_index :: "state \<Rightarrow> int"
  where "state_index s = (case s of ReadA \<Rightarrow> (7 :: int) | ReadB \<Rightarrow> (5 :: int) | Compare \<Rightarrow> (3 :: int) | Halt \<Rightarrow> (2 :: int))" for s
definition sync :: "thread \<Rightarrow> int \<Rightarrow> _"
  where "sync th b \<longleftrightarrow> (case state1 th of Compare \<Rightarrow> local_b th = b | _ \<Rightarrow> True)" for th b
definition sync_index :: "thread \<Rightarrow> int \<Rightarrow> int"
  where "sync_index th b = (if sync th b then 0 :: int else (42 :: int))" for th b
definition prog_index :: "thread \<Rightarrow> int \<Rightarrow> int"
  where "prog_index th b = sync_index th b + state_index (state1 th)" for th b
theorem can_progress'vc:
  fixes s :: "state"
  fixes result :: "bool"
  assumes fact0: "case s of Halt \<Rightarrow> result = False | _ \<Rightarrow> result = True"
  shows "result = True \<longleftrightarrow> \<not>s = Halt"
  sorry
end
