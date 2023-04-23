class Bob
  def self.hey(sentence)
    remark = sentence.strip
    yelling = remark == remark.upcase && remark.match?(/[a-zA-Z]/)
    asking_question = remark.end_with?('?')
    silence = remark.empty?

    return "Calm down, I know what I'm doing!" if yelling && asking_question
    return 'Whoa, chill out!' if yelling
    return 'Sure.' if asking_question
    return 'Fine. Be that way!' if silence

    'Whatever.'
  end
end
