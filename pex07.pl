% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Laird Wheeler
%
% Documentation: No outside help receieved
%

% The query to get the answer(s) or that there is no answer
% ?- solve.

cadet(smith).
cadet(garcia).
cadet(jones).
cadet(chen).

object(cloud).
object(weather_balloon).
object(kite).
object(figher_aircraft).

day(tue).
day(wed).
day(thu).
day(fri).

solve :-
    Days = [
     	day(tue, TueCadet, TueObject),
        day(wed, WedCadet, WedObject),
        day(thu, ThuCadet, ThuObject),
        day(fri, FriCadet, FriObject)
    ],
    
    permutation([cloud, weather_balloon, kite, fighter_aircraft], [TueObject, WedObject, ThuObject, FriObject]),

    permutation([smith, garcia, jones, chen], [TueCadet, WedCadet, ThuCadet, FriCadet]),
    
    %Constraint 1
    \+ (member(day(_, smith, weather_balloon), Days)),
    \+ (member(day(_, smith, kite), Days)),
    %Constraint 2
    \+ (member(day(_, garcia, kite), Days)),
    %Constraint 3
    (FriCadet = chen ; FriObject = fighter_aircraft),
    %Constraint 4
    TueObject \= kite,
    %Constraint 5
    \+ (member(day(_, garcia, weather_balloon), Days)),
    \+ (member(day(_, jones, weather_balloon), Days)),
    %Constraint 6
    TueCadet \= jones,
    %Constraint 7
    member(day(_, smith, cloud), Days),
    %Constraint 8
    FriObject = fighter_aircraft,
    %Constraint 9
    WedObject \= weather_balloon,
    
    nl, write('Solution:'), 
    nl,
    print_result(tue, TueCadet, TueObject),
    print_result(wed, WedCadet, WedObject),
    print_result(thu, ThuCadet, ThuObject),
    print_result(fri, FriCadet, FriObject),
    nl.

print_result(Day, Cadet, Object) :-
    write('On '),
    write(Day),
    write(', C4C '),
    write(Cadet),
    write(' saw a '),
    write(Object),
    write('.'),
    nl.
