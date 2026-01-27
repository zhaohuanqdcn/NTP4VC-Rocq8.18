import Why3.Base
import pearl.queue_two_lists_vcg.lean.queue_two_lists.Queue
open Classical
open Lean4Why3
namespace queue_two_lists_Correct_copyqtrefnqtvc
theorem copy'refn'vc {α : Type} [Inhabited α] (result : Queue.t α) (q : Queue.t α) (fact0 : Queue.seq result = Queue.seq q) : Queue.seq result = Queue.seq q
  := sorry
end queue_two_lists_Correct_copyqtrefnqtvc
