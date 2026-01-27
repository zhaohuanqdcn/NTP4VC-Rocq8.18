import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_loop_inv_4_preserved_goal8
theorem goal8 (t_1 : Memory.addr -> ℤ) (a_8 : Memory.addr) (i_1 : ℤ) (a_3 : Memory.addr) (i : ℤ) (a_7 : Memory.addr) (t : ℤ -> ℤ) (a_4 : Memory.addr) (a_6 : Memory.addr) (a_9 : Memory.addr) (a : Memory.addr) (a_1 : Memory.addr) (a_5 : Memory.addr) (a_2 : Memory.addr) : let x : ℤ := t_1 a_8; let x_1 : ℤ := Cint.to_uint8 i_1; let x_2 : ℤ := Memory.addr.offset a_3; let x_3 : ℤ := Memory.addr.offset a_8; let x_4 : ℤ := i + x_3 - x_2; ¬i = (0 : ℤ) → ¬x = x_1 → (0 : ℤ) ≤ i → x_2 ≤ x_3 → Memory.region (Memory.addr.base a_7) ≤ (0 : ℤ) → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a_4 a_8 → Memory.addr_le a_6 a_9 → Cint.is_uint8 x → Memory.addr_lt a_9 (Memory.shift a_8 (1 : ℤ)) → Cint.is_uint64 x_4 → Memory.valid_rd t (Memory.shift a (0 : ℤ)) x_4 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_4 → Memory.addr_le a_8 (Memory.shift a_5 x_4) → (∀(a_10 : Memory.addr), Memory.addr_lt a_10 a_8 → Memory.addr_le a_2 a_10 → ¬t_1 a_10 = x_1) → ¬t_1 a_9 = x_1
  := sorry
end memchr_Why3_ide_VCmemchr_loop_inv_4_preserved_goal8
