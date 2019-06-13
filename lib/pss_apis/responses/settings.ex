defmodule PSSApis.Responses.Settings do
  defstruct [ :setting_id, :server_setting_version, :minimum_client_version, :news, :maintenance_message, :alliance_badge_sprite_ids, 
              :daily_reward_type, :daily_reward_argument, :sale_type, :sale_argument, :sale_item_mask, :sale_once_only, :file_version, 
              :sprite_version, :character_design_version, :character_part_version, :animation_version, :room_design_version, 
              :missile_design_version, :research_design_version, :room_design_sprite_version, :achievement_design_version, :condition_type_version, 
              :craft_design_version, :item_design_version, :action_type_version, :room_design_purchase_version, :ship_design_version, :league_version, 
              :background_version, :mission_design_version, :sale_quantity, :training_design_version, :feature_mask, :daily_item_rewards,
              :limited_catalog_type, :limited_catalog_argument, :limited_catalog_quantity, :limited_catalog_expiry_date, :limited_catalog_currency_type,
              :limited_catalog_currency_amount, :limited_catalog_max_total, :cargo_items, :cargo_prices, :challenge_design_version, :production_server, 
              :flags, :character_design_action_version, :android_build, :reward_design_version, :tournament_final_duration, :division_design_version, 
              :collection_design_version, :tournament_news, :reward_point_percentage, :is_debug, :draw_design_version, :ability_design_version, 
              :vip_design_version, :star_system_version, :star_system_link_version, :planet_version, :sale_title, :max_daily_draws, 
              :limited_catalog_restock_quantity, :current_android_version, :promotion_design_version, :reward_video_time_reduction, 
              :ab_testing_rollout, :loot_modifiers, :tournament_bonus_score, :situation_design_version, :a_feature_mask, :b_feature_mask, 
              :prestige_top_character_design_id, :pro_bono_limit, :ab_testing_start_date, :support_task_ran_date, :sale_start_date, 
              :sale_end_date, :news_sprite_id, :tournament_sprite_id, :new_user_count, :news_update_date, :replay_available_date, 
              :common_crew_id, :background_id, :hero_crew_id ]
  
end