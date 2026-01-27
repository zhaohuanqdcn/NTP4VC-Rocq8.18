import Why3.Base
import pearl.queue_two_lists_vcg.lean.queue_two_lists.Queue
open Classical
open Lean4Why3
namespace queue_two_lists_Correct_safe_peekqtrefnqtvc
theorem safe_peek'refn'vc {α : Type} [Inhabited α] (q : Queue.t α) (fact0 : ¬Queue.seq q = ([] : List α)) : ¬Queue.seq q = ([] : List α)
  := sorry
end queue_two_lists_Correct_safe_peekqtrefnqtvc
