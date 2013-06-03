part of space_shared;

class RotationComponent extends Component {
  
  num _angleInDegrees;
  num _angleInRadians;
  
  num get angleInDegrees => _angleInDegrees;
  num get angleInRadians => _angleInRadians;
  
  set angleInDegrees(num angle) {
    _angleInDegrees = angle;
    _angleInRadians = angle * _degreeRadian;
  }
  
  set angleInRadians(num angle) {
    _angleInRadians = angle;
    _angleInDegrees = angle / _degreeRadian;
  }
  
  static num _degreeRadian = PI / 180;
  
  Map toJson() {
    return {"a":angleInDegrees};
  }
}