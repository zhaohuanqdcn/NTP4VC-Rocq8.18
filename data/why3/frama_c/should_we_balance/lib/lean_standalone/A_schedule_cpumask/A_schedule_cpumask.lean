namespace A_schedule_cpumask
axiom l_idle_cpu : ℤ -> ℤ
axiom l_sched_group_cpus : Memory.addr -> Memory.addr
axiom l_sched_group_mask : Memory.addr -> Memory.addr
axiom l_group_balance_mask : Memory.addr -> Memory.addr
axiom l_group_balance_cpu : Memory.addr -> ℤ
axiom l_cpu_smt_mask : ℤ -> Memory.addr
noncomputable def p_idle_core (mptr_0 : Memory.addr -> Memory.addr) (mint_0 : Memory.addr -> ℤ) (cpu_0 : ℤ) := ∀(i : ℤ), ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask cpu_0) (0 : ℤ))) i) = (0 : ℤ) → (0 : ℤ) ≤ i → i < A_thread_variables_properties.l_size → ¬l_idle_cpu i = (0 : ℤ)
axiom Q_TL_idle_cpu (cpu_0 : ℤ) : Cint.is_uint8 (l_idle_cpu cpu_0)
axiom Q_mask_refl (i : ℤ) (mint_0 : Memory.addr -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (fact0 : (0 : ℤ) ≤ i) (fact1 : i < A_thread_variables_properties.l_size) : ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask i) (0 : ℤ))) i) = (0 : ℤ)
axiom Q_mask_symm (mint_0 : Memory.addr -> ℤ) (mptr_0 : Memory.addr -> Memory.addr) (j : ℤ) (i : ℤ) (fact0 : ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask j) (0 : ℤ))) i) = (0 : ℤ)) (fact1 : (0 : ℤ) ≤ i) (fact2 : i < A_thread_variables_properties.l_size) (fact3 : (0 : ℤ) ≤ j) (fact4 : j < A_thread_variables_properties.l_size) : ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask i) (0 : ℤ))) j) = (0 : ℤ)
axiom Q_mask_trans (mptr_0 : Memory.addr -> Memory.addr) (i : ℤ) (mint_0 : Memory.addr -> ℤ) (j : ℤ) (k : ℤ) : ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask i) (0 : ℤ))) j) = (0 : ℤ) → ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask j) (0 : ℤ))) k) = (0 : ℤ) → (0 : ℤ) ≤ i → i < A_thread_variables_properties.l_size → (0 : ℤ) ≤ j → j < A_thread_variables_properties.l_size → (0 : ℤ) ≤ k → k < A_thread_variables_properties.l_size → ¬mint_0 (Memory.shift (mptr_0 (Memory.shift (l_cpu_smt_mask i) (0 : ℤ))) k) = (0 : ℤ)
end A_schedule_cpumask
