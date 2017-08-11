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

  def mapsum(list, func), do: _mapsum(list, func, 0)
  defp _mapsum([], _func, sum), do: sum
  defp _mapsum([head | tail], func, sum) do
    _mapsum(tail, func, sum + func.(head))
  end

  def max([head | []]), do: head
  def max([head | tail]), do: _max(tail, head)
  defp _max([], max), do: max
  defp _max([head | tail], max) when head > max, do: _max(tail, head)
  defp _max([head | tail], max) when head < max, do: _max(tail, max)
end
