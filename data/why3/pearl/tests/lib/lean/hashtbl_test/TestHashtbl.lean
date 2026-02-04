import Why3.Base
import Why3.hashtbl.Hashtbl
open Classical
open Lean4Why3
namespace TestHashtbl
axiom k1 : Hashtbl.key
axiom k2 : Hashtbl.key
axiom k3 : Hashtbl.key
axiom kdiff : ¬k1 = k2 ∧ ¬k1 = k3 ∧ ¬k2 = k3
end TestHashtbl
