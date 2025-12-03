defmodule Mix.Tasks.Day do
  use Mix.Task

  @impl Mix.Task
  def run([day | _]) do
    Mix.Task.run("app.start")

    day
    |> String.to_integer()
    |> Advent2025.run()
  end

  @impl Mix.Task
  def run(_) do
    IO.puts("Usage: mix run_day <day>")
  end
end
