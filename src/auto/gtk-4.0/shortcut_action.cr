require "../g_object-2.0/object"

module Gtk
  # `GtkShortcutAction` encodes an action that can be triggered by a
  # keyboard shortcut.
  #
  # `GtkShortcutActions` contain functions that allow easy presentation
  # to end users as well as being printed for debugging.
  #
  # All `GtkShortcutActions` are immutable, you can only specify their
  # properties during construction. If you want to change a action, you
  # have to replace it with a new one. If you need to pass arguments to
  # an action, these are specified by the higher-level `GtkShortcut` object.
  #
  # To activate a `GtkShortcutAction` manually, `Gtk::ShortcutAction#activate`
  # can be called.
  #
  # GTK provides various actions:
  #
  #  - `Gtk#MnemonicAction`: a shortcut action that calls
  #    gtk_widget_mnemonic_activate()
  #  - `Gtk#CallbackAction`: a shortcut action that invokes
  #    a given callback
  #  - `Gtk#SignalAction`: a shortcut action that emits a
  #    given signal
  #  - `Gtk#ActivateAction`: a shortcut action that calls
  #    gtk_widget_activate()
  #  - `Gtk#NamedAction`: a shortcut action that calls
  #    gtk_widget_activate_action()
  #  - `Gtk#NothingAction`: a shortcut action that does nothing
  @[GObject::GeneratedWrapper]
  class ShortcutAction < GObject::Object
    @pointer : Pointer(Void)

    # :nodoc:
    def self._register_derived_type(klass : Class, class_init, instance_init)
      LibGObject.g_type_register_static_simple(g_type, klass.name,
        sizeof(LibGtk::ShortcutActionClass), class_init,
        sizeof(LibGtk::ShortcutAction), instance_init, 0)
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
      LibGtk.gtk_shortcut_action_get_type
    end

    # Tries to parse the given string into an action.
    #
    # On success, the parsed action is returned. When parsing
    # failed, %NULL is returned.
    #
    # The accepted strings are:
    #
    # - `nothing`, for `GtkNothingAction`
    # - `activate`, for `GtkActivateAction`
    # - `mnemonic-activate`, for `GtkMnemonicAction`
    # - `action(NAME)`, for a `GtkNamedAction` for the action named `NAME`
    # - `signal(NAME)`, for a `GtkSignalAction` for the signal `NAME`
    def self.parse_string(string : ::String) : self?
      # gtk_shortcut_action_parse_string: (Constructor)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_action_parse_string(string)

      # Return value handling

      Gtk::ShortcutAction.new(_retval, GICrystal::Transfer::Full) unless _retval.null?
    end

    # Activates the action on the @widget with the given @args.
    #
    # Note that some actions ignore the passed in @flags, @widget or @args.
    #
    # Activation of an action can fail for various reasons. If the action
    # is not supported by the @widget, if the @args don't match the action
    # or if the activation otherwise had no effect, %FALSE will be returned.
    def activate(flags : Gtk::ShortcutActionFlags, widget : Gtk::Widget, args : _?) : Bool
      # gtk_shortcut_action_activate: (Method)
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
      _retval = LibGtk.gtk_shortcut_action_activate(self, flags, widget, args)

      # Return value handling

      GICrystal.to_bool(_retval)
    end

    # Prints the given action into a string for the developer.
    #
    # This is meant for debugging and logging.
    #
    # The form of the representation may change at any time and is
    # not guaranteed to stay identical.
    def print(string : GLib::String) : Nil
      # gtk_shortcut_action_print: (Method)
      # Returns: (transfer none)

      # C call
      LibGtk.gtk_shortcut_action_print(self, string)

      # Return value handling
    end

    # Prints the given action into a human-readable string.
    #
    # This is a small wrapper around `Gtk::ShortcutAction#print`
    # to help when debugging.
    def to_string : ::String
      # gtk_shortcut_action_to_string: (Method)
      # Returns: (transfer full)

      # C call
      _retval = LibGtk.gtk_shortcut_action_to_string(self)

      # Return value handling

      GICrystal.transfer_full(_retval)
    end
  end
end
