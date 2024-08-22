def unqiue(array)
    new_array = []
    elements_to_check = []

    for i in 0...array.length()
        if elements_to_check.length != 0
            for j in 0...elements_to_check.length()
                if array[i] != elements_to_check[j] || elements_to_check.length != 0
                    new_array.append(array[i])
                else
                    elements_to_check.append(array[i])
                end
            end
        end
    end

    return new_array
end

array1 = [0, 9, 2, 2]

p unqiue(array1)