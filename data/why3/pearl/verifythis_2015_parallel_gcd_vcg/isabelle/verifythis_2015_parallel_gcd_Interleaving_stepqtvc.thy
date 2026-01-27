theory verifythis_2015_parallel_gcd_Interleaving_stepqtvc
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
theorem step'vc:
  fixes th :: "thread"
  fixes d :: "int"
  fixes a :: "int"
  fixes b :: "int"
  assumes fact0: "inv th d a b"
  shows "case state1 th of ReadA \<Rightarrow> (\<forall>(th1 :: thread). local_a th1 = a \<and> local_b th1 = local_b th \<and> state1 th1 = state1 th \<longrightarrow> (\<forall>(th2 :: thread). local_a th2 = local_a th1 \<and> local_b th2 = local_b th1 \<and> state1 th2 = ReadB \<longrightarrow> inv th2 d a b \<and> ((0 :: int) < a \<and> a \<le> a) \<and> (a < a \<longrightarrow> a + b \<le> a) \<and> (progress_thread th2 a b \<longrightarrow> prog_index th2 b < prog_index th b \<or> a < a))) | ReadB \<Rightarrow> (\<forall>(th1 :: thread). local_a th1 = local_a th \<and> local_b th1 = b \<and> state1 th1 = state1 th \<longrightarrow> (\<forall>(th2 :: thread). local_a th2 = local_a th1 \<and> local_b th2 = local_b th1 \<and> state1 th2 = Compare \<longrightarrow> inv th2 d a b \<and> ((0 :: int) < a \<and> a \<le> a) \<and> (a < a \<longrightarrow> a + b \<le> a) \<and> (progress_thread th2 a b \<longrightarrow> prog_index th2 b < prog_index th b \<or> a < a))) | Compare \<Rightarrow> (if local_a th = local_b th then \<forall>(th1 :: thread). local_a th1 = local_a th \<and> local_b th1 = local_b th \<and> state1 th1 = Halt \<longrightarrow> inv th1 d a b \<and> ((0 :: int) < a \<and> a \<le> a) \<and> (a < a \<longrightarrow> a + b \<le> a) \<and> (progress_thread th1 a b \<longrightarrow> prog_index th1 b < prog_index th b \<or> a < a) else if local_b th < local_a th then \<forall>(th1 :: thread). local_a th1 = local_a th \<and> local_b th1 = local_b th \<and> state1 th1 = ReadA \<longrightarrow> inv th1 d (local_a th - local_b th) b \<and> ((0 :: int) < local_a th - local_b th \<and> local_a th - local_b th \<le> a) \<and> (local_a th - local_b th < a \<longrightarrow> local_a th - local_b th + b \<le> a) \<and> (progress_thread th1 (local_a th - local_b th) b \<longrightarrow> prog_index th1 b < prog_index th b \<or> local_a th - local_b th < a) else \<forall>(th1 :: thread). local_a th1 = local_a th \<and> local_b th1 = local_b th \<and> state1 th1 = ReadA \<longrightarrow> inv th1 d a b \<and> ((0 :: int) < a \<and> a \<le> a) \<and> (a < a \<longrightarrow> a + b \<le> a) \<and> (progress_thread th1 a b \<longrightarrow> prog_index th1 b < prog_index th b \<or> a < a)) | Halt \<Rightarrow> inv th d a b \<and> ((0 :: int) < a \<and> a \<le> a) \<and> (a < a \<longrightarrow> a + b \<le> a) \<and> (progress_thread th a b \<longrightarrow> prog_index th b < prog_index th b \<or> a < a)"
  sorry
end
