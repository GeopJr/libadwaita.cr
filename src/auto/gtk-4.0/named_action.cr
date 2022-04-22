require "./shortcut_action"

module Gtk
  # A `GtkShortcutAction` that activates an action by name.
  @[GObject::GeneratedWrapper]
  class NamedAction < ShortcutAction
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::NamedActionClass), class_init,
        sizeof(LibGtk::NamedAction), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action_name : ::String? = nil)
      _names = uninitialized Pointer(LibC::Char)[1]
      _values = StaticArray(LibGObject::Value, 1).new(LibGObject::Value.new)
      _n = 0

      if !action_name.nil?
        (_names.to_unsafe + _n).value = "action-name".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action_name)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(NamedAction.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_named_action_get_type
    end

    def action_name=(value : ::String) : ::String
      unsafe_value = value

      LibGObject.g_object_set(self, "action-name", unsafe_value, Pointer(Void).null)
      value
    end

    def action_name : ::String
      # Returns: None

      value = uninitialized Pointer(LibC::Char)
      LibGObject.g_object_get(self, "action-name", pointerof(value), Pointer(Void).null)
      ::String.new(value)
    end

    # Creates an action that when activated, activates
    # the named action on the widget.
    #
    # It also passes the given arguments to it.
    #
    # See `Gtk::Widget#insert_action_group` for
    # how to add actions to widgets.
    def initialize(name : ::String)
      # gtk_named_action_new: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_named_action_new(name)

      # Return value handling

      @pointer = _retval
    end

    # Returns the name of the action that will be activated.
    def action_name : ::String
      # gtk_named_action_get_action_name: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_named_action_get_action_name(self)

      # Return value handling

      ::String.new(_retval)
    end
  end
end
