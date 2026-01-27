import Why3.Base
import pearl.queue_two_lists_vcg.lean.queue_two_lists.Queue
open Classical
open Lean4Why3
namespace queue_two_lists_Correct_createqtrefnqtvc
theorem create'refn'vc {α : Type} [Inhabited α] (result : Queue.t α) (fact0 : Queue.seq result = ([] : List α)) : Queue.seq result = ([] : List α)
  := sorry
end queue_two_lists_Correct_createqtrefnqtvc
