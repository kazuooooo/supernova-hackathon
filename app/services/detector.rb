class Detector
  include Singleton
  MAPPING =
      {
          "Caffein Metabolism"                    => "コーヒー", # カフェイン代謝の速さ
          "Alcohol Drinking Behavior"             => "居酒屋", # 飲酒量
          "Triglyceride"                          => "烏龍茶", # 血液中の中性脂肪濃度
          "LDL Cholesterol"                       => "魚介", # 悪玉コレステロール量
          "HDL Cholesterol"                       => "野菜", # 善玉コレステロール量
          "Vitamin A"                             => "ホルモン", # 血液中のビタミンA濃度
          "Vitamin B12"                           => "しじみ", # 血液中のビタミンB12濃度
          "Vitamin D"                             => "あんこう", # 血液中のビタミンD濃度
          "Vitamin D insufficiency"               => "いくら", # ビタミンD欠乏症
          "Vitamin E"                             => "とうもろこし", # 血液中のビタミンE濃度
          "Response to Vitamin E supplementation" => "米", # ビタミンEサプリへの反応
          "Folate"                                => "のり", # 血液中の葉酸レベル
          "Phosphorus"                            => "チーズ", # 血液中のリン濃度
          "Uric acid"                             => "しいたけ", # 尿酸値
          "Iron"                                  => "カツオ", # 血液中の鉄分濃度
          "Magnesium"                             => "", # 血液中のマグネシウムイオン濃度
          "Calcium"                               => 2, # 血液中のカルシウムイオン濃度
          "Beta-carotene"                         => 5, # 血液中のβカロテン濃度
          "Alpha-linolenic"                       => 4, # 血液中のαリノレン酸濃度
          "DHA"                                   => 4, # 血液中のDHA濃度
          "EPA"                                   => 5, # 血液中のEPA濃度
          "Bitter Taste"                          => 7, # Bitter Taste
          "Caffeine Consumption"                  => 3, # カフェイン消費量
          "Food addiction"                        => 7, # 食中毒
          "Protain intake"                        => 7, # タンパク質摂取傾向
          "Carbohydrate intake"                   => 4, # 炭水化物摂取傾向
          "Fat intake"                            => 5, # 脂質摂取傾向
          "Red wine liking"                       => 7, # 赤ワイン好き
          "White wine liking"                     => 7, # 白ワイン好き
          "Sweet taste"                           => 7, # 甘みの感じやすさ
          "Acidly taste"                          => 6, # 酸味の感じやすさ
          "Salty taste"                           => 7, # 塩味の感じやすさ
          "Tangy taste"                           => 5, # パンチのある味のかんじや感じやすさ
          "Dry taste"                             => 5, # 辛口な味の感じやすさ
          "Mellow taste"                          => 3, # 芳醇な味の感じやすさ
          "Sake liking"                           => "居酒屋", # 日本酒の辛口／甘口の好み
          "Shochu liking"                         => 4, # 芋焼酎好き
          "Shochu (wheat) liking"                 => 7, # 麦焼酎好き
          "Shochu (rice) liking"                  => 5 # 米焼酎好き
      }

  def detect(calc_result)
    top_3 = []
    3.times do
      max = calc_result.max_by { |k, v| v }
      top_3 << max
      calc_result.except!(max[0])
    end
    top_3.map { |elem| { MAPPING[elem[0]] => elem } }
  end

end