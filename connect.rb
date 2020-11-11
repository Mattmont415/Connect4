
class Connect

  def gameon
    true
  end

  def initialize
    @b = [["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"],
          ["-","-","-","-","-","-","-"]
        ]
    @colful = [false,false,false,false,false,false,false]
  end  


  def draw_board
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][5]}  |  #{@b[1][5]}  |  #{@b[2][5]}  |  #{@b[3][5]}  |  #{@b[4][5]}  |  #{@b[5][5]}  |  #{@b[6][5]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][4]}  |  #{@b[1][4]}  |  #{@b[2][4]}  |  #{@b[3][4]}  |  #{@b[4][4]}  |  #{@b[5][4]}  |  #{@b[6][4]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][3]}  |  #{@b[1][3]}  |  #{@b[2][3]}  |  #{@b[3][3]}  |  #{@b[4][3]}  |  #{@b[5][3]}  |  #{@b[6][3]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][2]}  |  #{@b[1][2]}  |  #{@b[2][2]}  |  #{@b[3][2]}  |  #{@b[4][2]}  |  #{@b[5][2]}  |  #{@b[6][2]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][1]}  |  #{@b[1][1]}  |  #{@b[2][1]}  |  #{@b[3][1]}  |  #{@b[4][1]}  |  #{@b[5][1]}  |  #{@b[6][1]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "|     |     |     |     |     |     |     |"
    puts "|  #{@b[0][0]}  |  #{@b[1][0]}  |  #{@b[2][0]}  |  #{@b[3][0]}  |  #{@b[4][0]}  |  #{@b[5][0]}  |  #{@b[6][0]}  |"
    puts "|_____|_____|_____|_____|_____|_____|_____|"
    puts "   0     1     2     3     4     5     6"
  end

  def reset_game
    7.times do |x|
      7.times do |y|
        @b[x][y] = "-"
      end
    end
  end




  def p1_turn
    #Checks if input is valid and column is not full
    puts "Player 1: "
    puts "Please pick a column that is not fully occupied: from 0-6"
    input = gets.chomp
    while input < "0" || input > "6" || input.length > 1
      puts "Invalid column choice, please try again"
      input = gets.chomp
    end
    input = input.to_i
    while @b[input][5] == "X" || @b[input][5] == "O"
      puts "That column is full, please choose another!"
      input = gets.chomp
      while input < "0" || input > "6"
        puts "Invalid column choice, please try again"
        input = gets.chomp
      end
      input = input.to_i
    end

    y = 0
    while (@b[input][y] == "X" || @b[input][y] == "O")
      y += 1
    end
    @b[input][y] = "X"

    coord = [input,y]
    return coord
  end


  def p2_turn
    puts "Player 2: "
    puts "Please pick a column that is not fully occupied: from 0-6"
    input = gets.chomp
    while input < "0" || input > "6" || input.length > 1
      puts "Invalid column choice, please try again"
      input = gets.chomp
    end
    input = input.to_i
    while @b[input][5] == "X" || @b[input][5] == "O"
      puts "That column is full, please choose another!"
      input = gets.chomp
      while input < "0" || input > "6"
        puts "Invalid column choice, please try again"
        input = gets.chomp
      end
      input = input.to_i
    end

    y = 0
    while (@b[input][y] == "X" || @b[input][y] == "O")
      y += 1
    end
    @b[input][y] = "O"

    coord = [input,y]
    return coord
  end




  def check_win(cr)
    #cr is the character X or O
    win = false

    #Successful checkwin vertically, with the coordinates below the guessed coord
    win = true if @b[cr[0]][cr[1]-1] == @b[cr[0]][cr[1]] && @b[cr[0]][cr[1]-2] == @b[cr[0]][cr[1]] && @b[cr[0]][cr[1]-3] == @b[cr[0]][cr[1]] 
    #Successful checkwin horizontally
    win = true if @b[cr[0]-3][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]-2][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]-1][cr[1]] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-2][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]-1][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-1][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]+1][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]] == @b[cr[0]][cr[1]] && @b[cr[0]+3][cr[1]] == @b[cr[0]][cr[1]] 
    #Successful  checkwin FOREslash diagonal
    win = true if @b[cr[0]+1][cr[1]+1] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]+2] == @b[cr[0]][cr[1]] && @b[cr[0]+3][cr[1]+3] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-1][cr[1]-1] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]+1] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]+2] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-2][cr[1]-2] == @b[cr[0]][cr[1]] && @b[cr[0]-1][cr[1]-1] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]+1] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-3][cr[1]-3] == @b[cr[0]][cr[1]] && @b[cr[0]-2][cr[1]-2] == @b[cr[0]][cr[1]] && @b[cr[0]-1][cr[1]-1] == @b[cr[0]][cr[1]] 
    #Successful  checkwin BACKslash diagonal
    win = true if @b[cr[0]-1][cr[1]+1] == @b[cr[0]][cr[1]] && @b[cr[0]-2][cr[1]+2] == @b[cr[0]][cr[1]] && @b[cr[0]-3][cr[1]+3] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-2][cr[1]+2] == @b[cr[0]][cr[1]] && @b[cr[0]-1][cr[1]+1] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]-1] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]-1][cr[1]+1] == @b[cr[0]][cr[1]] && @b[cr[0]+1][cr[1]-1] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]-2] == @b[cr[0]][cr[1]] 
    win = true if @b[cr[0]+1][cr[1]-1] == @b[cr[0]][cr[1]] && @b[cr[0]+2][cr[1]-2] == @b[cr[0]][cr[1]] && @b[cr[0]+3][cr[1]-3] == @b[cr[0]][cr[1]] 
    win
  end

  def check_tie
    count = 0
    istie = false
    7.times do |x|
      6.times do |y|
        count += 1 if @b[x][y] == "X" || @b[x][y] == "O"
      end
    end
    count >= 42 ? istie = true : istie = false
  end


end

game = Connect.new
coord = []
gameover = false

p1_score = 0
p2_score = 0
tie_score = 0

replay = true

while replay == true
  randgo = rand()
  if randgo >= 0.5
    while gameover == false
      #Player 1 turn
      game.draw_board
      coord = game.p1_turn
      if game.check_win(coord)
        game.draw_board
        puts "Player 1 wins!"
        p1_score += 1
        gameover = true
        break
      end
      if game.check_tie 
        game.draw_board
        puts "Game is a draw!"
        tie_score += 1
        gameover = true
        break
      end
      #Player 2 turn
      game.draw_board
      coord = game.p2_turn
      if game.check_win(coord)
        game.draw_board
        puts "Player 2 wins!"
        p2_score += 1
        gameover = true
        break
      end
      if game.check_tie 
        game.draw_board
        puts "Game is a draw!"
        tie_score += 1
        gameover = true
        break
      end

    end
    puts "Player 1 score: " + p1_score.to_s
    puts "Player 2 score: " + p2_score.to_s
    puts "Tie score:      " + tie_score.to_s
    puts

    puts "Do you want to play again? Type 'Y' for yes, any other key for no"
    replay = gets.chomp.to_s
    if replay == 'y' || replay == "Y"
      game.reset_game
      replay = true
      gameover = false
    else   
      puts "Game over!"
      replay = false
    end
  else
    while gameover == false
      #Player 2 turn
      game.draw_board
      coord = game.p2_turn
      if game.check_win(coord)
        game.draw_board
        puts "Player 2 wins!"
        p2_score += 1
        gameover = true
        break
      end
      if game.check_tie 
        game.draw_board
        puts "Game is a draw!"
        tie_score += 1
        gameover = true
        break
      end
      #Player 1 turn
      game.draw_board
      coord = game.p1_turn
      if game.check_win(coord)
        game.draw_board
        puts "Player 1 wins!"
        p1_score += 1
        gameover = true
        break
      end
      if game.check_tie 
        game.draw_board
        puts "Game is a draw!"
        tie_score += 1
        gameover = true
        break
      end


    end
    puts "Player 1 score: " + p1_score.to_s
    puts "Player 2 score: " + p2_score.to_s
    puts "Tie score:      " + tie_score.to_s
    puts

    puts "Do you want to play again? Type 'Y' for yes, any other key for no"
    replay = gets.chomp.to_s
    if replay == 'y' || replay == "Y"
      game.reset_game
      replay = true
      gameover = false
    else   
      puts "Game over!"
      replay = false
    end
  end
end