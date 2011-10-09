answer := Random value(1, 100) round
lastGuess := nil

for(attempt, 1, 10,
    guess := Number constants nan

    # Grab a number guess from stdIn
    while(guess isNan,
        write("(Try ", attempt, ") Guess a number between 1-100:  ")
        guess = File standardInput readLine asNumber
    )

    if(answer == guess, 
        "You guessed correctly!  Congratulations!" println
        exit
    )

    # Hints
    if (lastGuess,
        if((answer - guess) abs < (answer - lastGuess) abs,
            "Hotter!" println, "Colder..." println
        )
    )

    lastGuess = guess
)

writeln("Sorry!  The correct answer was:  ", answer)
