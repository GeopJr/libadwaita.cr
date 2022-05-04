require "./shortcut_action"

module Gtk
  # A `GtkShortcut`Action that emits a signal.
  #
  # Signals that are used in this way are referred to as keybinding signals,
  # and they are expected to be defined with the %G_SIGNAL_ACTION flag.
  @[GObject::GeneratedWrapper]
  class SignalAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::SignalActionClass), class_init,
        sizeof(LibGtk::SignalAction), instance_init, 0)
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

    def initialize(*, signal_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !signal_name.nil?
        (_names.to_unsafe + _n).value = "signal-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, signal_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(SignalAction.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end

      LibGObject.g_object_set_qdata(@pointer, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_signal_action_get_type
    end

    def signal_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "signal-name", unsafe_value, Pointer(Void).null)
      value
    end

    def signal_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "signal-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates an action that when activated, emits the given action signal
    # on the provided widget.
    #
    # It will also unpack the args into arguments passed to the signal.
    def initialize(signal_name : ::String)
      # gtk_signal_action_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_signal_action_new(signal_name)

      # Return value handling

      @pointer = _retval
      LibGObject.g_object_set_qdata(_retval, GICrystal::INSTANCE_QDATA_KEY, Pointer(Void).new(object_id))
    end

    # Returns the name of the signal that will be emitted.
    def signal_name : ::String
      # gtk_signal_action_get_signal_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_signal_action_get_signal_name(self)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
