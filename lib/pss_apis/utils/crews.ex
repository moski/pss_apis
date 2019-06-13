defmodule PSSApis.Utils.Crews do
  import SweetXml

  def parse_response(resp) do
    resp 
    |> xpath(~x"//CharacterService/ListAllCharacterDesigns/CharacterDesigns/CharacterDesign"l) 
    |> Enum.map(fn (property) ->
      %PSSApis.Responses.Crew{
        character_design_id: property |> xpath(~x"./@CharacterDesignId"i),
        character_design_name: property |> xpath(~x"./@CharacterDesignName"s),
        character_head_part_id: property |> xpath(~x"./@CharacterHeadPartId"i),
        character_body_part_id: property |> xpath(~x"./@CharacterBodyPartId"i),
        gender_type: property |> xpath(~x"./@GenderType"s),
        race_type: property |> xpath(~x"./@RaceType"s),
        hp: property |> xpath(~x"./@Hp"i),
        pilot: property |> xpath(~x"./@Pilot"f),
        attack: property |> xpath(~x"./@Attack"f),
        fire_resistance: property |> xpath(~x"./@FireResistance"i),
        repair: property |> xpath(~x"./@Repair"f),
        weapon: property |> xpath(~x"./@Weapon"f),
        science: property |> xpath(~x"./@Science"f),
        engine: property |> xpath(~x"./@Engine"f),
        research: property |> xpath(~x"./@Research"f),
        level: property |> xpath(~x"./@Level"i),
        walking_speed: property |> xpath(~x"./@WalkingSpeed"f),
        gas_cost: property |> xpath(~x"./@GasCost"i),
        mineral_cost: property |> xpath(~x"./@MineralCost"i),
        min_ship_level: property |> xpath(~x"./@MinShipLevel"i),
        final_hp: property |> xpath(~x"./@FinalHp"i),
        final_pilot: property |> xpath(~x"./@FinalPilot"i),
        final_attack: property |> xpath(~x"./@FinalAttack"f),
        final_repair: property |> xpath(~x"./@FinalRepair"f),
        final_weapon: property |> xpath(~x"./@FinalWeapon"f),
        final_science: property |> xpath(~x"./@FinalScience"f),
        final_engine: property |> xpath(~x"./@FinalEngine"f),
        final_research: property |> xpath(~x"./@FinalResearch"f),
        character_leg_part_id: property |> xpath(~x"./@CharacterLegPartId"i),
        rarity: property |> xpath(~x"./@Rarity"s),
        progression_type: property |> xpath(~x"./@ProgressionType"s),
        character_design_description: property |> xpath(~x"./@CharacterDesignDescription"s),
        xp_requirement_scale: property |> xpath(~x"./@XpRequirementScale"i),
        max_character_level: property |> xpath(~x"./@MaxCharacterLevel"i),
        special_ability_type: property |> xpath(~x"./@SpecialAbilityType"s),
        special_ability_argument: property |> xpath(~x"./@SpecialAbilityArgument"i),
        special_ability_final_argument: property |> xpath(~x"./@SpecialAbilityFinalArgument"i),
        profile_sprite_id: property |> xpath(~x"./@ProfileSpriteId"i),
        run_speed: property |> xpath(~x"./@RunSpeed"i),
        training_capacity: property |> xpath(~x"./@TrainingCapacity"i),
        equipment_mask: property |> xpath(~x"./@EquipmentMask"i),
        speech_voice: property |> xpath(~x"./@SpeechVoice"s),
        speech_phrases: property |> xpath(~x"./@SpeechPhrases"s),
        speech_rate: property |> xpath(~x"./@SpeechRate"i),
        speech_pitch: property |> xpath(~x"./@SpeechPitch"i),
        flags: property |> xpath(~x"./@Flags"i),
        root_character_design_id: property |> xpath(~x"./@RootCharacterDesignId"i),
        tap_sound_file_id: property |> xpath(~x"./@TapSoundFileId"i),
        action_sound_file_id: property |> xpath(~x"./@ActionSoundFileId"i),
        collection_design_id: property |> xpath(~x"./@CollectionDesignId"i),
        parts: property |> xpath(~x"./CharacterParts/CharacterPart"l) |> Enum.map(fn (property1) -> 
          %PSSApis.Responses.CrewPart{
            character_part_id: property1 |> xpath(~x"./@CharacterPartId"i),
            character_part_name: property1 |> xpath(~x"./@CharacterPartName"s),
            character_part_type: property1 |> xpath(~x"./@CharacterPartType"s),
            standard_sprite_id: property1 |> xpath(~x"./@StandardSpriteId"i),
            standard_file_id: property1 |> xpath(~x"./@StandardFileId"i),
            action_file_id: property1 |> xpath(~x"./@ActionFileId"i),
            standard_border_file_id: property1 |> xpath(~x"./@StandardBorderFileId"i),
            action_border_file_id: property1 |> xpath(~x"./@ActionBorderFileId"i),
            action_sprite_id: property1 |> xpath(~x"./@ActionSpriteId"i),
            standard_border_sprite_id: property1 |> xpath(~x"./@StandardBorderSpriteId"i),
            action_border_sprite_id: property1 |> xpath(~x"./@ActionBorderSpriteId"i)
          }end)
      }
    end)
  end

  def find_by_id(crews, crew_id) do
    Enum.filter(crews, fn(x) -> x.character_design_id == crew_id end) |> hd
  end
end