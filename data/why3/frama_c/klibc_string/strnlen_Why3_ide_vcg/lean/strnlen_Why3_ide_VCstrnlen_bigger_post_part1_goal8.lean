import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.klibc_string.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace strnlen_Why3_ide_VCstrnlen_bigger_post_part1_goal8
theorem goal8 (i : ℤ) (i_1 : ℤ) (a : Memory.addr) (t_1 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := i - i_1; let a_1 : Memory.addr := Memory.shift a x; t_1 a_1 = (0 : ℤ) → (0 : ℤ) < i_1 → (0 : ℤ) ≤ i → i_1 ≤ i → (0 : ℤ) ≤ i_1 → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_uint32 i → Cint.is_uint32 i_1 → Memory.valid_rw t (Memory.shift a (0 : ℤ)) i → Memory.addr_le a a_1 → Memory.addr_le a_1 (Memory.shift a i) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 < i → ¬t_1 (Memory.shift a i_2) = (0 : ℤ)) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + i_1 < i → ¬t_1 (Memory.shift a i_2) = (0 : ℤ)) → Cint.to_uint32 x = i
  := sorry
end strnlen_Why3_ide_VCstrnlen_bigger_post_part1_goal8
