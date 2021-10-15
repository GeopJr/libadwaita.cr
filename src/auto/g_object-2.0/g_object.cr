# Dependencies
require "../g_lib-2.0/g_lib.cr"

# C lib declaration
require "./lib_g_object.cr"

# Wrappers
require "./binding.cr"
require "./c_closure.cr"
require "./closure.cr"
require "./closure_notify_data.cr"
require "./enum_class.cr"
require "./enum_value.cr"
require "./flags_class.cr"
require "./flags_value.cr"
require "./initially_unowned.cr"
require "./interface_info.cr"
require "./object.cr"
require "./object_construct_param.cr"
require "./param_spec.cr"
require "./param_spec_boolean.cr"
require "./param_spec_boxed.cr"
require "./param_spec_char.cr"
require "./param_spec_double.cr"
require "./param_spec_enum.cr"
require "./param_spec_flags.cr"
require "./param_spec_float.cr"
require "./param_spec_g_type.cr"
require "./param_spec_int.cr"
require "./param_spec_int64.cr"
require "./param_spec_long.cr"
require "./param_spec_object.cr"
require "./param_spec_override.cr"
require "./param_spec_param.cr"
require "./param_spec_pointer.cr"
require "./param_spec_string.cr"
require "./param_spec_u_char.cr"
require "./param_spec_u_int.cr"
require "./param_spec_u_int64.cr"
require "./param_spec_u_long.cr"
require "./param_spec_unichar.cr"
require "./param_spec_value_array.cr"
require "./param_spec_variant.cr"
require "./parameter.cr"
require "./signal_invocation_hint.cr"
require "./type_class.cr"
require "./type_fundamental_info.cr"
require "./type_info.cr"
require "./type_instance.cr"
require "./type_interface.cr"
require "./type_module.cr"
require "./type_plugin.cr"
require "./type_plugin_class.cr"
require "./type_query.cr"
require "./type_value_table.cr"
require "./value_array.cr"

module GObject
  PARAM_MASK                =       255
  PARAM_STATIC_STRINGS      =       224
  PARAM_USER_SHIFT          =         8
  SIGNAL_FLAGS_MASK         =       511
  SIGNAL_MATCH_MASK         =        63
  TYPE_FLAG_RESERVED_ID_BIT =     1_u64
  TYPE_FUNDAMENTAL_MAX      =       255
  TYPE_FUNDAMENTAL_SHIFT    =         2
  TYPE_RESERVED_BSE_FIRST   =        32
  TYPE_RESERVED_BSE_LAST    =        48
  TYPE_RESERVED_GLIB_FIRST  =        22
  TYPE_RESERVED_GLIB_LAST   =        31
  TYPE_RESERVED_USER_FIRST  =        49
  VALUE_INTERNED_STRING     = 268435456
  VALUE_NOCOPY_CONTENTS     = 134217728

  @[Flags]
  enum BindingFlags : UInt32
    Default       = 0
    Bidirectional = 1
    SyncCreate    = 2
    InvertBoolean = 4

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.g_binding_flags_get_type
    end
  end

  @[Flags]
  enum ConnectFlags : UInt32
    After   = 1
    Swapped = 2
  end

  @[Flags]
  enum ParamFlags : UInt32
    Readable       =          1
    Writable       =          2
    Readwrite      =          3
    Construct      =          4
    ConstructOnly  =          8
    LaxValidation  =         16
    StaticName     =         32
    Private        =         32
    StaticNick     =         64
    StaticBlurb    =        128
    ExplicitNotify = 1073741824
    Deprecated     = 2147483648
  end

  @[Flags]
  enum SignalFlags : UInt32
    RunFirst            =      1
    RunLast             =      2
    RunCleanup          =      4
    NoRecurse           =      8
    Detailed            =     16
    Action              =     32
    NoHooks             =     64
    MustCollect         =    128
    Deprecated          =    256
    AccumulatorFirstRun = 131072
  end

  @[Flags]
  enum SignalMatchType : UInt32
    Id        =  1
    Detail    =  2
    Closure   =  4
    Func      =  8
    Data      = 16
    Unblocked = 32
  end

  @[Flags]
  enum TypeDebugFlags : UInt32
    Objects       = 1
    Signals       = 2
    InstanceCount = 4
    Mask          = 7
  end

  @[Flags]
  enum TypeFlags : UInt32
    Abstract      = 16
    ValueAbstract = 32
    Final         = 64
  end

  @[Flags]
  enum TypeFundamentalFlags : UInt32
    Classed        = 1
    Instantiatable = 2
    Derivable      = 4
    DeepDerivable  = 8
  end

  extend self
end

# Extra includes
require "./includes/type.cr"
require "./includes/value.cr"
