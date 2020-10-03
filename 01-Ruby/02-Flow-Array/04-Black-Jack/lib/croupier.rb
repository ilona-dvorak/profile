require_relative 'black_jack'
def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  return "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  if player_score > 21
    "Lose"
  elsif player_score == 21
    "Black Jack"
  elsif player_score > bank_score
    "Win"
  elsif player_score < bank_score
    "Lose"
  elsif player_score == bank_score
    "Push"
  end
end
