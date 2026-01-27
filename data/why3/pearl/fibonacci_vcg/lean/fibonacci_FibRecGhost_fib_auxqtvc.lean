import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibRecGhost_fib_auxqtvc
theorem fib_aux'vc (k : ℤ) (n : ℤ) (fact0 : (0 : ℤ) ≤ k) (fact1 : (0 : ℤ) ≤ n) : (¬k = (0 : ℤ) → (let o1 : ℤ := k - (1 : ℤ); let o2 : ℤ := n + (1 : ℤ); ((0 : ℤ) ≤ k ∧ o1 < k) ∧ (0 : ℤ) ≤ o1 ∧ (0 : ℤ) ≤ o2 ∧ Fibonacci.fib (n + (1 : ℤ)) = Fibonacci.fib o2 ∧ Fibonacci.fib n + Fibonacci.fib (n + (1 : ℤ)) = Fibonacci.fib (o2 + (1 : ℤ)))) ∧ (∀(result : ℤ), (if k = (0 : ℤ) then result = Fibonacci.fib n else result = Fibonacci.fib (n + (1 : ℤ) + (k - (1 : ℤ)))) → result = Fibonacci.fib (n + k))
  := sorry
end fibonacci_FibRecGhost_fib_auxqtvc
