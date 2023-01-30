defmodule Rocketeer.Repo do
  use Ecto.Repo,
    otp_app: :rocketeer,
    adapter: Ecto.Adapters.Postgres
end
