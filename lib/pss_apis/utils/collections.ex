defmodule PSSApis.Utils.Collections do
  import SweetXml

  def parse_response(resp) do
    resp 
    |> xpath(~x"//CollectionService/ListAllCollectionDesigns/CollectionDesigns/CollectionDesign"l)
    |> Enum.map(fn (property) ->
      %PSSApis.Responses.Collection{
        collection_design_id: property |> xpath(~x"./@CollectionDesignId"i),
        collection_name: property |> xpath(~x"./@CollectionName"s),
        min_combo: property |> xpath(~x"./@MinCombo"i),
        max_combo: property |> xpath(~x"./@MaxCombo"i),
        enhancement_type: property |> xpath(~x"./@EnhancementType"s),
        base_enhancement_value: property |> xpath(~x"./@BaseEnhancementValue"i),
        flags: property |> xpath(~x"./@Flags"i),
        collection_type: property |> xpath(~x"./@CollectionType"s),
        collection_description: property |> xpath(~x"./@CollectionDescription"s),
        sprite_id: property |> xpath(~x"./@SpriteId"i),
        color_string: property |> xpath(~x"./@ColorString"s),
        step_enhancement_value: property |> xpath(~x"./@StepEnhancementValue"i),
        icon_sprite_id: property |> xpath(~x"./@IconSpriteId"i),
        halo_animation_id: property |> xpath(~x"./@HaloAnimationId"i)
      }
    end)
  end

  # def find_by_id(items, item_id) do
  #   Enum.filter(items, fn(x) -> x.item_design_id == item_id end) |> hd
  # end
end