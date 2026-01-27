import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_found_post_3_goal13
theorem goal13 (t_1 : Memory.addr -> ℤ) (a_11 : Memory.addr) (a_5 : Memory.addr) (a_10 : Memory.addr) (a_8 : Memory.addr) (i : ℤ) (i_1 : ℤ) (a_9 : Memory.addr) (t : ℤ -> ℤ) (a_2 : Memory.addr) (a_6 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_3 : Memory.addr) (a_7 : Memory.addr) (a_4 : Memory.addr) : let x : ℤ := t_1 a_11; let x_1 : ℤ := Memory.addr.offset a_5; let x_2 : ℤ := Memory.addr.offset a_10; let x_3 : ℤ := t_1 a_8; let x_4 : ℤ := i + x_2 - x_1; x = Cint.to_uint8 i_1 → (0 : ℤ) ≤ i → x_1 ≤ x_2 → Memory.region (Memory.addr.base a_9) ≤ (0 : ℤ) → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_2 a_11 → Memory.addr_le a_6 a_10 → Cint.is_uint8 x_3 → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.addr_lt a_11 (Memory.shift a_3 x_4) → Memory.addr_le a_10 (Memory.shift a_7 x_4) → i = (0 : ℤ) ∨ x = t_1 a_10 → (∀(a_12 : Memory.addr), Memory.addr_lt a_12 a_10 → Memory.addr_le a_4 a_12 → ¬x = t_1 a_12) → x = x_3
  := sorry
end memchr_Why3_ide_VCmemchr_found_post_3_goal13
