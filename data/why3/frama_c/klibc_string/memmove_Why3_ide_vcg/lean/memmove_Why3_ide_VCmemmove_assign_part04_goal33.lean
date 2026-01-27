import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_assign_part04_goal33
theorem goal33 (a_1 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a_1 (0 : ℤ); (0 : ℤ) ≤ i → i_1 < i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.addr_lt a_1 a → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_2 i → ¬Memory.invalid t a_2 (i - i_1) → (0 : ℤ) ≤ i_1
  := sorry
end memmove_Why3_ide_VCmemmove_assign_part04_goal33
