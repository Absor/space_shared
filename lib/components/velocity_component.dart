part of space_shared;

class VelocityComponent extends Component {
  num x;
  num y;
  
  Map toJson() {
    return {"x":x,"y":y};
  }
}