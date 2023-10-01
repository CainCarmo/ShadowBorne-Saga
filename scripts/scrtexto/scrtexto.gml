// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_Textos(){
	switch npc_nome
	{
		//NPCs
		case "comerciante":
			texto[0] = "Olá, me chamo Gideon, comerciante da Cidade Torre";
			texto[1] = "Em que posso ajudá-lo?";
			
			add_op("Sair", "resposta 1");
			add_op("Loja", "resposta 2");
		break;
		//respostas
		case "resposta 1":
			texto[0] = "Ola";
		break;
		case "resposta 2":
			texto[0] = "Navi";
		break;
		
	}
}
	
function add_op(_texto, _resposta)
{
	op[op_num] = _texto;
	op_resposta[op_num] = _resposta;
	
	op_num++;
}