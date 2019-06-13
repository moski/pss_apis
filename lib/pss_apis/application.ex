defmodule PSSApis.Application do
  @moduledoc false

  import Cachex.Spec
  import Supervisor.Spec

  def start(_type, _args) do
    workers = workers()

    Supervisor.start_link(workers, strategy: :one_for_all)
  end

  defp workers do
    [
      worker(Cachex, [:settings_cache, [expiration: expiration(default: 3600)]], id: 1),
      worker(Cachex, [:crews_cache, [expiration: expiration(default: 3600)]], id: 2),
      worker(Cachex, [:items_cache, [expiration: expiration(default: 3600)]], id: 3),
      worker(Cachex, [:collections_cache, [expiration: expiration(default: 3600)]], id: 4)
    ]
  end
end