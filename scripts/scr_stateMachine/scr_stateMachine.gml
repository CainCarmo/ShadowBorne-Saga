/// @function							StateMachine(_obj_entity)
/// @description						Modifica o estado do objeto passado por parâmetro
/// @param {Asset.GMObject} _obj_entity Objeto entidade (Herda de obj_entity)
function StateMachine (_obj_entity) {
	_obj_entity.sprite_index = SpriteMachine(_obj_entity);
	
	switch (_obj_entity.state) {
		case State.Die:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Die(_obj_entity);
			break;
		case State.Fly:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Fly(_obj_entity);
			break;
		case State.Hit:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Hit(_obj_entity);
			break;
		case State.Run:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Run(_obj_entity);
			break;
		case State.Dash:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Dash(_obj_entity);
			break;
		case State.Idle:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Idle(_obj_entity);
			break;
		case State.Jump:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Jump(_obj_entity);
			break;
		case State.Walk:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Walk(_obj_entity);
		case State.Break:
			break;
		case State.Climb:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Climb(_obj_entity);
			break;
		case State.Wield:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Wield(_obj_entity);
			break;
		case State.Attack:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Attack(_obj_entity);
			break;
		case State.Cutscene:
			if (_obj_entity.identity == Identity.Player) new PlayerStates().Cutscene(_obj_entity);
			break;
	}
}