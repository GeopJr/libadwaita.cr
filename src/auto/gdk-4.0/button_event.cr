require "./event"

module Gdk
  # An event related to a button on a pointer device.
  @[GObject::GeneratedWrapper]
  class ButtonEvent < Event
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGObject::ObjectClass), class_init,
        sizeof(LibGdk::ButtonEvent), instance_init, 0)
    end

    def self.new(pointer : Pointer(Void), transfer : GICrystal::Transfer) : self
      instance = LibGObject.g_object_get_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY)
      return instance.as(self) if instance

      instance = {{ @type }}.allocate
      LibGObject.g_object_set_qdata(pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(instance.object_id))
      instance.initialize(pointer, transfer)
      GC.add_finalizer(instance)
      instance
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGdk.gdk_button_event_get_type
    end

    # Extract the button number from a button event.
    def button : UInt32
      # gdk_button_event_get_button: (Method)
      # Returns: (transfer none)

      # C call
      _retval = LibGdk.gdk_button_event_get_button(self)

      # Return value handling

      _retval
    end
  end
end
