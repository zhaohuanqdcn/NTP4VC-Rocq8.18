import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memset_Why3_ide_VCmemset_loop_term_decrease_goal7
theorem goal7 (a : Memory.addr) (i : ℤ) (i_1 : ℤ) (i_2 : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → -(128 : ℤ) ≤ i_2 → i_2 ≤ (127 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Cint.is_sint32 i_2 → Memory.valid_rw t a_1 i_1 → (∀(i_3 : ℤ), (0 : ℤ) ≤ i_3 → i_3 + i < i_1 → Memory.havoc t_1 t_2 a_1 (i_1 - i) (Memory.shift a i_3) = i_2) → Cint.to_uint32 (i - (1 : ℤ)) < i
  := sorry
end memset_Why3_ide_VCmemset_loop_term_decrease_goal7
