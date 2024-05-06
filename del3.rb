def game()
    puts("""
        Välkommen till Nim! Nim är ett strategispel för två spelare med tändstickor (eller andra markörer).
      
        **Målet:** Vara den som tar den sista tändstickan.
      
        **Så här går spelet till:**
      
        1. Välj mellan 3 och 7 högar med tändstickor.
        2. Turas om att ta bort 1 till 3 tändstickor från valfri hög under din tur.
        3. Du kan inte ta fler tändstickor än vad som finns i högen.
        4. Spelet fortsätter tills det bara finns en enda tändsticka kvar.
        5. Den som tar den sista tändstickan vinner!
      
        **Tips:** Försök att lämna din motståndare i en position där de bara kan ta bort den sista tändstickan.

        """)

    puts "Vill du spela mot en dator eller en annan spelare, Skriv in dator eller spelare (D/S)"

    opponent = gets.chomp.to_s.downcase
    while opponent != "d" && opponent != "s"
        puts "Svaret måste vara D (dator) eller S (spelare)"
        opponent = gets.chomp.to_s.downcase
    end

    system("cls")

    if opponent == "s"
        puts "Skriv in namn på spelare 1:"
        name_1 = gets.chomp

        system("cls")

        puts "Skriv in namn på spelare 2:"
        name_2 = gets.chomp

        system("cls")
    else
        puts "Skriv in namn på spelare 1:"
        name_1 = gets.chomp

        name_2 = "Dator"

        system("cls")
    end

    puts "Spelarna är #{name_1} mot #{name_2}"

    puts "Hur många högar vill ni spela med? (3-7)"
    heaps = gets.chomp.to_i
    while heaps < 3 || heaps > 7
        puts "Välj mellan 3 till 7 högar"
        heaps = gets.chomp.to_i
    end
    
    system("cls")

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
        system("cls")
        puts "#{starting_player}:s tur"

        puts "Såhär ser högarna ut: #{sticks}"
        puts "Från vilken hög vill du ta bort 1-#{sticks.length}?:"
        heap_to_remove = gets.chomp.to_i

        while heap_to_remove > sticks.length || heap_to_remove < 1
            system("cls")
            puts "Det finns bara #{sticks.length}st högar kvar, från vilken hög vill du ta bort 1-#{sticks.length}?:"
            puts "#{sticks}"
            heap_to_remove = gets.chomp.to_i
        end
        system("cls")
        puts "Det finns #{sticks[heap_to_remove - 1]}st pinnar i högen"
        puts "Hur många pinnar vill du ta bort ur högen? (1-3)"
        sticks_to_remove = gets.chomp.to_i

        while sticks_to_remove > 3 || sticks_to_remove < 1
            system("cls")
            puts "Det finns #{sticks[heap_to_remove - 1]}st pinnar kvar, hur många vill du ta bort (1-3)?:"
            puts "Fel antal pinnar. Man måste ta bort ett ett antal mellan 1-3."
            sticks_to_remove = gets.chomp.to_i
        end

        sticks[heap_to_remove - 1] -= sticks_to_remove

        if sticks[heap_to_remove - 1] <= 0
            sticks.delete_at(heap_to_remove - 1)
        end

        if starting_player == name_1
            starting_player = name_2
        else
            starting_player = name_1
        end

        sticks_left = false
        i = 0
        while i < sticks.length
            if sticks[i] > 0
                sticks_left = true    
            end
            i += 1
        end
        if sticks_left == false
            system("cls")
            puts "VINNARER ÄR: #{starting_player}"
            break
        end
    end
end


def pve(sticks, heaps, name_1, name_2, starting_player)
    while heaps > 0
        system("cls")
        puts "#{starting_player}:s tur"

        if starting_player == "Dator"
            puts "Såhär ser högarna ut: #{sticks}"

            heap_to_remove = pro_computer(sticks)[0]
            sticks_to_remove = pro_computer(sticks)[1]

            puts "Datorn tar bort #{sticks_to_remove} från hög #{heap_to_remove}"
            sleep(4)
        else
            puts "Såhär ser högarna ut: #{sticks}"
            puts "Från vilken hög vill du ta bort 1-#{sticks.length}?:"
            heap_to_remove = gets.chomp.to_i

            while heap_to_remove > sticks.length || heap_to_remove < 1
                system("cls")
                puts "Det finns bara #{sticks.length}st högar kvar, från vilken hög vill du ta bort 1-#{sticks.length}?:"
                puts "#{sticks}"
                heap_to_remove = gets.chomp.to_i
            end
            system("cls")
            puts "Det finns #{sticks[heap_to_remove - 1]}st pinnar i högen"
            puts "Hur många pinnar vill du ta bort ur högen? (1-3)"
            sticks_to_remove = gets.chomp.to_i

            while sticks_to_remove > 3 || sticks_to_remove < 1
                system("cls")
                puts "Det finns #{sticks[heap_to_remove - 1]}st pinnar kvar, hur många vill du ta bort (1-3)?:"
                puts "Fel antal pinnar. Man måste ta bort ett ett antal mellan 1-3."
                sticks_to_remove = gets.chomp.to_i
            end
        end
        sticks[heap_to_remove - 1] -= sticks_to_remove

        if sticks[heap_to_remove - 1] <= 0
            sticks.delete_at(heap_to_remove - 1)
        end

        if starting_player == name_1
            starting_player = name_2
        else
            starting_player = name_1
        end

        sticks_left = false
        i = 0
        while i < sticks.length
            if sticks[i] > 0
                sticks_left = true    
            end
            i += 1
        end
        if sticks_left == false
            system("cls")
            puts "VINNARER ÄR: #{starting_player}"
            break
        end
    end
end

def pro_computer(sticks)

    i = 0
    while i < sticks.length
        if sticks[i] <= 4 && sticks[i] > 1
            heap_to_remove = i
        end
        i += 1
    end

    if 
        sticks_to_remove = rand(1..3)
    end
    
    return heap_to_remove, sticks_to_remove
end

game()