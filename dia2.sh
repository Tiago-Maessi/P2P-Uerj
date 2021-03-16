#!/bin/bash
echo "Iniciando o dia 2..."
date +%d/%m/%y
echo "Conectando no forum publico #Brasileirao:"
freechains chains join "#Brasileirao"
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
echo "Postando na cadeia #Brasileirao com o usuario Int a mensagem: Joguei modulo verde!"
intpost=`freechains chain "#Brasileirao" post inline "Joguei modulo verde!" --sign="$intprivkey"`
echo "$intpost"
echo "Usuario Fla da um like no post do usuario Sao:"
freechains chain "#Brasileirao" like "$intpost" --sign="$flaprivkey"
freechains chain "#Brasileirao" like "$intpost" --sign="$flaprivkey"
freechains chain "#Brasileirao" like "$intpost" --sign="$flaprivkey"
freechains chain "#Brasileirao" like "$intpost" --sign="$flaprivkey"
echo "Reps do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Postando na cadeia #Brasileirao com o usuario Sao a mensagem: Titulo reconhecido!"
saopost=`freechains chain "#Brasileirao" post inline "Titulo reconhecido!" --sign="$saoprivkey"`
echo "$saopost"
echo "Usuario Int da dois likes no post do usuario Sao:"
freechains chain "#Brasileirao" like "$saopost" --sign="$intprivkey"
freechains chain "#Brasileirao" like "$saopost" --sign="$intprivkey"
echo "Reps do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Fim do dia 2!"
