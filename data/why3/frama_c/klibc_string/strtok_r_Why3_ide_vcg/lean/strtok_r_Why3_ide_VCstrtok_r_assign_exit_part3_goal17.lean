import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strtok_r_Why3_ide_VCstrtok_r_assign_exit_part3_goal17
theorem goal17 : let a : Memory.addr := Memory.shift (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (0 : ℤ); ∀(i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr), let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_1 a_2; let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_1 (Memory.addr.mk (0 : ℤ) (0 : ℤ)); Memory.region (0 : ℤ) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.framed t_2 → Memory.linked t → Memory.sconst t_1 → Memory.valid_rw t a_1 (1 : ℤ) → Memory.valid_rw t (t_2 a_1) (1 : ℤ) → Axiomatic.p_length_of_str_is t t_1 a_2 i → Axiomatic.p_length_of_str_is t t_1 a_2 i_1 → Memory.separated a_1 (1 : ℤ) a_3 x → Memory.separated a_1 (1 : ℤ) a x_1 → ¬Memory.separated a x_1 a_3 x
  := sorry
end strtok_r_Why3_ide_VCstrtok_r_assign_exit_part3_goal17
