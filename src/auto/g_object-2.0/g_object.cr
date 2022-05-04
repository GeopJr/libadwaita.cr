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
require "./param_spec_pool.cr"
require "./param_spec_string.cr"
require "./param_spec_type_info.cr"
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
  # Mask containing the bits of #GParamSpec.flags which are reserved for GLib.
  PARAM_MASK = 255
  # #GParamFlags value alias for %G_PARAM_STATIC_NAME | %G_PARAM_STATIC_NICK | %G_PARAM_STATIC_BLURB.
  #
  # Since 2.13.0
  PARAM_STATIC_STRINGS = 224
  # Minimum shift count to be used for user defined flags, to be stored in
  # #GParamSpec.flags. The maximum allowed is 10.
  PARAM_USER_SHIFT = 8
  # A mask for all #GSignalFlags bits.
  SIGNAL_FLAGS_MASK = 511
  # A mask for all #GSignalMatchType bits.
  SIGNAL_MATCH_MASK = 63
  # A bit in the type number that's supposed to be left untouched.
  TYPE_FLAG_RESERVED_ID_BIT = 1_u64
  # An integer constant that represents the number of identifiers reserved
  # for types that are assigned at compile-time.
  TYPE_FUNDAMENTAL_MAX = 255
  # Shift value used in converting numbers to type IDs.
  TYPE_FUNDAMENTAL_SHIFT = 2
  # First fundamental type number to create a new fundamental type id with
  # G_TYPE_MAKE_FUNDAMENTAL() reserved for BSE.
  TYPE_RESERVED_BSE_FIRST = 32
  # Last fundamental type number reserved for BSE.
  TYPE_RESERVED_BSE_LAST = 48
  # First fundamental type number to create a new fundamental type id with
  # G_TYPE_MAKE_FUNDAMENTAL() reserved for GLib.
  TYPE_RESERVED_GLIB_FIRST = 22
  # Last fundamental type number reserved for GLib.
  TYPE_RESERVED_GLIB_LAST = 31
  # First available fundamental type number to create new fundamental
  # type id with G_TYPE_MAKE_FUNDAMENTAL().
  TYPE_RESERVED_USER_FIRST = 49
  # For string values, indicates that the string contained is canonical and will
  # exist for the duration of the process. See g_value_set_interned_string().
  VALUE_INTERNED_STRING = 268435456
  # If passed to G_VALUE_COLLECT(), allocated data won't be copied
  # but used verbatim. This does not affect ref-counted types like
  # objects. This does not affect usage of g_value_copy(), the data will
  # be copied if it is not ref-counted.
  VALUE_NOCOPY_CONTENTS = 134217728

  # Callbacks

  # A callback function used by the type system to finalize those portions
  # of a derived types class structure that were setup from the corresponding
  # GBaseInitFunc() function.
  #
  # Class finalization basically works the inverse way in which class
  # initialization is performed.
  #
  # See GClassInitFunc() for a discussion of the class initialization process.
  alias BaseFinalizeFunc = Proc(Nil)

  # A callback function used by the type system to do base initialization
  # of the class structures of derived types.
  #
  # This function is called as part of the initialization process of all derived
  # classes and should reallocate or reset all dynamic class members copied over
  # from the parent class.
  #
  # For example, class members (such as strings) that are not sufficiently
  # handled by a plain memory copy of the parent class into the derived class
  # have to be altered. See GClassInitFunc() for a discussion of the class
  # initialization process.
  alias BaseInitFunc = Proc(Nil)

  # A function to be called to transform @from_value to @to_value.
  #
  # If this is the @transform_to function of a binding, then @from_value
  # is the @source_property on the @source object, and @to_value is the
  # @target_property on the @target object. If this is the
  # @transform_from function of a %G_BINDING_BIDIRECTIONAL binding,
  # then those roles are reversed.
  alias BindingTransformFunc = Proc(GObject::Binding, GObject::Value, GObject::Value, Bool)

  # This function is provided by the user and should produce a copy
  # of the passed in boxed structure.
  alias BoxedCopyFunc = Proc(Pointer(Void))

  # This function is provided by the user and should free the boxed
  # structure passed.
  alias BoxedFreeFunc = Proc(Nil)

  # The type used for callback functions in structure definitions and function
  # signatures.
  #
  # This doesn't mean that all callback functions must take no  parameters and
  # return void. The required signature of a callback function is determined by
  # the context in which is used (e.g. the signal to which it is connected).
  #
  # Use G_CALLBACK() to cast the callback function to a #GCallback.
  alias Callback = Proc(Nil)

  # A callback function used by the type system to finalize a class.
  #
  # This function is rarely needed, as dynamically allocated class resources
  # should be handled by GBaseInitFunc() and GBaseFinalizeFunc().
  #
  # Also, specification of a GClassFinalizeFunc() in the #GTypeInfo
  # structure of a static type is invalid, because classes of static types
  # will never be finalized (they are artificially kept alive when their
  # reference count drops to zero).
  alias ClassFinalizeFunc = Proc(GObject::TypeClass, Nil)

  # A callback function used by the type system to initialize the class
  # of a specific type.
  #
  # This function should initialize all static class members.
  #
  # The initialization process of a class involves:
  #
  # - Copying common members from the parent class over to the
  #   derived class structure.
  # - Zero initialization of the remaining members not copied
  #   over from the parent class.
  # - Invocation of the GBaseInitFunc() initializers of all parent
  #   types and the class' type.
  # - Invocation of the class' GClassInitFunc() initializer.
  #
  # Since derived classes are partially initialized through a memory copy
  # of the parent class, the general rule is that GBaseInitFunc() and
  # GBaseFinalizeFunc() should take care of necessary reinitialization
  # and release of those class members that were introduced by the type
  # that specified these GBaseInitFunc()/GBaseFinalizeFunc().
  # GClassInitFunc() should only care about initializing static
  # class members, while dynamic class members (such as allocated strings
  # or reference counted resources) are better handled by a GBaseInitFunc()
  # for this type, so proper initialization of the dynamic class members
  # is performed for class initialization of derived types as well.
  #
  # An example may help to correspond the intend of the different class
  # initializers:
  #
  # |[<!-- language="C" -->
  # typedef struct {
  #   GObjectClass parent_class;
  #   gint         static_integer;
  #   gchar       *dynamic_string;
  # } TypeAClass;
  # static void
  # type_a_base_class_init (TypeAClass *class)
  # {
  #   class->dynamic_string = g_strdup ("some string");
  # }
  # static void
  # type_a_base_class_finalize (TypeAClass *class)
  # {
  #   g_free (class->dynamic_string);
  # }
  # static void
  # type_a_class_init (TypeAClass *class)
  # {
  #   class->static_integer = 42;
  # }
  #
  # typedef struct {
  #   TypeAClass   parent_class;
  #   gfloat       static_float;
  #   GString     *dynamic_gstring;
  # } TypeBClass;
  # static void
  # type_b_base_class_init (TypeBClass *class)
  # {
  #   class->dynamic_gstring = g_string_new ("some other string");
  # }
  # static void
  # type_b_base_class_finalize (TypeBClass *class)
  # {
  #   g_string_free (class->dynamic_gstring);
  # }
  # static void
  # type_b_class_init (TypeBClass *class)
  # {
  #   class->static_float = 3.14159265358979323846;
  # }
  # ]|
  #
  # Initialization of TypeBClass will first cause initialization of
  # TypeAClass (derived classes reference their parent classes, see
  # g_type_class_ref() on this).
  #
  # Initialization of TypeAClass roughly involves zero-initializing its fields,
  # then calling its GBaseInitFunc() type_a_base_class_init() to allocate
  # its dynamic members (dynamic_string), and finally calling its GClassInitFunc()
  # type_a_class_init() to initialize its static members (static_integer).
  # The first step in the initialization process of TypeBClass is then
  # a plain memory copy of the contents of TypeAClass into TypeBClass and
  # zero-initialization of the remaining fields in TypeBClass.
  # The dynamic members of TypeAClass within TypeBClass now need
  # reinitialization which is performed by calling type_a_base_class_init()
  # with an argument of TypeBClass.
  #
  # After that, the GBaseInitFunc() of TypeBClass, type_b_base_class_init()
  # is called to allocate the dynamic members of TypeBClass (dynamic_gstring),
  # and finally the GClassInitFunc() of TypeBClass, type_b_class_init(),
  # is called to complete the initialization process with the static members
  # (static_float).
  #
  # Corresponding finalization counter parts to the GBaseInitFunc() functions
  # have to be provided to release allocated resources at class finalization
  # time.
  alias ClassInitFunc = Proc(GObject::TypeClass, Nil)

  # The type used for marshaller functions.
  alias ClosureMarshal = Proc(GObject::Closure, GObject::Value?, UInt32, Enumerable(GObject::Value), Pointer(Void)?, Nil)

  # The type used for the various notification callbacks which can be registered
  # on closures.
  alias ClosureNotify = Proc(Pointer(Void)?, Nil)

  # A callback function used by the type system to initialize a new
  # instance of a type.
  #
  # This function initializes all instance members and allocates any resources
  # required by it.
  #
  # Initialization of a derived instance involves calling all its parent
  # types instance initializers, so the class member of the instance
  # is altered during its initialization to always point to the class that
  # belongs to the type the current initializer was introduced for.
  #
  # The extended members of @instance are guaranteed to have been filled with
  # zeros before this function is called.
  alias InstanceInitFunc = Proc(GObject::TypeInstance, Nil)

  # A callback function used by the type system to finalize an interface.
  #
  # This function should destroy any internal data and release any resources
  # allocated by the corresponding GInterfaceInitFunc() function.
  alias InterfaceFinalizeFunc = Proc(GObject::TypeInterface, Nil)

  # A callback function used by the type system to initialize a new
  # interface.
  #
  # This function should initialize all internal data and* allocate any
  # resources required by the interface.
  #
  # The members of @iface_data are guaranteed to have been filled with
  # zeros before this function is called.
  alias InterfaceInitFunc = Proc(GObject::TypeInterface, Nil)

  # The type of the @finalize function of #GObjectClass.
  alias ObjectFinalizeFunc = Proc(Nil)

  # The type of the @get_property function of #GObjectClass.
  alias ObjectGetPropertyFunc = Proc(GObject::Object, UInt32, GObject::Value, Nil)

  # The type of the @set_property function of #GObjectClass.
  alias ObjectSetPropertyFunc = Proc(GObject::Object, UInt32, GObject::Value, Nil)

  # The signal accumulator is a special callback function that can be used
  # to collect return values of the various callbacks that are called
  # during a signal emission.
  #
  # The signal accumulator is specified at signal creation time, if it is
  # left %NULL, no accumulation of callback return values is performed.
  # The return value of signal emissions is then the value returned by the
  # last callback.
  alias SignalAccumulator = Proc(GObject::SignalInvocationHint, GObject::Value, GObject::Value, Bool)

  # A simple function pointer to get invoked when the signal is emitted.
  #
  # Emission hooks allow you to tie a hook to the signal type, so that it will
  # trap all emissions of that signal, from any object.
  #
  # You may not attach these to signals created with the #G_SIGNAL_NO_HOOKS flag.
  alias SignalEmissionHook = Proc(GObject::SignalInvocationHint, UInt32, Enumerable(GObject::Value), Bool)

  # A callback function used for notification when the state
  # of a toggle reference changes.
  #
  # See also: g_object_add_toggle_ref()
  alias ToggleNotify = Proc(Pointer(Void)?, GObject::Object, Nil)

  # A callback function which is called when the reference count of a class
  # drops to zero.
  #
  # It may use g_type_class_ref() to prevent the class from being freed. You
  # should not call g_type_class_unref() from a #GTypeClassCacheFunc function
  # to prevent infinite recursion, use g_type_class_unref_uncached() instead.
  #
  # The functions have to check the class id passed in to figure
  # whether they actually want to cache the class of this type, since all
  # classes are routed through the same #GTypeClassCacheFunc chain.
  alias TypeClassCacheFunc = Proc(Pointer(Void)?, Bool)

  # A callback called after an interface vtable is initialized.
  #
  # See g_type_add_interface_check().
  alias TypeInterfaceCheckFunc = Proc(Pointer(Void)?, Nil)

  # The type of the @complete_interface_info function of #GTypePluginClass.
  alias TypePluginCompleteInterfaceInfo = Proc(GObject::TypePlugin, UInt64, UInt64, Nil)

  # The type of the @complete_type_info function of #GTypePluginClass.
  alias TypePluginCompleteTypeInfo = Proc(GObject::TypePlugin, UInt64, GObject::TypeInfo, Nil)

  # The type of the @unuse_plugin function of #GTypePluginClass.
  alias TypePluginUnuse = Proc(Nil)

  # The type of the @use_plugin function of #GTypePluginClass, which gets called
  # to increase the use count of @plugin.
  alias TypePluginUse = Proc(Nil)

  # The type of value transformation functions which can be registered with
  # g_value_register_transform_func().
  #
  # @dest_value will be initialized to the correct destination type.
  alias ValueTransform = Proc(GObject::Value, Nil)

  # A #GWeakNotify function can be added to an object as a callback that gets
  # triggered when the object is finalized.
  #
  # Since the object is already being disposed when the #GWeakNotify is called,
  # there's not much you could do with the object, apart from e.g. using its
  # address as hash-index or the like.
  alias WeakNotify = Proc(Pointer(Void)?, Nil)

  # Base class for all errors in this module.
  class GObjectError < RuntimeError
    # :nodoc:
    def initialize(error : Pointer(LibGLib::Error))
      message_ptr = error.value.message
      super(String.new(message_ptr)) unless message_ptr.null?
      LibGLib.g_error_free(error)
    end
  end

  # Enums

  # Flags
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

  # Errors

  # :nodoc:
  def raise_exception(error : Pointer(LibGLib::Error))
    GLib.raise_exception(error)
  end

  extend self
end

# Extra includes
require "../../../lib/gi-crystal/src/bindings/g_object/param_spec.cr"
require "../../../lib/gi-crystal/src/bindings/g_object/type.cr"
require "../../../lib/gi-crystal/src/bindings/g_object/value.cr"
