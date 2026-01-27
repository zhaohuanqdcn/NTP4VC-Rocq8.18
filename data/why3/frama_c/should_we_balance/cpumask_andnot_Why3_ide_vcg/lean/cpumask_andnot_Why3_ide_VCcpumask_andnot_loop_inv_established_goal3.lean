import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import frama_c.should_we_balance.lib.lean.Compound.Compound
import frama_c.should_we_balance.lib.lean.A_schedule_cpumask.A_schedule_cpumask
open Classical
open Lean4Why3
namespace cpumask_andnot_Why3_ide_VCcpumask_andnot_loop_inv_established_goal3
theorem goal3 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_2 : Memory.addr) (t : ℤ -> ℤ) : let a_3 : Memory.addr := Memory.shift (t_1 (Memory.shift a (0 : ℤ))) (0 : ℤ); let a_4 : Memory.addr := Memory.shift (t_1 (Memory.shift a_1 (0 : ℤ))) (0 : ℤ); let a_5 : Memory.addr := Memory.shift (t_1 (Memory.shift a_2 (0 : ℤ))) (0 : ℤ); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_2 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 (1 : ℤ) → Memory.valid_rd t a_3 A_thread_variables_properties.l_size → Memory.valid_rd t a_4 A_thread_variables_properties.l_size → Memory.valid_rw t a_5 A_thread_variables_properties.l_size → (¬a_2 = a → Memory.separated a_5 A_thread_variables_properties.l_size a_3 A_thread_variables_properties.l_size) → (¬a_2 = a_1 → Memory.separated a_5 A_thread_variables_properties.l_size a_4 A_thread_variables_properties.l_size) → (∀(i : ℤ), (0 : ℤ) ≤ i → i < A_thread_variables_properties.l_size → Memory.separated a_5 A_thread_variables_properties.l_size (Memory.shift (t_1 (Memory.shift (A_schedule_cpumask.l_cpu_smt_mask i) (0 : ℤ))) (0 : ℤ)) A_thread_variables_properties.l_size) → (0 : ℤ) ≤ A_thread_variables_properties.l_size
  := sorry
end cpumask_andnot_Why3_ide_VCcpumask_andnot_loop_inv_established_goal3
