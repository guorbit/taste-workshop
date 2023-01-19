divert(-1)
/*
*  This m4 file uses the following diverts:
*    1 for overall structure
*    5 for cast functions for GUI parameter subtypes
*    7 for num functions on Enum types
*    10 for signals
*    20 for functions
*/dnl
include(templates.m4)
divert(-1)
define(`m4_tmtc_handler_deploy_parachute',`parachute_deployer_deploy_parachute')dnl
define(`m4_tmtc_handler_deploy_parachute_provider',`parachute_deployer')dnl
define(`m4_tmtc_handler_get_acceleration',`gnc_controller_get_acceleration')dnl
define(`m4_tmtc_handler_get_acceleration_provider',`gnc_controller')dnl
define(`m4_tmtc_handler_get_altitude',`gnc_controller_get_altitude')dnl
define(`m4_tmtc_handler_get_altitude_provider',`gnc_controller')dnl
define(`m4_tmtc_handler_get_velocity',`gnc_controller_get_velocity')dnl
define(`m4_tmtc_handler_get_velocity_provider',`gnc_controller')dnl
divert(1)dnl
system taste;
/*
 *
 * Data View
 *
 */
include(dataview.if)

type math = abstract
    integer abs(integer);
    real abs(real);
    integer fix(real);
    real power(real, real);
    integer Shift_Left(integer, integer);
    integer Shift_Right(integer, integer);
    integer ceil(real);
    integer floor(real);
    real float(integer);
    integer round(real);
    real sin(real);
    real cos(real);
    integer trunc(real);
endabstract;

type enum_functions = abstract
undivert(7)
endabstract;


divert(20)

m4_c_function(parachute_deployer,// ERROR: Interface "deploy_parachute" in function "parachute_deployer" has unsupported kind: "SPORADIC_OPERATION"

)







include(tmtc_handler.if)



divert(1)
type assign = abstract
undivert(5)
endabstract;

/*
 *
 * Interface View
 *
 */
signal set_timer(integer);
signal reset_timer();

undivert(10)

undivert(20)

endsystem;

priorityrules
undivert(30)
endpriorityrules;
