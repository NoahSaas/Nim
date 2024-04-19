def game()
    puts "Skriv in namn på spelare 1:"
    name_1 = gets.chomp

    puts "Skriv in namn på spelare 2:"
    name_2 = gets.chomp

    answer = nil

    while answer != "n"
        sticks = rand(11...17)

        if rand(1...2) == 1
            starting_player = name_1
        else
            starting_player = name_2
        end

        while sticks > 0
            puts "#{starting_player}:s tur"

            puts "Det finns #{sticks}st pinnar kvar, hur många vill du ta bort (1-3)?:"
            sticks_to_remove = gets.chomp.to_i

            while sticks_to_remove > 3 || sticks_to_remove < 1
                puts "Det finns #{sticks}st pinnar kvar, hur många vill du ta bort (1-3)?:"
                puts "Fel antal pinnar. Man måste ta bort ett ett antal mellan 1-3."
                sticks_to_remove = gets.chomp.to_i
            end

            sticks -= sticks_to_remove

            if starting_player == name_1
                starting_player = name_2
            else
                starting_player = name_1
            end

            if sticks <= 0
                puts "VINNARER ÄR: #{starting_player}"
                break
            end
        end
        puts "Vill ni spela igen? (Y/N)"
        answer = gets.chomp.to_s.downcase
        while answer != "n" && answer != "y"
            puts "Svaret måste vara Y eller N"
            answer = gets.chomp.to_s.downcase
        end
    end
end

game()