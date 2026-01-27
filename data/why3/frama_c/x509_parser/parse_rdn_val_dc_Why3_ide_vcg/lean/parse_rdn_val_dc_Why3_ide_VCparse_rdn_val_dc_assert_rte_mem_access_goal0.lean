import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import Why3.Cint.Cint
import frama_c.x509_parser.lib.lean.Compound.Compound
open Classical
open Lean4Why3
namespace parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_goal0
theorem goal0 (i : ℤ) (a : Memory.addr) (t : ℤ -> ℤ) (fact0 : ¬i = (0 : ℤ)) (fact1 : ¬Memory.addr.mk (0 : ℤ) (0 : ℤ) = a) (fact2 : (0 : ℤ) ≤ i) (fact3 : Memory.region (Memory.addr.base a) ≤ (0 : ℤ)) (fact4 : -(2147483646 : ℤ) ≤ i) (fact5 : (2 : ℤ) ≤ i) (fact6 : (3 : ℤ) ≤ i) (fact7 : i ≤ (65 : ℤ)) (fact8 : i ≤ (65537 : ℤ)) (fact9 : Memory.linked t) (fact10 : Cint.is_uint16 i) (fact11 : (0 : ℤ) < i → Memory.valid_rd t (Memory.shift a (0 : ℤ)) i) : Memory.valid_rd t (Memory.shift a (2 : ℤ)) (1 : ℤ)
  := sorry
end parse_rdn_val_dc_Why3_ide_VCparse_rdn_val_dc_assert_rte_mem_access_goal0
