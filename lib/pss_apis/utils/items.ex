defmodule PSSApis.Utils.Items do
  import SweetXml

  def parse_response(resp) do
    resp 
    |> xpath(~x"//ItemService/ListItemDesigns/ItemDesigns/ItemDesign"l)
    |> Enum.map(fn (property) ->
      %PSSApis.Responses.Item{
        item_design_id: property |> xpath(~x"./@ItemDesignId"i),
        item_design_name: property |> xpath(~x"./@ItemDesignName"s),
        item_design_key: property |> xpath(~x"./@ItemDesignKey"s),
        item_design_description: property |> xpath(~x"./@ItemDesignDescription"s),
        image_sprite_id: property |> xpath(~x"./@ImageSpriteId"i),
        logo_sprite_id: property |> xpath(~x"./@LogoSpriteId"i),
        item_space: property |> xpath(~x"./@ItemSpace"i),
        item_type: property |> xpath(~x"./@ItemType"s),
        gas_cost: property |> xpath(~x"./@GasCost"i),
        mineral_cost: property |> xpath(~x"./@MineralCost"i),
        rank: property |> xpath(~x"./@Rank"i),
        min_room_level: property |> xpath(~x"./@MinRoomLevel"i),
        build_time: property |> xpath(~x"./@BuildTime"i),
        root_item_design_id: property |> xpath(~x"./@RootItemDesignId"i),
        item_sub_type: property |> xpath(~x"./@ItemSubType"s),
        enhancement_type: property |> xpath(~x"./@EnhancementType"s),
        enhancement_value: property |> xpath(~x"./@EnhancementValue"f),
        market_price: property |> xpath(~x"./@MarketPrice"i),
        drop_chance: property |> xpath(~x"./@DropChance"i),
        ingredients: property |> xpath(~x"./@Ingredients"s),
        rarity: property |> xpath(~x"./@Rarity"s),
        module_type: property |> xpath(~x"./@ModuleType"s),
        module_argument: property |> xpath(~x"./@ModuleArgument"i),
        flags: property |> xpath(~x"./@Flags"i),
        fair_price: property |> xpath(~x"./@FairPrice"i),
        min_ship_level: property |> xpath(~x"./@MinShipLevel"i),
        manufacture_cost: property |> xpath(~x"./@ManufactureCost"s),
        item_design_name_en: property |> xpath(~x"./@ItemDesignNameEn"s),
        content: property |> xpath(~x"./@Content"s),
        race_id: property |> xpath(~x"./@RaceId"i),
        required_research_design_id: property |> xpath(~x"./@RequiredResearchDesignId"i),
        parent_item_design_id: property |> xpath(~x"./@ParentItemDesignId"i),
        craft_design_id: property |> xpath(~x"./@CraftDesignId"i),
        missile_design_id: property |> xpath(~x"./@MissileDesignId"i),
        character_part_id: property |> xpath(~x"./@CharacterPartId"i),
        active_animation_id: property |> xpath(~x"./@ActiveAnimationId"i),
        animation_id: property |> xpath(~x"./@AnimationId"i),
        border_sprite_id: property |> xpath(~x"./@BorderSpriteId"i),
        sound_file_id: property |> xpath(~x"./@SoundFileId"i),
        character_design_id: property |> xpath(~x"./@CharacterDesignId"i),
        training_design_id: property |> xpath(~x"./@TrainingDesignId"i)
      }
    end)
  end

  def find_by_id(items, item_id) do
    Enum.filter(items, fn(x) -> x.item_design_id == item_id end) |> hd
  end
end