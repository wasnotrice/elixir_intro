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

  def eternal_ping do
    receive do
      :ping ->
        IO.inspect(:pong)
        eternal_ping()
    end
  end

  # spawn, spawn_link
  def echo do
    receive do
      :ping ->
        IO.inspect(:pong)
        echo()

      :crash ->
        raise "Crashing"

      msg ->
        IO.puts(inspect(self()) <> " " <> inspect(msg))
        echo()
    end
  end

  def reply do
    receive do
      :crash ->
        raise "Crashing"

      {pid, msg} ->
        send(pid, msg)
        reply()

      msg ->
        IO.puts(inspect(self()) <> " " <> inspect(msg))
        reply()
    end
  end

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
    |> Enum.reduce(%{}, fn {char, count}, freq ->
      Map.update(freq, char, count, &(&1 + count))
    end)
    |> Enum.sort(fn {_, a}, {_, b} -> a > b end)
  end

  def stream_freq(text) do
    text
    |> String.splitter("", trim: true)
    |> Stream.reject(fn char -> Regex.match?(~r/\s/, char) end)
    |> Stream.map(fn char -> {String.downcase(char), 1} end)
    |> Enum.reduce(%{}, fn {char, count}, freq ->
      Map.update(freq, char, count, &(&1 + count))
    end)
    |> Enum.sort(fn {_, a}, {_, b} -> a > b end)
  end

  def time(work) do
    start = :os.system_time(:millisecond)
    result = work.()
    finish = :os.system_time(:millisecond)
    IO.puts("Elapsed time: #{(finish - start) / 1000}ms")
    result
  end

  def parallel_map(enum, func, timeout \\ 10_000) do
    enum
    |> Enum.map(fn item -> Task.async(fn -> func.(item) end) end)
    |> Enum.map(fn task -> Task.await(task, timeout) end)
  end
end
