defmodule Ping do
  def one_ping do
    receive do
      :ping -> IO.inspect(:pong)
    end
  end

  def quick_ping do
    receive do
      :ping -> IO.inspect(:pong)
    after
      1000 -> IO.puts("A second has passed. Pong, I'm dead.")
    end
  end

  def patient_ping do
    receive do
      :ping -> IO.inspect(:pong)
    after
      1000 ->
        IO.puts("A second has passed. Ping me.")
        patient_ping()
    end
  end

  def ping do
    receive do
      :ping ->
        IO.inspect(:pong)
        ping()

      :echo ->
        IO.puts("Becoming echo")
        echo()
    end
  end

  # spawn, spawn_link, spawn_monitor, redirect
  def echo do
    receive do
      :ping ->
        IO.puts("Becoming ping")
        ping()

      :crash ->
        raise "Crashing"

      {pid, msg} ->
        send(pid, msg)
        echo()

      msg ->
        IO.puts(inspect(self()) <> " " <> inspect(msg))
        echo()
    end
  end
end

defmodule Count do
  @doc """
  Count to a max, keeping the count on the stack
  """
  def count(name, max) do
    interval = Enum.random(100..1000)
    count(name, 1, max, interval)
  end

  defp count(name, max, max, _) do
    IO.puts("#{name} #{max} (done)")
  end

  defp count(name, count, max, interval) do
    IO.puts("#{name} #{count} (#{interval}ms)")
    Process.sleep(interval)
    count(name, count + 1, max, interval)
  end
end

defmodule Letter do
  def texts do
    ["anne", "brothers", "count", "war"]
    |> Enum.map(fn title -> File.read!("priv/#{title}.txt") end)
  end

  def freq(text) do
    text
    |> String.split("", trim: true)
    |> Enum.reject(fn char -> Regex.match?(~r/\s/, char) end)
    |> Enum.map(fn char -> {String.downcase(char), 1} end)
  end

  @doc """
  Reduce an enum (map or keyword) of {letter, count} pairs into a map with one entry
  per letter, and the cumulative total
  """
  def reduce(freqs, acc \\ %{}) do
    Enum.reduce(freqs, acc, fn {char, count}, freq ->
      Map.update(freq, char, count, fn old -> old + count end)
    end)
  end

  def sort(freqs) do
    Enum.sort(freqs, fn {_, a}, {_, b} -> a > b end)
  end

  def time(work) do
    start = :os.system_time(:millisecond)
    result = work.()
    finish = :os.system_time(:millisecond)
    IO.puts("Elapsed time: #{(finish - start) / 1000}ms")
    result
  end

  def parallel_map(enum, func) do
    timeout = 10_000

    enum
    |> Enum.map(fn item -> Task.async(fn -> func.(item) end) end)
    |> Enum.map(fn task -> Task.await(task, timeout) end)
  end

  @doc """
  Same as `freq/1`, only uses streams to reduce traversals. Still requires a big
  traversal for the reduce and the sort.
  """
  def stream_freq(text) do
    text
    |> String.splitter("", trim: true)
    |> Stream.reject(fn char -> Regex.match?(~r/\s/, char) end)
    |> Stream.map(fn char -> {String.downcase(char), 1} end)
  end

  @doc """
  Calculate sorted frequencies for a single text

  ## Examples

  import Letter
  texts = texts()
  time(fn ->
    parallel_map(texts, fn text -> one(text) end)
  end)
  """

  def one(text) do
    text
    |> stream_freq()
    |> reduce()
    |> sort()
  end

  @doc """
  Count all, and re-reduce the results into a single frequency map

  ## Examples

  import Letter
  texts = texts()
  time(fn -> all_parallel(texts) end)
  """
  def all_parallel(texts) do
    texts
    |> parallel_map(fn text ->
      text |> stream_freq() |> reduce()
    end)
    |> Enum.reduce(fn map, reduction -> reduce(map, reduction) end)
    |> sort()
  end

  @doc """
  Count all, and re-reduce the results into a single frequency map

  Single-process

  ## Examples

  import Letter
  texts = texts()
  time(fn -> all_single_process(texts) end)
  """
  def all_single_process(texts) do
    texts
    |> Enum.map(fn text ->
      text |> stream_freq() |> reduce()
    end)
    |> Enum.reduce(fn map, reduction -> reduce(map, reduction) end)
    |> sort()
  end
end
