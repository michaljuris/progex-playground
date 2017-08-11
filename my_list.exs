defmodule MyList do
  def reduce([], value, _func) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def map([], _func), do: []
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  # def mapsum(list, func), do: _mapsum(list, func, 0)
  # defp _mapsum([], _func, sum), do: sum
  # defp _mapsum([head | tail], func, sum) do
  #   _mapsum(tail, func, sum + func.(head))
  # end

  def mapsum([], _func), do: 0
  def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

  def max([head]), do: head
  def max([head | tail]), do: Kernel.max(head, max(tail))

  def caesar([], _n), do: []
  def caesar([head | tail], n) when head + n <= ?z, do: [head + n | caesar(tail, n)]
  def caesar([head | tail], n), do: [head + n - 26 | caesar(tail, n)]
end
