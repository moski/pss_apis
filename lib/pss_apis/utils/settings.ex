defmodule PSSApis.Utils.Settings do
  import SweetXml

  def parse_response(resp) do
    resp 
    |> xpath(~x"//SettingService/GetLatestSetting/Setting"l)
    |> Enum.map(fn (property) ->
      %PSSApis.Responses.Settings{
        setting_id: property |> xpath(~x"./@SettingId"i),
        server_setting_version: property |> xpath(~x"./@ServerSettingVersion"i),
        minimum_client_version: property |> xpath(~x"./@MinimumClientVersion"f),
        news: property |> xpath(~x"./@News"s),
        maintenance_message: property |> xpath(~x"./@MaintenanceMessage"s),
        alliance_badge_sprite_ids: property |> xpath(~x"./@AllianceBadgeSpriteIds"s),
        daily_reward_type: property |> xpath(~x"./@DailyRewardType"s),
        daily_reward_argument: property |> xpath(~x"./@DailyRewardArgument"f),
        sale_type: property |> xpath(~x"./@SaleType"s),
        sale_argument: property |> xpath(~x"./@SaleArgument"i),
        sale_item_mask: property |> xpath(~x"./@SaleItemMask"f),
        sale_once_only: property |> xpath(~x"./@SaleOnceOnly"s),
        file_version: property |> xpath(~x"./@FileVersion"i),
        sprite_version: property |> xpath(~x"./@SpriteVersion"i),
        character_design_version: property |> xpath(~x"./@CharacterDesignVersion"i),
        character_part_version: property |> xpath(~x"./@CharacterPartVersion"i),
        animation_version: property |> xpath(~x"./@AnimationVersion"i),
        room_design_version: property |> xpath(~x"./@RoomDesignVersion"i),
        missile_design_version: property |> xpath(~x"./@MissileDesignVersion"i),
        research_design_version: property |> xpath(~x"./@ResearchDesignVersion"i),
        room_design_sprite_version: property |> xpath(~x"./@RoomDesignSpriteVersion"i),
        achievement_design_version: property |> xpath(~x"./@AchievementDesignVersion"i),
        condition_type_version: property |> xpath(~x"./@ConditionTypeVersion"i),
        craft_design_version: property |> xpath(~x"./@CraftDesignVersion"i),
        item_design_version: property |> xpath(~x"./@ItemDesignVersion"i),
        action_type_version: property |> xpath(~x"./@ActionTypeVersion"i),
        room_design_purchase_version: property |> xpath(~x"./@RoomDesignPurchaseVersion"i),
        ship_design_version: property |> xpath(~x"./@ShipDesignVersion"i),
        league_version: property |> xpath(~x"./@LeagueVersion"i),
        background_version: property |> xpath(~x"./@BackgroundVersion"i),
        mission_design_version: property |> xpath(~x"./@MissionDesignVersion"i),
        sale_quantity: property |> xpath(~x"./@SaleQuantity"i),
        training_design_version: property |> xpath(~x"./@TrainingDesignVersion"i),
        feature_mask: property |> xpath(~x"./@FeatureMask"i),
        daily_item_rewards: property |> xpath(~x"./@DailyItemRewards"s),
        limited_catalog_type: property |> xpath(~x"./@LimitedCatalogType"s),
        limited_catalog_argument: property |> xpath(~x"./@LimitedCatalogArgument"i),
        limited_catalog_quantity: property |> xpath(~x"./@LimitedCatalogQuantity"i),
        limited_catalog_expiry_date: property |> xpath(~x"./@LimitedCatalogExpiryDate"s),
        limited_catalog_currency_type: property |> xpath(~x"./@LimitedCatalogCurrencyType"s),
        limited_catalog_currency_amount: property |> xpath(~x"./@LimitedCatalogCurrencyAmount"i),
        limited_catalog_max_total: property |> xpath(~x"./@LimitedCatalogMaxTotal"i),
        cargo_items: property |> xpath(~x"./@CargoItems"s),
        cargo_prices: property |> xpath(~x"./@CargoPrices"s),
        challenge_design_version: property |> xpath(~x"./@ChallengeDesignVersion"i),
        production_server: property |> xpath(~x"./@ProductionServer"s),
        flags: property |> xpath(~x"./@Flags"i),
        character_design_action_version: property |> xpath(~x"./@CharacterDesignActionVersion"i),
        android_build: property |> xpath(~x"./@AndroidBuild"s),
        reward_design_version: property |> xpath(~x"./@RewardDesignVersion"i),
        tournament_final_duration: property |> xpath(~x"./@TournamentFinalDuration"i),
        division_design_version: property |> xpath(~x"./@DivisionDesignVersion"i),
        collection_design_version: property |> xpath(~x"./@CollectionDesignVersion"i),
        tournament_news: property |> xpath(~x"./@TournamentNews"s),
        reward_point_percentage: property |> xpath(~x"./@RewardPointPercentage"i),
        is_debug: property |> xpath(~x"./@IsDebug"s),
        draw_design_version: property |> xpath(~x"./@DrawDesignVersion"i),
        ability_design_version: property |> xpath(~x"./@AbilityDesignVersion"i),
        vip_design_version: property |> xpath(~x"./@VipDesignVersion"i),
        star_system_version: property |> xpath(~x"./@StarSystemVersion"i),
        star_system_link_version: property |> xpath(~x"./@StarSystemLinkVersion"i),
        planet_version: property |> xpath(~x"./@PlanetVersion"i),
        sale_title: property |> xpath(~x"./@SaleTitle"s),
        max_daily_draws: property |> xpath(~x"./@MaxDailyDraws"i),
        limited_catalog_restock_quantity: property |> xpath(~x"./@LimitedCatalogRestockQuantity"i),
        current_android_version: property |> xpath(~x"./@CurrentAndroidVersion"f),
        promotion_design_version: property |> xpath(~x"./@PromotionDesignVersion"i),
        reward_video_time_reduction: property |> xpath(~x"./@RewardVideoTimeReduction"i),
        ab_testing_rollout: property |> xpath(~x"./@AbTestingRollout"s),
        loot_modifiers: property |> xpath(~x"./@LootModifiers"s),
        tournament_bonus_score: property |> xpath(~x"./@TournamentBonusScore"i),
        situation_design_version: property |> xpath(~x"./@SituationDesignVersion"i),
        a_feature_mask: property |> xpath(~x"./@AFeatureMask"i),
        b_feature_mask: property |> xpath(~x"./@BFeatureMask"i),
        prestige_top_character_design_id: property |> xpath(~x"./@PrestigeTopCharacterDesignId"i),
        pro_bono_limit: property |> xpath(~x"./@ProBonoLimit"i),
        ab_testing_start_date: property |> xpath(~x"./@AbTestingStartDate"s),
        support_task_ran_date: property |> xpath(~x"./@SupportTaskRanDate"s),
        sale_start_date: property |> xpath(~x"./@SaleStartDate"s) |> Timex.parse!("{ISO:Extended}"),
        sale_end_date: property |> xpath(~x"./@SaleEndDate"s) |> Timex.parse!("{ISO:Extended}"),
        news_sprite_id: property |> xpath(~x"./@NewsSpriteId"i),
        tournament_sprite_id: property |> xpath(~x"./@TournamentSpriteId"i),
        new_user_count: property |> xpath(~x"./@NewUserCount"i),
        news_update_date: property |> xpath(~x"./@NewsUpdateDate"s),
        replay_available_date: property |> xpath(~x"./@ReplayAvailableDate"s),
        common_crew_id: property |> xpath(~x"./@CommonCrewId"i),
        background_id: property |> xpath(~x"./@BackgroundId"i),
        hero_crew_id: property |> xpath(~x"./@HeroCrewId"i),

        # production_server: property |> xpath(~x"./@ProductionServer"s),
        # news: property |> xpath(~x"./@News"s),
        # common_crew_id: property |> xpath(~x"./@CommonCrewId"i),
        # hero_crew_id: property |> xpath(~x"./@HeroCrewId"i)

      }
    end)
    |> hd
  end

  def is_sale_valid(settings) do
    now = Timex.now
    Timex.before?(settings.sale_start_date, now) and Timex.before?(now, settings.sale_end_date)
  end
end