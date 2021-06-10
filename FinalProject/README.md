# Proiectul final

Aplicatie realizata in colaborare cu Teodorovici Gavril
Proiectul este o aplicatie web releazata folosind java spring boot menita sa ajute creatorii de continut (youtub-eri, influence-ri, etc) sa mentina conexiunea cu comnutiatea lor mai facila atunci cand vor sa faca Q and A -uri sau giveaway-uri. Aplicatia permite conectare la facebook (pentru a avea acces la API-ul facebook si pentru a cere permisiuni pentru preluare datelor) si in functie de optiunea aleasa Q&A sau giveaway va face scraping obtinand toate comentariile acelei postari.
In cazul Q&A v-a filtra comentariile care se termina cu semnul intrebarii (eventual si un filtru de limbaj, sa le omita pe cele cu limbaj lecentios) dupa care va oferi optiunea creatorului de a extrage cate o intrebare random la care sa raspunda.
In cazul giveaway se vor extrage comentariile corespunzatoare (dupa niste criterii stabilite de creator) si se va oferi optiunea extragerii unui sai mai multor utilizatori

## Tehnologii utilizate din laboratorele anterioare sau de la cursul de Tehnologii web
- Java spring boot
- JPA
- JSP
- streams
- lucurul cu fisiere
- HTTPS (nu putem accesa API - ul de la facebook decat printr-o aplicatie care respecta protocolul https)

