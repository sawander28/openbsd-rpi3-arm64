def add_colon_every_second_char(input_string):
    result = ""
    L = len(input_string)
    for i in range(L):
        result += input_string[i]
        if (i + 1) % 2 == 0 and i < L - 1:
            result += ":"
    return result
