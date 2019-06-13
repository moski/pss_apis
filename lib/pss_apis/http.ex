defmodule PSSApis.HTTP do
  @moduledoc false

  @endpoint %{
    settings: "/SettingService/GetLatestVersion2",
    crews: "/CharacterService/ListAllCharacterDesigns",
    items: "/ItemService/ListItemDesigns2",
    collections: "/CollectionService/ListAllCollectionDesigns"
  }

  def fetch(service, lang \\ "en") do
    generate_url(service, lang)
    |> HTTPoison.get
    |> handle_response
  end


  defp generate_url(:settings, lang) do
    "http://api.pixelstarships.com#{Map.get(@endpoint, :settings)}?languageKey=#{lang}"
  end

  defp generate_url(service, lang) do
    production_server = PSSApis.get_production_server
    "http://#{production_server}#{Map.get(@endpoint, service)}?languageKey=#{lang}"
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 200, body: body}}) do
    {:ok, body}
  end

  defp handle_response({:ok, %HTTPoison.Response{status_code: 404}}) do
    error = "404 error"
    IO.puts error
    {:error, error}
  end

  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    IO.inspect reason
    {:error, reason}
  end
end