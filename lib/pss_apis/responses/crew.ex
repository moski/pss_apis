defmodule PSSApis.Responses.Crew do
  defstruct [ :character_design_id, :character_design_name, :character_head_part_id, :character_body_part_id, :gender_type,
              :race_type, :hp, :pilot, :attack, :fire_resistance, :repair, :weapon, :science, :engine, :research, :level, 
              :walking_speed, :gas_cost, :mineral_cost, :min_ship_level, :final_hp, :final_pilot, :final_attack, :final_repair, 
              :final_weapon, :final_science, :final_engine, :final_research, :character_leg_part_id, :rarity, :progression_type, 
              :character_design_description, :xp_requirement_scale, :max_character_level, :special_ability_type, :special_ability_argument, 
              :special_ability_final_argument, :profile_sprite_id, :run_speed, :training_capacity, :equipment_mask, :speech_voice, 
              :speech_phrases, :speech_rate, :speech_pitch, :flags, :root_character_design_id, :tap_sound_file_id, :action_sound_file_id, 
              :collection_design_id, :parts]
end