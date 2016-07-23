require 'httparty'

class Triviaapi
  def initialize
    @base_uri = "http://jservice.io/api/random?count=10"
  end

  def get_random
    return HTTParty.get(@base_uri).parsed_response
  end

  def create_question(response, x)
    Question.create(question_text: response["question"],
      answer: response["answer"],
      value: response["value"],
      quiz_id: x)
  end

  def seed_db
    3.times do |x|
      Quiz.create
      get_random.each do |q|
        create_question(q, (x+1))
      end
    end
  end
end

