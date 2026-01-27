import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memcpy_Why3_ide_VCmemcpy_post_goal0
theorem goal0 (a_2 : Memory.addr) (a_1 : Memory.addr) (a_3 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_2; let x_1 : ℤ := Memory.addr.offset a_1; let x_2 : ℤ := x - x_1; let a_4 : Memory.addr := Memory.shift a_3 (0 : ℤ); let a_5 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_4 x_2; x + Memory.addr.offset a_3 = Memory.addr.offset a + x_1 → (0 : ℤ) ≤ i → x_1 ≤ x → Memory.region (Memory.addr.base a_1) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_3) ≤ (0 : ℤ) → i + x_1 < x → Memory.linked t → Memory.sconst t_2 → Memory.addr_le a_1 a_2 → Memory.addr_le a_3 a → Cint.is_uint64 x_2 → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) x_2 → Memory.valid_rw t a_4 x_2 → Memory.addr_le a (Memory.shift a_3 x_2) → Memory.addr_le a_2 (Memory.shift a_1 x_2) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x → a_5 (Memory.shift a_3 i_1) = a_5 (Memory.shift a_1 i_1)) → a_5 (Memory.shift a_3 i) = a_5 (Memory.shift a_1 i)
  := sorry
end memcpy_Why3_ide_VCmemcpy_post_goal0
