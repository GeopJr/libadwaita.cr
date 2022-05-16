module GObject
  # #GParamSpec is an object structure that encapsulates the metadata
  # required to specify parameters, such as e.g. #GObject properties.
  #
  # ## Parameter names # {#canonical-parameter-names}
  #
  # A property name consists of one or more segments consisting of ASCII letters
  # and digits, separated by either the `-` or `_` character. The first
  # character of a property name must be a letter. These are the same rules as
  # for signal naming (see g_signal_new()).
  #
  # When creating and looking up a #GParamSpec, either separator can be
  # used, but they cannot be mixed. Using `-` is considerably more
  # efficient, and is the ‘canonical form’. Using `_` is discouraged.
  @[GObject::GeneratedWrapper]
  class ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ParamSpecClass), class_init,
        sizeof(LibGObject::ParamSpec), instance_init, 0)
    end

    GICrystal.define_new_method(ParamSpec, g_param_spec_get_qdata, g_param_spec_set_qdata)

    # Initialize a new `ParamSpec`.
    def initialize
      @pointer = LibGObject.g_object_newv(self.class.g_type, 0, Pointer(Void).null)
      LibGObject.g_object_ref_sink(self) if LibGObject.g_object_is_floating(self) == 1
      LibGObject.g_object_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_param_spec_ref(self) if transfer.none?
    end

    # Called by the garbage collector. Decreases the reference count of object.
    # (i.e. its memory is freed).
    def finalize
      {% if flag?(:debugmemory) %}
        LibC.printf("~%s at %p - ref count: %d\n", self.class.name.to_unsafe, self, ref_count)
      {% end %}
      LibGObject.g_param_spec_set_qdata(self, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).null)
      LibGObject.g_param_spec_set_qdata(self, GICrystal::GC_COLLECTED_QDATA_KEY, Pointer(Void).new(0x1))
      LibGObject.g_param_spec_unref(self)
    end

    # Returns a pointer to the C object.
    def to_unsafe
      @pointer
    end

    # Cast a `GObject::Object` to `ParamSpec`, throw `TypeCastError` if cast can't be made.
    def self.cast(obj : GObject::Object) : self
      cast?(obj) || raise TypeCastError.new("can't cast #{typeof(obj).name} to ParamSpec")
    end

    # Cast a `GObject::Object` to `ParamSpec`, returns nil if cast can't be made.
    def self.cast?(obj : GObject::Object) : self?
      new(obj.to_unsafe, GICrystal::Transfer::None) unless LibGObject.g_type_check_instance_is_a(obj, g_type).zero?
    end

    # Returns GObject reference counter.
    def ref_count
      to_unsafe.as(Pointer(LibGObject::Object)).value.ref_count
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.intern
    end

    # Validate a property name for a #GParamSpec. This can be useful for
    # dynamically-generated properties which need to be validated at run-time
    # before actually trying to create them.
    #
    # See [canonical parameter names][canonical-parameter-names] for details of
    # the rules for valid names.
    def self.is_valid_name(name : ::String) : Bool
      # g_param_spec_is_valid_name: (None)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_is_valid_name(name)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Get the short description of a #GParamSpec.
    def blurb : ::String?
      # g_param_spec_get_blurb: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_blurb(@pointer)

      # Return value handling

      ::String.new(_retval) unless _retval.null?
    end

    # Gets the default value of @pspec as a pointer to a #GValue.
    #
    # The #GValue will remain valid for the life of @pspec.
    def default_value : GObject::Value
      # g_param_spec_get_default_value: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_default_value(@pointer)

      # Return value handling

      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    # Get the name of a #GParamSpec.
    #
    # The name is always an "interned" string (as per g_intern_string()).
    # This allows for pointer-value comparisons.
    def name : ::String
      # g_param_spec_get_name: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_name(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets the GQuark for the name.
    def name_quark : UInt32
      # g_param_spec_get_name_quark: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_name_quark(@pointer)

      # Return value handling

      _retval
    end

    # Get the nickname of a #GParamSpec.
    def nick : ::String
      # g_param_spec_get_nick: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_nick(@pointer)

      # Return value handling

      ::String.new(_retval)
    end

    # Gets back user data pointers stored via g_param_spec_set_qdata().
    def qdata(quark : UInt32) : Pointer(Void)?
      # g_param_spec_get_qdata: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_qdata(@pointer, quark)

      # Return value handling

      _retval unless _retval.null?
    end

    # If the paramspec redirects operations to another paramspec,
    # returns that paramspec. Redirect is used typically for
    # providing a new implementation of a property in a derived
    # type while preserving all the properties from the parent
    # type. Redirection is established by creating a property
    # of type #GParamSpecOverride. See g_object_class_override_property()
    # for an example of the use of this capability.
    def redirect_target : GObject::ParamSpec?
      # g_param_spec_get_redirect_target: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_get_redirect_target(@pointer)

      # Return value handling

      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets an opaque, named pointer on a #GParamSpec. The name is
    # specified through a #GQuark (retrieved e.g. via
    # g_quark_from_static_string()), and the pointer can be gotten back
    # from the @pspec with g_param_spec_get_qdata().  Setting a
    # previously set user data pointer, overrides (frees) the old pointer
    # set, using %NULL as pointer essentially removes the data stored.
    def set_qdata(quark : UInt32, data : Pointer(Void)?) : Nil
      # g_param_spec_set_qdata: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      # C call
      LibGObject.g_param_spec_set_qdata(@pointer, quark, data)

      # Return value handling
    end

    # The initial reference count of a newly created #GParamSpec is 1,
    # even though no one has explicitly called g_param_spec_ref() on it
    # yet. So the initial reference count is flagged as "floating", until
    # someone calls `g_param_spec_ref (pspec); g_param_spec_sink
    # (pspec);` in sequence on it, taking over the initial
    # reference count (thus ending up with a @pspec that has a reference
    # count of 1 still, but is not flagged "floating" anymore).
    def sink : Nil
      # g_param_spec_sink: (Method)
      # Returns: (transfer none)

      # C call
      LibGObject.g_param_spec_sink(@pointer)

      # Return value handling
    end

    # Gets back user data pointers stored via g_param_spec_set_qdata()
    # and removes the @data from @pspec without invoking its destroy()
    # function (if any was set).  Usually, calling this function is only
    # required to update user data pointers with a destroy notifier.
    def steal_qdata(quark : UInt32) : Pointer(Void)?
      # g_param_spec_steal_qdata: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGObject.g_param_spec_steal_qdata(@pointer, quark)

      # Return value handling

      _retval unless _retval.null?
    end
  end
end
