part of space_shared;

class RotationComponent extends Component {
  num angle;
  
  Map toJson() {
    return {"angle":angle};
  }
}