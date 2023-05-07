Zadanie 1

Napisz skrypt covid.ps1 pobierający dane o osobach zakażonych przez koronawirusa w danym kraju. Skrypt powinien wyświetlić tabelę z kolumnami:
•	Kraj - Nazwa kraju np. United Kingdom.
•	Zakażeni - liczba osób zakażonych.
•	Ozdrowieńcy - liczba osób, które wyzdrowiały.
•	Zgony - liczba osób, które zmarły.
•	Czas - informacja o aktualności danych w formie różnicy czasowej pomiędzy obecnym czasem w systemie a znacznikiem czasowym z pobranych danych. Akceptowany czas w formacie “XX dni XXh XXm” np. 21m, 7h 30m albo 2 dni 10h 17m. 

Dane dostępne są po różnych API.

Zadanie 2

Napisz skrypt w PowerShellu find_duplicates.ps1, który przyjmuje jeden parametr nienazwany, który jest ścieżką do katalogu. Skrypt wyszukuje rekurencyjnie pliki w katalogu i buduje bazę danych hashy, które służyć będą do wyszukiwania duplikatów. Porównywanie plików polega na sprawdzeniu czy mają taką samą sumę kontrolną. Suma kontrolna liczona jednym z algorytmów funkcji (Get-FileHash)
Po zbudowaniu bazy danych, skrypt wypisuje zduplikowane pliki wraz z odpowiadającą im sumą kontrolną. 
Po ponownym uruchomieniu skryptu dla tego samego katalogu, skrypt wyszukuje pliki, ale liczy sumy kontrolne, tylko dla nowododanych plików oraz tych, które mają nowszą datę modyfikacji niż podczas ostatniego uruchomienia.
Baza danych przechowywana jest na dysku w postaci pliku w wybranym formacie:
•	Baza danych SQLite
•	Plik JSON
•	Plik CSV
•	Plik TXT
Liczenie sumy kontrolnej odbywać się powinno w podprocesach.

Zadanie 3

Napisz skrypt monitor.ps1 który będzie cyklicznie monitorował 2 dowolne zasoby i powiadamiał użytkownika w przypadku wykrycia sytuacji pożądanej lub niepokojącej.
