import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.should_we_balance.lib.lean.A_thread_variables_properties.A_thread_variables_properties
import frama_c.should_we_balance.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace cpumask_copy_Why3_ide_VCcpumask_copy_loop_inv_established_goal2
theorem goal2 (t_1 : Memory.addr -> Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (t : ℤ -> ℤ) : let a_2 : Memory.addr := Memory.shift (t_1 (Memory.shift a (0 : ℤ))) (0 : ℤ); let a_3 : Memory.addr := Memory.shift (t_1 (Memory.shift a_1 (0 : ℤ))) (0 : ℤ); Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.framed t_1 → Memory.linked t → Memory.valid_rd t a (1 : ℤ) → Memory.valid_rd t a_1 (1 : ℤ) → Memory.valid_rd t a_2 A_thread_variables_properties.l_size → Memory.valid_rw t a_3 A_thread_variables_properties.l_size → Memory.separated a_3 A_thread_variables_properties.l_size a_2 A_thread_variables_properties.l_size → (0 : ℤ) ≤ A_thread_variables_properties.l_size
  := sorry
end cpumask_copy_Why3_ide_VCcpumask_copy_loop_inv_established_goal2
