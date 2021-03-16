#!/bin/bash
echo "Iniciando o dia 1..."
date +%d/%m/%y
echo "Conectando no forum publico #Brasileirao:"
freechains chains join "#Brasileirao"
echo "Criacao das credenciais do usuario Fla..."
flapubprivkey=`freechains crypto pubpvt "Fla"`
flaprivkey=`echo $flapubprivkey | cut -d" " -f2`
flapubkey=`echo $flapubprivkey | cut -d" " -f1`
#echo "A chave privada do usuario Fla: $flaprivkey";
#echo "A chave publica do usuario Fla: $flapubkey";
echo "Postando na cadeia #Brasileirao com o usuario Fla a mensagem: Curtiram o VAR?"
freechains chain "#Brasileirao" post inline "Curtiram o VAR?" --sign="$flaprivkey"
echo "Criacao das credenciais do usuario Int..."
intpubprivkey=`freechains crypto pubpvt "Int"`
intprivkey=`echo $intpubprivkey | cut -d" " -f2`
intpubkey=`echo $intpubprivkey | cut -d" " -f1`
echo "Postando na cadeia #Brasileirao com o usuario Int a mensagem: Time pilantra!"
freechains chain "#Brasileirao" post inline "Time pilantra!" --sign="$intprivkey"
echo "Criacao das credenciais do usuario Sao..."
saopubprivkey=`freechains crypto pubpvt "Sao"`
saoprivkey=`echo $saopubprivkey | cut -d" " -f2`
saopubkey=`echo $saopubprivkey | cut -d" " -f1`
echo "Postando na cadeia #Brasileirao com o usuario Sao a mensagem: Libertadores!"
saopost=`freechains chain "#Brasileirao" post inline "Libertadores!" --sign="$saoprivkey"`
echo "$saopost"
echo "Reps do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Usuario Fla da um like no post do usuario Sao:"
freechains chain "#Brasileirao" like "$saopost" --sign="$flaprivkey"
echo "Reps atualizados do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps atualizados do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps atualizados do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Usuario Fla posta a mentira Octacampeao:"
freechains chain "#Brasileirao" post inline "Octacampeao!" --sign="$flaprivkey"
echo "Reps finais do dia 1 do usuario Sao:"
freechains chain "#Brasileirao" reps "$saopubkey"
echo "Reps finais do dia 1 do usuario Int:"
freechains chain "#Brasileirao" reps "$intpubkey"
echo "Reps finais do dia 1 do usuario Fla:"
freechains chain "#Brasileirao" reps "$flapubkey"
echo "Fim do dia 1!"



