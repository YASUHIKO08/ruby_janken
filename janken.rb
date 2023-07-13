#じゃんけん導入
puts "じゃんけん.."
puts "0(グー),1(チョキ),2(パー),3(戦わない)"

class Janken_Game
  #じゃんけんメソッド
  def janken_method(janken_result)
    #じゃんけんの手
    janken_hand = ["グー","チョキ","パー"]
    #プレイヤーの手の数値を定義（じゃんけん）
  　player_janken_hand = [0,1,2]    
    #相手の手をランダムに返す
    opponent_hand = rand(2)
    #あっち向いてホイの手
    attimuite_hoi_hand = ["上","右","下","左"]
    #相手の方向をランダムに返す
    opponent_direction = rand(3)
  
    #プレイヤーが入力した数値を反映
    player_hand = gets.to_i
  
    if player_hand >= 0 && player_hand < 3 
      puts "------------------------------------"
      puts "ホイ！"
      puts "あなたは#{janken_hand[player_hand]}を出しました"
      puts "相手は#{janken_hand[opponent_hand]}を出しました"
    elsif player_hand == 3
      puts  "------------------------------------"
      puts "さよなら〜"
      exit
    else
      puts  "------------------------------------"
      puts "やり直し"
      exit
    end

    #じゃんけんの勝敗を定義
    #勝ちパターン
    janken_victory = player_hand == 0 && opponent_hand == 1 ||
                     player_hand == 1 && opponent_hand == 2||
                     player_hand == 2 && opponent_hand == 0
    #負けパターン
    janken_lose = player_hand == 0 && opponent_hand == 2 ||
                  player_hand == 1 && opponent_hand == 0 ||
                  player_hand == 2 && opponent_hand == 1
    #引き分けパターン
    janken_draw = player_hand == opponent_hand
  
    #あいこの場合
    if janken_draw
      puts "------------------------------------"
      puts "あいこで..."
      puts "0(グー),1(チョキ),2(パー),3(戦わない)"
      return false
    end
  
    #あっち向いてホイの導入
    puts "------------------------------------"
    puts "あっち向いて〜"
    puts "0(上),1(右),2(下),3(左)"
    player_direction = gets.to_i
  
    #じゃんけんの結果による分岐
    if player_direction <= 3 && janken_victory || janken_lose
      puts "------------------------------------"
      puts "ホイ！"
      puts "あなた:#{attimuite_hoi_hand[player_direction]}"
      puts "あいて:#{attimuite_hoi_hand[opponent_direction]}"
    else player_direction != 0 || player_direction != 1 || player_direction != 2 || player_direction != 3
      puts "------------------------------------"
      puts "やり直し"
      exit
    end
  
    #じゃんけんとあっち向いてホイの結果を含んだ分岐
    if janken_victory && player_direction == opponent_direction
      puts "------------------------------------"
      puts "あなたの勝ちです"
      exit
    elsif janken_lose && player_direction == opponent_direction
      puts "------------------------------------"
      puts "あなたの負けです"
      exit
    elsif player_direction != opponent_direction
      puts "------------------------------------"
      puts "じゃんけん..."
      puts "0(グー),1(チョキ),2(パー),3(戦わない)"
      return false
    end
  end
end

#ルーブの変数を定義(falseとなればループ)
janken_game_loop = false

#じゃんけんメソッドを呼び出し
until janken_game_loop do
  janken_game = Janken_Game.new()
  janken_game.janken_method("janken_result")
end

  