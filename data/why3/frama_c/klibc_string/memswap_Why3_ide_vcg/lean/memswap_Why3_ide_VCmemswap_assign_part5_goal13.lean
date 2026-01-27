import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.klibc_string.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memswap_Why3_ide_VCmemswap_assign_part5_goal13
theorem goal13 (a : Memory.addr) (a_1 : Memory.addr) (i_1 : ℤ) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let a_3 : Memory.addr := Memory.shift a_1 (0 : ℤ); let x : ℤ := i_1 - i; (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t a_2 i_1 → Memory.valid_rw t a_3 i_1 → ¬Memory.invalid t a_3 x → Memory.separated a_3 i_1 a_2 i_1 → Memory.included a_3 x a_2 i_1 ∨ (i < i_1 → (0 : ℤ) ≤ i)
  := sorry
end memswap_Why3_ide_VCmemswap_assign_part5_goal13
