
#!/bin/bash
echo iniciando primer paso
rm ResultSensitiGammaEner.txt
rm ResultSensitiElectrons2.txt
#for X in {2000..100000..2000}
#for X in 0.01 0.1 1.0 10 100 10000 25000 50000 75000 100000 500000 1000000 2000000 5000000 10000000 25000000 50000000 100000000 250000000 500000000 1000000000
#for X in 0.00000001 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.025 0.050 0.075 0.10 0.50 1 2 5 10 25 50 100 250 500 1000 #NeutronsAlice
#for X in 0.029 0.034 0.043 0.055 0.071 0.09 0.11 0.12 0.19 0.22 0.29 0.35 0.44 0.58 0.71 0.9 1.1 1.2 1.9 2.9 3.5 4.2 5.5 7.1 9 11  13 17 21 29 35 43 56 72 80 100 150 300 500 #PhotonsCast
#for X in 0.15 0.3 0.55 0.85 1.5 2.5 3.5 4.5 7.5 30 75 #electron
#for X in 0.15 0.3 0.55 0.85 1.5 2.5 3.5 4.5 7.5 30 75 #Positrons
for X in 0.029 0.034 0.043 0.055 0.071 0.09 0.11 0.12 0.19 0.22 0.29 0.35 0.44 0.58 0.71 0.9 1.1 1.2 1.9 2.9 3.5 4.2 5.5 7.1 9 11 13 17 21 29 35 43 56 #gamma
do
rm Neutron.mac
#cat Neutron1.txt >> Neutron.mac
echo /gun/energy $X. MeV >> Neutron.mac
cat Neutron3.txt >> Neutron.mac


#echo /control/foreach Neutron.mac vardos '"'$X'"' >> Prue2.mac

echo INICIO
echo $X
#./TrGEMG4 ./NeutronOriginal.mac
./TrGEMG4 ./Neutron.mac
echo INTERMEDIO
echo $X

#root -l -q ./runSensitivity.C
echo $X >> RE11SensiGammas.txt
root -l -q ./runSensitivity.C >> RE11SensiGammas.txt

echo FINAL
echo $X
done