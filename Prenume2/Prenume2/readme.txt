Deci, ce am facut

StorageManager - e o clasa care initializeaza baza de date, si am facut copierea din sqlite.
- o sa fac acolo functii de citire din baza de date. Deocamdata nu prea ai la ce sa o folosesti

ControllerCuFRCCuTabel - e o clasa de baza care are un tabel si cu FRC, tre sa implementezi niste metode
ti-am scris eu loguri pe acolo ce tre sa faci si cum sa faci

SecondViewController - o sa extinda ControllerCuFRCCuTabel, il faci in storyboard, ii legi tabelul outlet, si implementezi ce metode trebuie, ca altfel iti da exceptie. Am scris loguri pe acolo in exceptii ce tre facut, si cam cum s-ar face

Obiectele din CoreData sunt Persoana si Zodiac. Deocamdata folosesti persoana.

Ce sa faci
1- sa scrii ce trebuie in clasa SecondViewController, sa afisezi in tabel toate persoanele
o celula sa aiba doua label-uri, una e prenumele, si alta e daca e musulman sau crestin

2. Sa faci un controller de detalii, atunci cand se da click pe o celula, afisezi in detalii date despre respectiva persoana.
- titlul controllerului sa fie numele persoanei
- sa aiba doua un textview si deasupra un segmented controller cu 3 segmente: istorie, caracter, provenienta
- cand schimbi segmentul selectat, se afiseaza in textview fie istoria, fie caracterul, fie provenienta

3. Sa faci in controllerul SecondViewController, sa mearga search-ul. Cum il faci
- te uiti in clasa de baza cum e facut fetchResultsControllerul ala
- faci si tu unul la fel in clasa SecondViewController, care sa fie searchFetchResultsController.
- implementezi delegatii de search, adica UISearchDisplayDelegate
- in delegatii de tabel, intorci fie numarul de randuri, respectiv celula din cellForRowAtIndexPath, fie pt FRC-ul de baza, fie pt FRC-ul de search




