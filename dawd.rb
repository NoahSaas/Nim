#Beskrivning: En funktion som tar in en array med tal som argument och returner medelvärdet av talen.
#Argument 1: list - Array, en lista som innehållr olika tal som används för att räkna ut medelvärdet.
#Return: avg - returnerar en float/int som berättar vad medelvärdet på alla tal i listan var.

#Exempel1: average([1,2,3,4]) => #10
#Exempel2: average([1, -1, 2, 3]) => #1.25
#Exempel3: average([0, -1, -64, 13]) => #-13.0
#Exempel4: average([nil, -1, -64, 13]) => #"Invalid data in array"
#Exempel5: average([2, -1, -64, 13, "stiririr"]) => #"Invalid data in array"
#Exempel5: average([2, -1, -64, 13, "stiririr"]) => #"Invalid data in array"
#Exempel5: average([2, -1, -64, 13, [1, 2, 3]]) => #"Invalid data in array"
#Exempel5: average([2, -1, -64, 13, ""]) => #"Invalid data in array"


#By: Noah SB
#Date: 2024-04-26


def average(list)
    for i in 0..list.length - 1
        if list[i].class != Float && list[i].class != Integer
            return "Invalid data in array"
        end
    end
    
    avg = list.sum/list.length.to_f

    return avg
end
