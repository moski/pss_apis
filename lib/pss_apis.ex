defmodule PSSApis do
  
  def get_settings(lang \\ "en") do
    Cachex.fetch(:settings_cache, "settings_cache_raw_#{lang}", fn ->      
      case PSSApis.HTTP.fetch(:settings, lang) do
        { :ok, data } -> { :commit, data }
        { :error, _reason } = error -> { :ignore, error }
      end
    end) 

    |> case do
      {error, ex} when error in [:error, :ignore] -> { :error, ex }
      {success, value} when success in [:ok, :commit] -> {:ok, value |> PSSApis.Utils.Settings.parse_response}
    end
  end

  def get_crews(lang \\ "en") do
    Cachex.fetch(:crews_cache, "crews_cache_raw_#{lang}", fn ->      
      case PSSApis.HTTP.fetch(:crews, lang) do
        { :ok, data } -> { :commit, data }
        { :error, _reason } = error -> { :ignore, error }
      end
    end) 

    |> case do
      {error, ex} when error in [:error, :ignore] -> { :error, ex }
      {success, value} when success in [:ok, :commit] -> { :ok, value |> PSSApis.Utils.Crews.parse_response }
    end
  end

  def get_items(lang \\ "en") do
    Cachex.fetch(:items_cache, "items_cache_raw_#{lang}", fn ->      
      case PSSApis.HTTP.fetch(:items, lang) do
        { :ok, data } -> { :commit, data }
        { :error, _reason } = error -> { :ignore, error }
      end
    end) 

    |> case do
      {error, ex} when error in [:error, :ignore] -> { :error, ex }
      {success, value} when success in [:ok, :commit] -> { :ok, value |> PSSApis.Utils.Items.parse_response }
    end
  end

  def get_collections(lang \\ "en") do
    Cachex.fetch(:collections_cache, "collections_cache_raw_#{lang}", fn ->      
      case PSSApis.HTTP.fetch(:collections, lang) do
        { :ok, data } -> { :commit, data }
        { :error, _reason } = error -> { :ignore, error }
      end
    end) 

    |> case do
      {error, ex} when error in [:error, :ignore] -> { :error, ex }
      {success, value} when success in [:ok, :commit] -> { :ok, value |> PSSApis.Utils.Collections.parse_response }
    end
  end

  def get_production_server() do
    with {:ok, settings} <- get_settings() do
      settings.production_server
    else
      # nil -> {:error, ...} an example that we can match here too
      _ -> "api.pixelstarships.com"
    end
  end

  def print_drop_ship do
    
    with  { :ok, settings } <- get_settings(),
          { :ok, crews } <- get_crews(),
          { :ok, items } <- get_items()
    do
      crews_txt = get_dropshipcrew_txt(settings, crews)
      sale_text = get_dropshipsale_txt(settings,crews,items,  PSSApis.Utils.Settings.is_sale_valid(settings))
      IO.puts crews_txt
      IO.puts sale_text
    else
      _ ->   IO.puts "Somthing is wrong!!!"  
    end

  end

  defp get_dropshipcrew_txt(settings, crews) do
    crew1 = PSSApis.Utils.Crews.find_by_id(crews, settings.common_crew_id)
    crew2 = PSSApis.Utils.Crews.find_by_id(crews, settings.hero_crew_id)

    "**Dropship Crew**\nCommon Crew: #{crew1.character_design_name} - (Rarity: #{crew1.rarity})\nHero Crew: #{crew2.character_design_name} - (Rarity: #{crew2.rarity})\n\n"
  end

  defp get_dropshipsale_txt(settings, crews, items, true) do
    IO.puts  settings.sale_type

    str = "**Sale**\n"
    str <> sale_type(%{type: settings.sale_type, settings: settings, crews: crews, items: items})
  end

  defp get_dropshipsale_txt(settings, crews, items, false) do
    "N/A"
  end

  def sale_type(%{type: "Item", settings: settings, crews: _, items: items}) do 
    item = PSSApis.Utils.Items.find_by_id(items, settings.sale_argument)
    "#{item.item_design_name} (Rarity = #{item.rarity}, Enhancement = #{item.enhancement_value} #{item.enhancement_type})"
  end

  def sale_type(%{type: "Character", settings: settings, crews: crews, items: _}) do 
    crew = PSSApis.Utils.Crews.find_by_id(crews, settings.sale_argument)
    "TODO"
    #"#{item.item_design_name} (Rarity = #{item.rarity}, Enhancement = #{item.enhancement_value} #{item.enhancement_type})"
  end


  
end
