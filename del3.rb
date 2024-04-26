def game()
    puts "Vill du spela mot en dator eller en annan spelare, Skriv in dator eller spelare (D/S)"

    opponent = gets.chomp.to_s.downcase
    while opponent != "d" && opponent != "s"
        puts "Svaret måste vara D (dator) eller S (spelare)"
        opponent = gets.chomp.to_s.downcase
    end

    if opponent == "s"
        puts "Skriv in namn på spelare 1:"
        name_1 = gets.chomp

        puts "Skriv in namn på spelare 2:"
        name_2 = gets.chomp
    else
        puts "Skriv in namn på spelare 1:"
        name_1 = gets.chomp

        name_2 = "Dator"
    end

    puts "Hur många högar vill du spela med? (3-7)"
    heaps = gets.chomp.to_i
    while heaps < 3 || heaps > 7
        puts "Välj mellan 3 till 7 högar"
        heaps = gets.chomp.to_i
    end

    answer = nil

    while answer != "n"
        lowest_heap = heaps * 2 - 1
        sticks = [lowest_heap]
        
        i = 1
        while i < heaps
            sticks.append(lowest_heap - 2 * i)
            i += 1
        end

        if rand(1...2) == 1
            starting_player = name_1
        else
            starting_player = name_2
        end

        if opponent == "s"
            pvp(sticks, heaps, name_1, name_2, starting_player)
        else
            pve(sticks, heaps, name_1, name_2, starting_player)
        end
            
            
        puts "Vill ni spela igen? (Y/N)"
        answer = gets.chomp.to_s.downcase
        while answer != "n" && answer != "y"
            puts "Svaret måste vara Y eller N"
            answer = gets.chomp.to_s.downcase
        end
    end
end


def pvp(sticks, heaps, name_1, name_2, starting_player)
    while heaps > 0
        puts "#{starting_player}:s tur"

        puts "Såhär ser högarna ut: #{sticks}"
        puts "Från vilken hög vill du ta bort 1-#{heaps}?:"
        heap_to_remove = gets.chomp.to_i 

        while heap_to_remove > heaps || heap_to_remove < 1
            puts "Det finns #{heaps}st högar kvar, från vilken hög vill du ta bort 1-#{heaps}?:"
            puts "Det finns bara #{heaps} antal högar, du måste ta bort från en av dem"
            heap_to_remove = gets.chomp.to_i
        end
        
        puts "Hur många pinnar vill du ta bort ur högen? (1-3)"
        sticks_to_remove = gets.chomp.to_i

        while sticks_to_remove > 3 || sticks_to_remove < 1
            puts "Det finns #{sticks[heap_to_remove]}st pinnar kvar, hur många vill du ta bort (1-3)?:"
            puts "Fel antal pinnar. Man måste ta bort ett ett antal mellan 1-3."
            sticks_to_remove = gets.chomp.to_i
        end

        sticks[heap_to_remove - 1] -= sticks_to_remove

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
end


def pve(sticks, name_1, name_2, starting_player)
    while sticks > 0
        if starting_player != "Dator"
            puts "#{starting_player}:s tur"

            puts "Det finns #{sticks}st pinnar kvar, hur många vill du ta bort (1-3)?:"
            sticks_to_remove = gets.chomp.to_i

            while sticks_to_remove > 3 || sticks_to_remove < 1
                puts "Det finns #{sticks}st pinnar kvar, hur många vill du ta bort (1-3)?:"
                puts "Fel antal pinnar. Man måste ta bort ett ett antal mellan 1-3."
                sticks_to_remove = gets.chomp.to_i
            end
        else
            sticks_to_remove = rand(1...3)
            puts "Datorn tog bort #{sticks_to_remove}st pinnar"
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
end


game()