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
          "Uric acid"                             => "懐石料理", # 尿酸値
          "Iron"                                  => "レバー", # 血液中の鉄分濃度
          "Magnesium"                             => "スペイン料理", # 血液中のマグネシウムイオン濃度
          "Calcium"                               => "イタリアン", # 血液中のカルシウムイオン濃度
          "Beta-carotene"                         => "サラダ", # 血液中のβカロテン濃度
          "Alpha-linolenic"                       => "てんぷら", # 血液中のαリノレン酸濃度
          "DHA"                                   => "マグロ", # 血液中のDHA濃度
          "EPA"                                   => "いわし", # 血液中のEPA濃度
          "Bitter Taste"                          => "野菜", # Bitter Taste
          "Caffeine Consumption"                  => "洋菓子", # カフェイン消費量
          "Food addiction"                        => "焼き物", # 食中毒
          "Protain intake"                        => "肉", # タンパク質摂取傾向
          "Carbohydrate intake"                   => "パスタ", # 炭水化物摂取傾向
          "Fat intake"                            => "肉", #脂質摂取傾向
          "Red wine liking"                       => "ワイン", # 赤ワイン好き
          "White wine liking"                     => "ワイン", # 白ワイン好き
          "Sweet taste"                           => "甘味", # 甘みの感じやすさ
          "Acidly taste"                          => "タイ料理", # 酸味の感じやすさ
          "Salty taste"                           => "ラーメン", # 塩味の感じやすさ
          "Tangy taste"                           => "次郎系", # パンチのある味のかんじや感じやすさ
          "Dry taste"                             => "エスニック", # 辛口な味の感じやすさ
          "Mellow taste"                          => "バー", # 芳醇な味の感じやすさ
          "Sake liking"                           => "日本酒", # 日本酒の辛口／甘口の好み
          "Shochu liking"                         => "芋焼酎", # 芋焼酎好き
          "Shochu (wheat) liking"                 => "麦焼酎", # 麦焼酎好き
          "Shochu (rice) liking"                  => "米焼酎" # 米焼酎好き
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