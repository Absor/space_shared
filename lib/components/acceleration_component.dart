part of space_shared;

class AccelerationComponent extends Component {
  num x;
  num y;
  
  Map toJson() {
    return {"x":x,"y":y};
  }
}