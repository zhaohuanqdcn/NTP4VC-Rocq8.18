import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace memmove_Why3_ide_VCmemmove_assert_goal9
theorem goal9 (a_1 : Memory.addr) (a : Memory.addr) (i : ℤ) (a_2 : Memory.addr) (t_1 : Memory.addr -> ℤ) (t_2 : Memory.addr -> ℤ) (t : ℤ -> ℤ) : let x : ℤ := Memory.addr.offset a_1; let x_1 : ℤ := Memory.addr.offset a; let x_2 : ℤ := i + x_1; let a_3 : Memory.addr := Memory.shift a_2 (0 : ℤ); let a_4 : Memory.addr -> ℤ := Memory.havoc t_1 t_2 a_3 i; let a_5 : Memory.addr -> ℤ := Function.update a_4 a_2 (a_4 a_1); let x_4 : ℤ := i - (1 : ℤ) - Cint.to_uint64 (i + x_1 - (1 : ℤ) - x); let a_6 : ℤ := a_5 (Memory.shift a x_4); let a_7 : ℤ := a_5 (Memory.shift a_2 x_4); x = x_1 → ¬x_2 = x → x_1 ≤ x → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.region (Memory.addr.base a_2) ≤ (0 : ℤ) → x ≤ x_2 → Memory.linked t → Memory.sconst t_2 → Cint.is_uint64 i → Memory.addr_le a a_1 → Memory.addr_le a_2 a → Memory.addr_le a_2 a_2 → Memory.addr_le a_1 (Memory.shift a i) → Memory.addr_le a_2 (Memory.shift a_2 i) → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rw t a_3 i → Cint.is_uint64 (i + x_1 - x) → Cint.is_sint8 a_6 → Cint.is_sint8 a_7 → (∀(i_1 : ℤ), let a_8 : Memory.addr := Memory.shift a i_1; i_1 < i → x ≤ i_1 + x_1 → a_4 a_8 = t_2 a_8) → (∀(i_1 : ℤ), (0 : ℤ) ≤ i_1 → i_1 + x_1 < x → a_4 (Memory.shift a_2 i_1) = t_2 (Memory.shift a i_1)) → a_7 = a_6
  := sorry
end memmove_Why3_ide_VCmemmove_assert_goal9
