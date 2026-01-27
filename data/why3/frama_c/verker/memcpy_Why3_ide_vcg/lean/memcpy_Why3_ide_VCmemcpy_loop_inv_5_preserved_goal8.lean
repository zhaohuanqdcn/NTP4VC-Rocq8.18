import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcpy_Why3_ide_VCmemcpy_loop_inv_5_preserved_goal8
theorem goal8 (a_1 : Memory.addr) (i_1 : ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := i_1 + x; let x_2 : ℤ := Memory.addr.offset a_2; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_4 i_1; let a_6 : Memory.addr -> ℤ := Function.update a_5 a (a_5 a_2); ¬x_1 = x_2 → x_2 + Memory.addr.offset a_3 = Memory.addr.offset a + x → (0 : ℤ) ≤ i → x ≤ x_2 → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → x_2 ≤ x_1 → i + Cint.to_uint64 (i_1 + x - (1 : ℤ) - x_2) < i_1 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i_1 → Memory.addr_le a_1 a_2 → Memory.addr_le a_3 a → Memory.addr_le a (Memory.shift a_3 i_1) → Memory.addr_le a_2 (Memory.shift a_1 i_1) → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i_1 → Memory.valid_rw t a_4 i_1 → Cint.is_uint64 (i_1 + x - x_2) → (∀(i_2 : ℤ), (0 : ℤ) ≤ i_2 → i_2 + x < x_2 → a_5 (Memory.shift a_3 i_2) = a_5 (Memory.shift a_1 i_2)) → a_6 (Memory.shift a_3 i) = a_6 (Memory.shift a_1 i)
  := sorry
end memcpy_Why3_ide_VCmemcpy_loop_inv_5_preserved_goal8
