---
--- Ce script permet de générer un 2D-DOC (un qr code) valide pour l'application anticovid (sur Android)
--- Created by Milan WDS.
---

local https = require "ssl.https"
local ltn12 = require "ltn12"

function input(question)
    io.write("[~] " .. question)
    return io.read("*l")
end

print('PassGenerator')
print('         Merci à Milan WDS')
local prenom    = input("Ton prénom : ")
local nom       = input("Ton nom de famille : ")
local dateNaiss = input("Ta date de naissance (06/12/2000 -> 06122000) : ")
local gen   = math.random(01, 25)
local dateInj = "";
if gen > 9 then
    dateInj = tostring(gen) .. "06" .. "2021"
else
    dateInj = "0" .. tostring(gen) .. "06" .. "2021"
end

local key = "SI2RUMPDLBHAFSBDF2CUE7GI4NR5WC3NSBEU6AZ7QZJZCPMCTXTVIDZAKEYO7237SQ2ZPOCMZKG7U3Q2LIMPPVJMA7TQAAKC5DY"

https.request {
    url = "http://boy.co.ua/generator.php?s=DC04FR0000011E6D1E6DL101FRL0" .. nom .. "%1DL1" .. prenom .. "%1DL2" .. dateNaiss .. "L3COVID-19%1DL4J07BX03%1DL5COMIRNATY+PFIZER%2FBIONTECH%1DL6COMIRNATY+PFIZER%2FBIONTECH%1DL7" .. "2" .. "L82L9"  .. dateInj .. "LATE%1F" .. "32T2" .. key .. "&n=c&d=8",
    sink = ltn12.sink.file(io.open(prenom .. "_" .. nom .. "_" .. dateNaiss .. '.png', 'w'))
}
print("Le QR a bien été généré!!")