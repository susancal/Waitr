module GuessesHelper

  def sanitize(answer)
    return answer.downcase.gsub(/\s+/, '')
  end
end
