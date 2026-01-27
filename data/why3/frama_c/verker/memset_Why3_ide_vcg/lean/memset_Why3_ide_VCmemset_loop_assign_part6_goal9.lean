import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memset_Why3_ide_VCmemset_loop_assign_part6_goal9
theorem goal9 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_2 : Memory.addr -> ℤ) (i_1 : ℤ) (t_1 : Memory.addr -> ℤ) : let a_1 : Memory.addr := Memory.shift a (0 : ℤ); ¬i = (0 : ℤ) → (0 : ℤ) ≤ i → Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_2 → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.addr_le a a → ¬Memory.invalid t a (1 : ℤ) → Memory.addr_le a (Memory.shift a i) → Memory.valid_rw t a_1 i → (∀(a_2 : Memory.addr), Memory.addr_lt a_2 a → Memory.addr_le a a_2 → Memory.havoc t_1 t_2 a_1 i a_2 = Cint.to_sint8 i_1) → (0 : ℤ) < i
  := sorry
end memset_Why3_ide_VCmemset_loop_assign_part6_goal9
