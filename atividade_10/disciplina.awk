BEGIN {printf "Aluno:Situação:Média\n"}


$1 != "Aluno" {
	media = ($2 + $3 + $4) / 3;
	if (media >= 7){
		printf "%s:Aprovado:%.1f\n",$1,media;
	}
	else if (media < 4){
		printf "%s:Reprovado:%.1f\n",$1,media;
	}
	else{
		printf "%s:Final:%.1f\n",$1,media;
	}

	p1 = p1 + $2;
	p2 = p2 + $3;
	p3 = p3 + $4;
};


END {
	mediaP1= p1 / (NR-1);
	mediaP2= p2 / (NR-1);
	mediaP3= p3 / (NR-1);

	printf "Média das Provas: %.1f %.1f %.1f\n",mediaP1, mediaP2, mediaP3;
}
