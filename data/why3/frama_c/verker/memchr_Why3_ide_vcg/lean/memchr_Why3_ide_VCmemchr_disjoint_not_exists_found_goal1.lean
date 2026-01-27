import Why3.Base
import Why3.Qed.Qed
import frama_c.verker.lib.lean.Axiomatic3.Axiomatic3
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.verker.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace memchr_Why3_ide_VCmemchr_disjoint_not_exists_found_goal1
theorem goal1 (i_1 : ℤ) (a_6 : Memory.addr) (t : ℤ -> ℤ) (i : ℤ) (a : Memory.addr) (a_1 : Memory.addr) (t_1 : Memory.addr -> ℤ) (a_2 : Memory.addr) (a_3 : Memory.addr) (a_4 : Memory.addr) (a_5 : Memory.addr) : let x : ℤ := Cint.to_uint8 i_1; Memory.region (Memory.addr.base a_6) ≤ (0 : ℤ) → Memory.linked t → Cint.is_sint32 i_1 → Cint.is_uint64 i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i → Memory.valid_rd t (Memory.shift a_1 (0 : ℤ)) i → (∃(a_7 : Memory.addr), t_1 a_7 = x ∧ Memory.addr_le a_2 a_7 ∧ Memory.addr_lt a_7 (Memory.shift a_3 i)) ∨ (∀(a_7 : Memory.addr), ¬t_1 a_7 = x ∨ ¬Memory.addr_le a_4 a_7 ∨ ¬Memory.addr_lt a_7 (Memory.shift a_5 i))
  := sorry
end memchr_Why3_ide_VCmemchr_disjoint_not_exists_found_goal1
