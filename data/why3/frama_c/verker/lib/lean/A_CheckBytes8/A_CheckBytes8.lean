import Why3.Base
import Why3.Qed.Qed
import Why3.Memory.Memory
import frama_c.verker.lib.lean.Compound.Compound
import Why3.Cint.Cint
open Classical
open Lean4Why3
namespace A_CheckBytes8
axiom l_check_bytes8 : (Memory.addr -> ℤ) -> Memory.addr -> ℤ -> ℤ -> Memory.addr
axiom fix_l_check_bytes8 (mint_0 : Memory.addr -> ℤ) (start_0 : Memory.addr) (value_0 : ℤ) (bytes_0 : ℤ) : if bytes_0 = (0 : ℤ) then l_check_bytes8 mint_0 start_0 value_0 bytes_0 = Memory.addr.mk (0 : ℤ) (0 : ℤ) else if mint_0 start_0 = value_0 then l_check_bytes8 mint_0 (Memory.shift start_0 (1 : ℤ)) value_0 (bytes_0 - (1 : ℤ)) = l_check_bytes8 mint_0 start_0 value_0 bytes_0 else l_check_bytes8 mint_0 start_0 value_0 bytes_0 = start_0
end A_CheckBytes8
