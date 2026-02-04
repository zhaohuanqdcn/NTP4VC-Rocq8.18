import Why3.Base
import Why3.int.NumOf
import Why3.pqueue.Pqueue
open Classical
open Lean4Why3
namespace Test
axiom v1 : Pqueue.elt
axiom v2 : Pqueue.elt
axiom values : Pqueue.le v2 v1 ∧ ¬Pqueue.le v1 v2
end Test
