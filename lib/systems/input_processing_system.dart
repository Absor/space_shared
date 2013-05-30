part of space_shared;

class InputProcessingSystem implements System {
  
  num _degreeToRadian;
  
  bool enabled;
  int priority;
  
  List<Entity> _inputEntities;
  
  InputProcessingSystem() {
    _degreeToRadian = PI / 180;
    _inputEntities = new List<Entity>();
  }
  
  void process(num timeDelta) {
    for (Entity entity in _inputEntities) {
      InputComponent input = entity.getComponent(InputComponent);
      RotationComponent rotation = entity.getComponent(RotationComponent);
      rotation.angle += 80 * _degreeToRadian * input.turn * timeDelta / 1000;
      AccelerationComponent acceleration = entity.getComponent(AccelerationComponent);
      acceleration.x = -sin(rotation.angle) * input.thrust * 100;
      acceleration.y = cos(rotation.angle) * input.thrust * 100;
    }
  }
  
  void attachWorld(World world) {
  }
  
  void detachWorld() {
  }
  
  void entityActivation(Entity entity) {
    if (entity.hasComponent(InputComponent) &&
        entity.hasComponent(RotationComponent) &&
        entity.hasComponent(AccelerationComponent)) {
      _inputEntities.add(entity);
    }
  }
  
  void entityDeactivation(Entity entity) {
    _inputEntities.remove(entity);
  }
}
