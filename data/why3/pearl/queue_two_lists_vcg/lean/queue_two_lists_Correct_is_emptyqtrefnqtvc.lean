import Why3.Base
import pearl.queue_two_lists_vcg.lean.queue_two_lists.Queue
open Classical
open Lean4Why3
namespace queue_two_lists_Correct_is_emptyqtrefnqtvc
theorem is_empty'refn'vc {α : Type} [Inhabited α] (q : Queue.t α) : (Queue.seq q = ([] : List α)) = (Queue.seq q = ([] : List α))
  := sorry
end queue_two_lists_Correct_is_emptyqtrefnqtvc
