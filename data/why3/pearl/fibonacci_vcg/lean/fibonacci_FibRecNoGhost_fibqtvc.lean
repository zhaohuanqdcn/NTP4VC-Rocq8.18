import Why3.Base
import Why3.int.Fibonacci
open Classical
open Lean4Why3
namespace fibonacci_FibRecNoGhost_fibqtvc
theorem fib'vc (n : ℤ) (fact0 : (0 : ℤ) ≤ n) : (0 : ℤ) ≤ n ∧ (∃(n1 : ℤ), (0 : ℤ) ≤ n1 ∧ (0 : ℤ) = Fibonacci.fib n1 ∧ (1 : ℤ) = Fibonacci.fib (n1 + (1 : ℤ))) ∧ (∀(result : ℤ), (∀(n1 : ℤ), (0 : ℤ) ≤ n1 ∧ (0 : ℤ) = Fibonacci.fib n1 ∧ (1 : ℤ) = Fibonacci.fib (n1 + (1 : ℤ)) → result = Fibonacci.fib (n1 + n)) → result = Fibonacci.fib n)
  := sorry
end fibonacci_FibRecNoGhost_fibqtvc
