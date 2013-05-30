part of space_shared;

class PositionComponent extends Component {
  num x;
  num y;
  
  Map toJson() {
    return {"x":x,"y":y};
  }
}