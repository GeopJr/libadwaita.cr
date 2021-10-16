require "../g_object-2.0/object"

module Gtk
  # A `GtkShortcut` describes a keyboard shortcut.
  #
  # It contains a description of how to trigger the shortcut via a
  # [class@Gtk.ShortcutTrigger] and a way to activate the shortcut
  # on a widget via a [class@Gtk.ShortcutAction].
  #
  # The actual work is usually done via [class@Gtk.ShortcutController],
  # which decides if and when to activate a shortcut. Using that controller
  # directly however is rarely necessary as various higher level
  # convenience APIs exist on `GtkWidget`s that make it easier to use
  # shortcuts in GTK.
  #
  # `GtkShortcut` does provide functionality to make it easy for users
  # to work with shortcuts, either by providing informational strings
  # for display purposes or by allowing shortcuts to be configured.
  class Shortcut < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def initialize(@pointer, transfer : GICrystal::Transfer)
      super
    end

    def initialize(*, action : Gtk::ShortcutAction? = nil, arguments : GLib::Variant? = nil, trigger : Gtk::ShortcutTrigger? = nil)
      _names = uninitialized Pointer(LibC::Char)[3]
      _values = StaticArray(LibGObject::Value, 3).new(LibGObject::Value.new)
      _n = 0

      if action
        (_names.to_unsafe + _n).value = "action".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, action)
        _n += 1
      end
      if arguments
        (_names.to_unsafe + _n).value = "arguments".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, arguments)
        _n += 1
      end
      if trigger
        (_names.to_unsafe + _n).value = "trigger".to_unsafe
        GObject::Value.init_g_value(_values.to_unsafe + _n, trigger)
        _n += 1
      end

      @pointer = LibGObject.g_object_new_with_properties(Shortcut.g_type, _n, _names, _values)
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

    def initialize(trigger : Gtk::ShortcutTrigger?, action : Gtk::ShortcutAction?)
      # gtk_shortcut_new: (Constructor)
      # @trigger: (transfer full) (nullable)
      # @action: (transfer full) (nullable)
      # Returns: (transfer full)

      trigger = if trigger.nil?
                  Pointer(Void).null
                else
                  trigger.to_unsafe
                end
      action = if action.nil?
                 Pointer(Void).null
               else
                 action.to_unsafe
               end
      LibGObject.g_object_ref(trigger)
      LibGObject.g_object_ref(action)

      _retval = LibGtk.gtk_shortcut_new(trigger, action)
      @pointer = _retval
    end

    def action : Gtk::ShortcutAction?
      # gtk_shortcut_get_action: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_shortcut_get_action(self)
      Gtk::ShortcutAction.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def arguments : GLib::Variant?
      # gtk_shortcut_get_arguments: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_shortcut_get_arguments(self)
      GLib::Variant.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def trigger : Gtk::ShortcutTrigger?
      # gtk_shortcut_get_trigger: (Method)
      # Returns: (transfer none)

      _retval = LibGtk.gtk_shortcut_get_trigger(self)
      Gtk::ShortcutTrigger.new(_retval, GICrystal::Transfer::None) unless _retval.null?
    end

    def action=(action : Gtk::ShortcutAction?) : Nil
      # gtk_shortcut_set_action: (Method)
      # @action: (transfer full) (nullable)
      # Returns: (transfer none)

      action = if action.nil?
                 Pointer(Void).null
               else
                 action.to_unsafe
               end
      LibGObject.g_object_ref(action)

      LibGtk.gtk_shortcut_set_action(self, action)
    end

    def arguments=(args : _?) : Nil
      # gtk_shortcut_set_arguments: (Method)
      # @args: (nullable)
      # Returns: (transfer none)

      args = if args.nil?
               Pointer(Void).null
             else
               args.to_unsafe
             end
      args = GLib::Variant.new(args) unless args.is_a?(GLib::Variant)

      LibGtk.gtk_shortcut_set_arguments(self, args)
    end

    def trigger=(trigger : Gtk::ShortcutTrigger?) : Nil
      # gtk_shortcut_set_trigger: (Method)
      # @trigger: (transfer full) (nullable)
      # Returns: (transfer none)

      trigger = if trigger.nil?
                  Pointer(Void).null
                else
                  trigger.to_unsafe
                end
      LibGObject.g_object_ref(trigger)

      LibGtk.gtk_shortcut_set_trigger(self, trigger)
    end
  end
end
