import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strnlen_Why3_ide_VCstrnlen_loop_inv_4_preserved_part1_goal3
theorem goal3 (a : Memory.addr) (i_1 : ℤ) (i : ℤ) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let a_1 : Memory.addr := Memory.shift a (i_1 - i); let x_1 : ℤ := t_1 a_1; ¬x_1 = (0 : ℤ) → (0 : ℤ) < i → (0 : ℤ) ≤ i → (0 : ℤ) ≤ i_1 → i ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i_1 → Memory.addr_le a a_1 → Memory.addr_le a_1 (Memory.shift a i_1) → Cint.is_sint8 x_1 → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i < i_1 → ¬t_1 (Memory.shift a i_2) = (0 : ℤ)) → Memory.addr_le a (Memory.shift a ((1 : ℤ) + i_1 - i))
  := sorry
end strnlen_Why3_ide_VCstrnlen_loop_inv_4_preserved_part1_goal3
