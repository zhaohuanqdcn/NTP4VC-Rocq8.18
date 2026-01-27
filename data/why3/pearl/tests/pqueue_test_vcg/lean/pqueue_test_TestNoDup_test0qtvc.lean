import Why3.Base
import Why3.pqueue.PqueueNoDup
open Classical
open Lean4Why3
namespace pqueue_test_TestNoDup_test0qtvc
axiom v1 : PqueueNoDup.elt
axiom v2 : PqueueNoDup.elt
axiom values : PqueueNoDup.le v2 v1 ∧ ¬PqueueNoDup.le v1 v2
theorem test0'vc : True
  := sorry
end pqueue_test_TestNoDup_test0qtvc
