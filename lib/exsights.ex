defmodule Exsights do
  @moduledoc """
  Documentation for Exsights.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Exsights.hello()
      :world

  """
  defstruct token: "", org: "", repo: ""

  def read_config do
    path = Path.join(File.cwd!(), "config.toml")
    case Toml.decode_file(path, []) do
      {:ok, contents} ->
        %Exsights{token: contents["token"], org: contents["org"], repo: contents["repo"]}
      {_, {error, message}} ->
        IO.puts "#{error}: #{message}"
    end
  end

  def main(args) do
    config = read_config()
    Github.fetch_review(Tentacat.Client.new(%{access_token: config.token}), config)
  end
end

defmodule Github do
  def fetch_review(client, config) do
    response = Tentacat.Pulls.Reviews.list(client, config.org, config.repo, 28669)
    case response do
      {200, _, resp} ->
        IO.puts resp.request.method
      {_, _, _} ->
        IO.puts "something went wrong"
    end
  end
end
