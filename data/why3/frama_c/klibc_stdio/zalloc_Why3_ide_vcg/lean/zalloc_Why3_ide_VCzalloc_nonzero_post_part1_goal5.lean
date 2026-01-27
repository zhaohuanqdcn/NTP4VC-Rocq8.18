import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_stdio.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace zalloc_Why3_ide_VCzalloc_nonzero_post_part1_goal5
theorem goal5 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a → (0 : ℤ) < i → (0 : ℤ) ≤ i → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Memory.valid_rw t a_1 i → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 < i → Memory.havoc t_1 t_2 a_1 i (Memory.shift a i_1) = (0 : ℤ)) → Memory.valid_rw t a_1 ((1 : ℤ) + i)
  := sorry
end zalloc_Why3_ide_VCzalloc_nonzero_post_part1_goal5
