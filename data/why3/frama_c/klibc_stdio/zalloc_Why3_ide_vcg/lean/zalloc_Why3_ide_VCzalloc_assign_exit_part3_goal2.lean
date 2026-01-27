import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace zalloc_Why3_ide_VCzalloc_assign_exit_part3_goal2
theorem goal2 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) ≤ i → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Memory.valid_rw t a_1 i → Memory.invalid t a_1 i
  := sorry
end zalloc_Why3_ide_VCzalloc_assign_exit_part3_goal2
