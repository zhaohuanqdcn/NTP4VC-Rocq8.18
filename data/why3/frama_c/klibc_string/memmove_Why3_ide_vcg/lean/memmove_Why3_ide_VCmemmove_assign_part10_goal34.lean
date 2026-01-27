import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_assign_part10_goal34
theorem goal34 (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 i_1; let x : ℤ := i - i_1; (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → ¬Memory.addr_lt a_1 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_2 i → ¬Memory.invalid t a_3 x → Memory.included a_3 x a_2 i
  := sorry
end memmove_Why3_ide_VCmemmove_assign_part10_goal34
