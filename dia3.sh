#!/bin/bash
echo "Iniciando o dia 3..."
date +%d/%m/%y
echo "Criacao das credenciais do usuario Fla..."
flapubprivkey=`freechains crypto pubpvt "Fla"`
flaprivkey=`echo $flapubprivkey | cut -d" " -f2`
flapubkey=`echo $flapubprivkey | cut -d" " -f1`
#echo "A chave privada do usuario Fla: $flaprivkey";
#echo "A chave publica do usuario Fla: $flapubkey";
echo "Criacao das credenciais do usuario Int..."
intpubprivkey=`freechains crypto pubpvt "Int"`
intprivkey=`echo $intpubprivkey | cut -d" " -f2`
intpubkey=`echo $intpubprivkey | cut -d" " -f1`
echo "Criacao das credenciais do usuario Sao..."
saopubprivkey=`freechains crypto pubpvt "Sao"`
saoprivkey=`echo $saopubprivkey | cut -d" " -f2`
saopubkey=`echo $saopubprivkey | cut -d" " -f1`
echo "Reps do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Postando na cadeia #Brasileirao com o usuario Fla a mensagem: Aqui e otopatamar!"
flapost=`freechains chain "#Brasileirao" post inline "Aqui e otopatamar!" --sign="$flaprivkey"`
echo "$flapost"
echo "Usuario Int e Sao dao dislike no post do usuario Fla:"
freechains chain "#Brasileirao" dislike "$flapost" --sign="$intprivkey"
freechains chain "#Brasileirao" dislike "$flapost" --sign="$saoprivkey"
echo "Postando na cadeia #Brasileirao com o usuario Fla a mensagem: Chororo!"
flapost2=`freechains chain "#Brasileirao" post inline "Chororo!" --sign="$flaprivkey"`
echo "$flapost2"
echo "Reps do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Postando na cadeia #Brasileirao com o usuario Fla a mensagem: E so vc dizer que tem estadio...!"
flapost3=`freechains chain "#Brasileirao" post inline "E so vc dizer que tem estadio...!" --sign="$flaprivkey"`
echo "$flapost3"
echo "Postando na cadeia #Brasileirao com o usuario Int a mensagem: VARMengo ta ai?...!"
intpost=`freechains chain "#Brasileirao" post inline "VARMengo ta ai?" --sign="$intprivkey"`
echo "$intpost"
echo "Usuario Fla da like no post do usuario Int:"
freechains chain "#Brasileirao" like "$intpost" --sign="$flaprivkey"
echo "Postando na cadeia #Brasileirao com o usuario Sao a mensagem: Time grande não cai"
saopost=`freechains chain "#Brasileirao" post inline "Time grande não cai" --sign="$saoprivkey"`
echo "$saopost"
echo "Usuario Fla da like no post usuario Sao:"
freechains chain "#Brasileirao" like "$saopost" --sign="$flaprivkey"
echo "Reps usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Fim dia 3"
