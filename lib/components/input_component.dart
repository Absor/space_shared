part of space_shared;

class InputComponent extends Component {
  int turn;
  int thrust;
  
  Map toJson() {
    return {"turn":turn,"thrust":thrust};
  }
}