part of space_shared;

class InputProcessingSystem implements System {
    
  bool enabled;
  int priority;
  
  List<Entity> _inputEntities;
  
  InputProcessingSystem() {
    _inputEntities = new List<Entity>();
  }
  
  void process(num timeDelta) {
    for (Entity entity in _inputEntities) {
      InputComponent input = entity.getComponent(InputComponent);
      RotationComponent rotation = entity.getComponent(RotationComponent);
      rotation.angleInDegrees += 80 * input.turn * timeDelta / 1000;
      AccelerationComponent acceleration = entity.getComponent(AccelerationComponent);
      acceleration.x = -sin(rotation.angleInRadians) * input.thrust * 100;
      acceleration.y = cos(rotation.angleInRadians) * input.thrust * 100;
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
