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
  def initialize do
    client = Tentacat.Client.new(%{access_token: "access-token"})
    Tentacat.Pulls.Reviews.list(client, "org", "repo", 0)
  end
end
