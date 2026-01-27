import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memset_Why3_ide_VCmemset_post_goal0
theorem goal0 (a : Memory.addr) (i : ℤ) (t : ℤ -> ℤ) (t_1 : Memory.addr -> ℤ) (a_1 : Memory.addr) : let a_2 : Memory.addr := Memory.shift a (0 : ℤ); let x : ℤ := Cint.to_sint8 i; Memory.region (Memory.addr.base a) ≤ (0 : ℤ) → Memory.linked t → Memory.sconst t_1 → Cint.is_sint32 i → Memory.addr_le a a → Memory.addr_le a a_1 → Memory.addr_lt a_1 a_2 → Memory.addr_le a a_2 → Memory.valid_rw t a_2 (0 : ℤ) → (∀(a_3 : Memory.addr), Memory.addr_lt a_3 a → Memory.addr_le a a_3 → t_1 a_3 = x) → t_1 a_1 = x
  := sorry
end memset_Why3_ide_VCmemset_post_goal0
