T_Int32 = Simulink.AliasType;
T_Int32.BaseType = 'int32';
T_Int32.Description = 'range is (-2147483648, 2147483647)';

T_UInt32 = Simulink.AliasType;
T_UInt32.BaseType = 'uint32';
T_UInt32.Description = 'range is (0, 4294967295)';

T_Int8 = Simulink.AliasType;
T_Int8.BaseType = 'int8';
T_Int8.Description = 'range is (-128, 127)';

T_UInt8 = Simulink.AliasType;
T_UInt8.BaseType = 'uint8';
T_UInt8.Description = 'range is (0, 255)';

T_Boolean = Simulink.AliasType;
T_Boolean.BaseType = 'boolean';
T_Boolean.Description = 'A simple BOOLEAN';

MyInteger = Simulink.AliasType;
MyInteger.BaseType = 'uint16';
MyInteger.Description = 'range is (0, 10000)';

Acceleration = Simulink.AliasType;
Acceleration.BaseType = 'double';
Acceleration.Description = 'range is (0.0, 100.0)';

Velocity = Simulink.AliasType;
Velocity.BaseType = 'double';
Velocity.Description = 'range is (0.0, 1000.0)';

Altitude = Simulink.AliasType;
Altitude.BaseType = 'double';
Altitude.Description = 'range is (0.0, 10000.0)';

% Values for PID:
PID_value_gnc_controller = 0;
PID_value_parachute_deployer = 1;
PID_value_tmtc_handler = 2;
PID_value_env = 3;
PID = Simulink.AliasType;
PID.BaseType = 'int32';
PID.Description = 'values of ENUMERATED PID';


