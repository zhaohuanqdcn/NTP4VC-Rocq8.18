import Why3.Base
import Why3.int.NumOf
import Why3.pqueue.Pqueue
open Classical
open Lean4Why3
namespace pqueue_test_Test_test0qtvc
axiom v1 : Pqueue.elt
axiom v2 : Pqueue.elt
axiom values : Pqueue.le v2 v1 ∧ ¬Pqueue.le v1 v2
theorem test0'vc : True
  := sorry
end pqueue_test_Test_test0qtvc
