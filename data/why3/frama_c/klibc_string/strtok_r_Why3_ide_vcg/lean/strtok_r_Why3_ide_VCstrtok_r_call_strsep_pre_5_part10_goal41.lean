import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Axiomatic.Axiomatic
import frama_c.klibc_string.lib.lean.Compound.Compound
import frama_c.klibc_string.lib.lean.A_Length.A_Length
open Classical
open Lean4Why3
namespace strtok_r_Why3_ide_VCstrtok_r_call_strsep_pre_5_part10_goal41
theorem goal41 : let a : Memory.addr := Memory.shift (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (0 : ℤ); ∀(i_1 : ℤ) (i : ℤ) (t_1 : ℤ -> ℤ) (t : ℤ -> ℤ) (t_3 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t_5 : Memory.addr -> Memory.addr) (t_4 : Memory.addr -> Memory.addr) (a_4 : Memory.addr) (a_3 : Memory.addr) (a_2 : Memory.addr) (a_1 : Memory.addr), let a_5 : Memory.addr := Memory.shift a_4 (0 : ℤ); let x : ℤ := (1 : ℤ) + A_Length.l_length t_2 a_4; let x_1 : ℤ := (1 : ℤ) + A_Length.l_length t_2 (Memory.addr.mk (0 : ℤ) (0 : ℤ)); let a_6 : Memory.addr := t_5 a_3; let a_7 : Memory.addr := Memory.shift (Memory.addr.mk (0 : ℤ) (0 : ℤ)) (A_Length.l_length t_3 (Memory.addr.mk (0 : ℤ) (0 : ℤ))); Memory.region (0 : ℤ) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_4) ≤ (0 : ℤ) → Memory.framed t_4 → Memory.linked t → Memory.sconst t_2 → Memory.valid_rw t a_2 (1 : ℤ) → Memory.valid_rw t (t_4 a_2) (1 : ℤ) → Axiomatic.p_length_of_str_is t t_2 a_4 i → Axiomatic.p_length_of_str_is t t_2 a_4 i_1 → Memory.separated a_2 (1 : ℤ) a_5 x → Memory.separated a_2 (1 : ℤ) a x_1 → Memory.separated a x_1 a_5 x → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → Memory.addr.base a_6 = Memory.addr.base a_1) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → Memory.valid_rw t_1 a_3 (1 : ℤ)) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → Memory.addr_le (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a_1 ∧ Memory.addr_le a_1 a_7) → (¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a_1 → Memory.addr_le (Memory.addr.mk (0 : ℤ) (0 : ℤ)) a_6 ∧ Memory.addr_le a_6 a_7) → Memory.separated a_3 (1 : ℤ) (Memory.shift a_6 (0 : ℤ)) ((1 : ℤ) + A_Length.l_length t_3 a_6)
  := sorry
end strtok_r_Why3_ide_VCstrtok_r_call_strsep_pre_5_part10_goal41
