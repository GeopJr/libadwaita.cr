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
  class ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      LibGObject.g_object_ref(self) unless transfer.full?
    end

    def finalize
      LibGObject.g_object_unref(self)
    end

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

    def self.is_valid_name(name : ::String) : Bool
      # g_param_spec_is_valid_name: (None)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_is_valid_name(name)
      GICrystal.to_bool(_retval)
    end

    def blurb : ::String?
      # g_param_spec_get_blurb: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_blurb(self)
      ::String.new(_retval) unless _retval.null?
    end

    def default_value : GObject::Value
      # g_param_spec_get_default_value: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_default_value(self)
      GObject::Value.new(_retval, GICrystal::Transfer::None)
    end

    def name : ::String
      # g_param_spec_get_name: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_name(self)
      ::String.new(_retval)
    end

    def name_quark : UInt32
      # g_param_spec_get_name_quark: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_name_quark(self)
      _retval
    end

    def nick : ::String
      # g_param_spec_get_nick: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_nick(self)
      ::String.new(_retval)
    end

    def qdata(quark : UInt32) : Pointer(Nil)?
      # g_param_spec_get_qdata: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_qdata(self, quark)
      Pointer(Void) unless _retval.null?
    end

    def redirect_target : GObject::ParamSpec?
      # g_param_spec_get_redirect_target: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_get_redirect_target(self)
      GObject::ParamSpec.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def set_qdata(quark : UInt32, data : Pointer(Nil)?) : Nil
      # g_param_spec_set_qdata: (Method)
      # @data: (nullable)
      # Returns: (transfer none)

      data = if data.nil?
               Pointer(Void).null
             else
               data.to_unsafe
             end

      LibGObject.g_param_spec_set_qdata(self, quark, data)
    end

    def sink : Nil
      # g_param_spec_sink: (Method)
      # Returns: (transfer none)

      LibGObject.g_param_spec_sink(self)
    end

    def steal_qdata(quark : UInt32) : Pointer(Nil)?
      # g_param_spec_steal_qdata: (Method)
      # Returns: (transfer none)

      _retval = LibGObject.g_param_spec_steal_qdata(self, quark)
      Pointer(Void) unless _retval.null?
    end
  end
end
