module SchedulesHelper
  def allday(bloo)
    if bloo
      "○"
    else
      ""
    end
  end
  
  
  def count_list(count)
    "スケジュール合計: #{count}件"
  end
end