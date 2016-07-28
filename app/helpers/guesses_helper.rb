module GuessesHelper

  def sanitize(answer)
    # return answer.downcase.gsub(/\s+/, '')
    return answer.downcase.gsub(/<i>|\s+|<\/i>/, '')
  end
end
