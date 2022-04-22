require "../g_object-2.0/object"

module Gtk
  # A `GtkShortcut` describes a keyboard shortcut.
  #
  # It contains a description of how to trigger the shortcut via a
  # `Gtk#ShortcutTrigger` and a way to activate the shortcut
  # on a widget via a `Gtk#ShortcutAction`.
  #
  # The actual work is usually done via `Gtk#ShortcutController`,
  # which decides if and when to activate a shortcut. Using that controller
  # directly however is rarely necessary as various higher level
  # convenience APIs exist on `GtkWidget`s that make it easier to use
  # shortcuts in GTK.
  #
  # `GtkShortcut` does provide functionality to make it easy for users
  # to work with shortcuts, either by providing informational strings
  # for display purposes or by allowing shortcuts to be configured.
  @[GObject::GeneratedWrapper]
  class Shortcut < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ShortcutClass), class_init,
        sizeof(LibGtk::Shortcut), instance_init, 0)
    end

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action : Gtk::ShortcutAction? = nil, arguments : GLib::Variant? = nil, trigger : Gtk::ShortcutTrigger? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if !action.nil?
        (_names.to_unsafe + _n).value = "action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action)
        _n += 1
      end
      if !arguments.nil?
        (_names.to_unsafe + _n).value = "arguments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, arguments)
        _n += 1
      end
      if !trigger.nil?
        (_names.to_unsafe + _n).value = "trigger".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, trigger)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Shortcut.g_type, _n, _names, _values)

      _n.times do |i|
        LibGObject.g_value_unset(_values.to_unsafe + i)
      end
    end

    # Returns the type id (GType) registered in GLib type system.
    def self.g_type : UInt64
      LibGtk.gtk_shortcut_get_type
    end

    def action=(value : Gtk::ShortcutAction?) : Gtk::ShortcutAction?
      unsafe_value = value

      LibGObject.g_object_set(self, "action", unsafe_value, Pointer(Void).null)
      value
    end

    def action : Gtk::ShortcutAction?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "action", pointerof(value), Pointer(Void).null)
      Gtk::ShortcutAction.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def arguments=(value : GLib::Variant?) : GLib::Variant?
      unsafe_value = value

      LibGObject.g_object_set(self, "arguments", unsafe_value, Pointer(Void).null)
      value
    end

    def arguments : GLib::Variant?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "arguments", pointerof(value), Pointer(Void).null)
      GLib::Variant.new(value, GICrystal::Transfer::None) unless value.null?
    end

    def trigger=(value : Gtk::ShortcutTrigger?) : Gtk::ShortcutTrigger?
      unsafe_value = value

      LibGObject.g_object_set(self, "trigger", unsafe_value, Pointer(Void).null)
      value
    end

    def trigger : Gtk::ShortcutTrigger?
      # Returns: None

      value = uninitialized Pointer(Void)
      LibGObject.g_object_get(self, "trigger", pointerof(value), Pointer(Void).null)
      Gtk::ShortcutTrigger.new(value, GICrystal::Transfer::None) unless value.null?
    end

    # Creates a new `GtkShortcut` that is triggered by
    # @trigger and then activates @action.
    def initialize(trigger : Gtk::ShortcutTrigger?, action : Gtk::ShortcutAction?)
      # gtk_shortcut_new: (Constructor)
      # @trigger: (transfer full) (nullable)
      # @action: (transfer full) (nullable)
      # Returns: (transfer full)

      # Generator::NullableArrayPlan
      trigger = if trigger.nil?
                  Pointer(Void).null
                else
                  trigger.to_unsafe
                end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(trigger)
      # Generator::NullableArrayPlan
      action = if action.nil?
                 Pointer(Void).null
               else
                 action.to_unsafe
               end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(action)

      # C call
      _retval = LibGtk.gtk_shortcut_new(trigger, action)

      # Return value handling

      @pointer = _retval
    end

    # Gets the action that is activated by this shortcut.
    def action : Gtk::ShortcutAction?
      # gtk_shortcut_get_action: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_get_action(self)

      # Return value handling

      Gtk::ShortcutAction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the arguments that are passed when activating the shortcut.
    def arguments : GLib::Variant?
      # gtk_shortcut_get_arguments: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_get_arguments(self)

      # Return value handling

      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Gets the trigger used to trigger @self.
    def trigger : Gtk::ShortcutTrigger?
      # gtk_shortcut_get_trigger: (Method | Getter)
      # Returns: (transfer none)

      # C call
      _retval = LibGtk.gtk_shortcut_get_trigger(self)

      # Return value handling

      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    # Sets the new action for @self to be @action.
    def action=(action : Gtk::ShortcutAction?) : Nil
      # gtk_shortcut_set_action: (Method | Setter)
      # @action: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      action = if action.nil?
                 Pointer(Void).null
               else
                 action.to_unsafe
               end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(action)

      # C call
      LibGtk.gtk_shortcut_set_action(self, action)

      # Return value handling
    end

    # Sets the arguments to pass when activating the shortcut.
    def arguments=(args : _?) : Nil
      # gtk_shortcut_set_arguments: (Method | Setter)
      # @args: (nullable)
      # Returns: (transfer none)

      # Generator::HandmadeArgPlan
      args = if args.nil?
               Pointer(Void).null
             elsif !args.is_a?(GLib::Variant)
               GLib::Variant.new(args).to_unsafe
             else
               args.to_unsafe
             end

      # C call
      LibGtk.gtk_shortcut_set_arguments(self, args)

      # Return value handling
    end

    # Sets the new trigger for @self to be @trigger.
    def trigger=(trigger : Gtk::ShortcutTrigger?) : Nil
      # gtk_shortcut_set_trigger: (Method | Setter)
      # @trigger: (transfer full) (nullable)
      # Returns: (transfer none)

      # Generator::NullableArrayPlan
      trigger = if trigger.nil?
                  Pointer(Void).null
                else
                  trigger.to_unsafe
                end

      # Generator::TransferFullArgPlan
      LibGObject.g_object_ref_sink(trigger)

      # C call
      LibGtk.gtk_shortcut_set_trigger(self, trigger)

      # Return value handling
    end
  end
end
