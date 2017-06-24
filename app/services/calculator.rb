class Calculator
  include Singleton

  def sum(user_phenotypes)
    summaries = user_phenotypes.map do |user_phenotype|
      user_phenotype.each_with_object({}) do |ph, obj|
        obj[ph.table.phenotype.table.display_name] = ph.table.summary.table.score
      end
    end
    keys = summaries.first.keys
    calc_result = keys.each_with_object({}) do |key, obj|
      obj[key] = summaries.sum{|el| el[key]}
    end
    calc_result
  end
end