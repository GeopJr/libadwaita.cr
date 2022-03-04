require "./param_spec"

module GObject
  # A #GParamSpec derived structure that contains the meta data for pointer properties.
  class ParamSpecPointer < ParamSpec
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGObject.intern
    end
  end
end
